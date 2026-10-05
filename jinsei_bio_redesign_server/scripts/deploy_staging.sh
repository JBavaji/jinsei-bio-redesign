#!/usr/bin/env bash
set -e

PROJECT_ID=${GCP_PROJECT_ID:-"jinsei-bio-redesign"}
REGION="us-central1"
SERVICE_NAME="jinsei-bio-server"
IMAGE_TAG="gcr.io/${PROJECT_ID}/${SERVICE_NAME}:latest"

echo "🚀 Step 1: Building & pushing Docker image to Artifact Registry..."
gcloud builds submit --tag "${IMAGE_TAG}" ./development/jinsei-bio-redesign/jinsei_bio_redesign_server

echo "☁️ Step 2: Deploying container to Google Cloud Run..."
gcloud run deploy "${SERVICE_NAME}" \
  --image "${IMAGE_TAG}" \
  --platform managed \
  --region "${REGION}" \
  --allow-unauthenticated \
  --port 8080 \
  --min-instances 0 \
  --max-instances 3 \
  --set-env-vars "RUN_MODE=staging,APP_MODE=UNOFFICIAL_DEMO"

echo "🔍 Step 3: Fetching live Service URL..."
SERVICE_URL=$(gcloud run services describe "${SERVICE_NAME}" --region "${REGION}" --format 'value(status.url)')

echo "✅ Staging Deployment Complete!"
echo "🔗 Live Staging API URL: ${SERVICE_URL}"
echo "🧪 Test Health Endpoint: curl -i ${SERVICE_URL}/health/"
