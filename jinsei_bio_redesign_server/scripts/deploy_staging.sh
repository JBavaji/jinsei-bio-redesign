#!/usr/bin/env bash
set -e

# REPO_ROOT: resolve monorepo root containing root pubspec.yaml
if [ -f "./pubspec.yaml" ] && [ -d "./jinsei_bio_redesign_server" ]; then
  REPO_ROOT="$(pwd)"
else
  REPO_ROOT="$(cd "$(pwd)/.." && pwd)"
fi

PROJECT_ID=${GCP_PROJECT_ID:-"jinsei-bio-redesign"}
REGION="us-central1"
SERVICE_NAME="jinsei-bio-server"
IMAGE_TAG="gcr.io/${PROJECT_ID}/${SERVICE_NAME}:latest"

echo "🚀 Step 1: Submitting Docker build to Cloud Build..."
echo "Build Context: ${REPO_ROOT}"
BUILD_ID=$(gcloud builds submit \
  --async \
  --quiet \
  --project "${PROJECT_ID}" \
  --config "jinsei_bio_redesign_server/cloudbuild.yaml" \
  "${REPO_ROOT}" \
  --format='value(id)')

echo "⏳ Waiting for Cloud Build (${BUILD_ID}) to complete..."
while true; do
  STATUS=$(gcloud builds describe "${BUILD_ID}" \
    --project "${PROJECT_ID}" \
    --format='value(status)' 2>/dev/null || echo "WORKING")
  echo "Build status: ${STATUS}"
  if [ "${STATUS}" = "SUCCESS" ]; then
    echo "🎉 Cloud Build finished successfully!"
    break
  elif [ "${STATUS}" = "FAILURE" ] || [ "${STATUS}" = "CANCELLED" ] || [ "${STATUS}" = "TIMEOUT" ]; then
    echo "❌ Cloud Build failed with status: ${STATUS}"
    exit 1
  fi
  sleep 5
done

echo "☁️ Step 2: Deploying container to Google Cloud Run..."
gcloud run deploy "${SERVICE_NAME}" \
  --quiet \
  --image "${IMAGE_TAG}" \
  --platform managed \
  --region "${REGION}" \
  --project "${PROJECT_ID}" \
  --allow-unauthenticated \
  --port 8080 \
  --min-instances 0 \
  --max-instances 3 \
  --set-env-vars "RUN_MODE=staging,APP_MODE=UNOFFICIAL_DEMO"

echo "🔍 Step 3: Fetching live Service URL..."
SERVICE_URL=$(gcloud run services describe "${SERVICE_NAME}" \
  --region "${REGION}" \
  --project "${PROJECT_ID}" \
  --format 'value(status.url)')

echo "✅ Staging Deployment Complete!"
echo "🔗 Live Staging API URL: ${SERVICE_URL}"
echo "🧪 Test Health Endpoint: curl -i ${SERVICE_URL}/health/"
