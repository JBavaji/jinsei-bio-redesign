# 🔑 GitHub Repository Secrets Setup Guide for Google Cloud Run CI/CD

> **Author:** Antigravity AI & DevOps Lead (Marcus Brody)  
> **Target Audience:** Engineering Team & Repository Administrators  
> **Project:** Jinsei Bio Redesign (`jinsei-bio-redesign`)  
> **Target Secret:** `GCP_SA_KEY` (Used in `.github/workflows/deploy-serverpod-cloudrun.yml`)

---

## 🏛️ Overview

To enable automated deployment of the Serverpod backend container to Google Cloud Run via GitHub Actions, the workflow requires a Google Cloud Service Account JSON key stored securely as a GitHub Repository Secret named `GCP_SA_KEY`.

---

## 🛠️ Step 1: Create & Configure GCP Service Account

### Option A: Using Google Cloud CLI (`gcloud`)

Run the following commands in your terminal:

```bash
# 1. Set your GCP Project ID
export PROJECT_ID="jinsei-bio-redesign"
gcloud config set project $PROJECT_ID

# 2. Create the GitHub Actions Deployer Service Account
gcloud iam service-accounts create github-deployer \
    --display-name="GitHub Actions Cloud Run Deployer"

# 3. Grant Required IAM Roles
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:github-deployer@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/run.admin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:github-deployer@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/cloudbuild.builds.editor"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:github-deployer@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/storage.admin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:github-deployer@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"

# 4. Generate & Download JSON Key
gcloud iam service-accounts keys create ~/gcp-github-deployer-key.json \
    --iam-account=github-deployer@${PROJECT_ID}.iam.gserviceaccount.com
```

---

### Option B: Using Google Cloud Console UI

1. Open [Google Cloud Console -> IAM & Admin -> Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts).
2. Click **+ CREATE SERVICE ACCOUNT**.
3. Service account name: `github-deployer`. Click **CREATE AND CONTINUE**.
4. Grant the following 4 roles under **Grant this service account access to project**:
   - **Cloud Run Admin**
   - **Cloud Build Editor**
   - **Storage Admin**
   - **Service Account User**
5. Click **DONE**.
6. Find `github-deployer`, click the **3 dots** ➔ **Manage keys**.
7. Click **ADD KEY** ➔ **Create new key** ➔ Select **JSON** ➔ Click **CREATE**.
8. Save the downloaded `.json` file to your computer.

---

## 🔒 Step 2: Add `GCP_SA_KEY` to GitHub Repository Secrets

1. Navigate to your GitHub repository:  
   👉 **[https://github.com/JBavaji/jinsei-bio-redesign](https://github.com/JBavaji/jinsei-bio-redesign)**

2. In the top tab bar, click **Settings**.
3. In the left sidebar, click **Secrets and variables** ➔ **Actions**.
4. Click the green button: **New repository secret**.
5. Fill in the form:
   - **Name:** `GCP_SA_KEY`
   - **Secret:** Open your downloaded `.json` key file, copy the entire JSON content, and paste it into the Secret box.
6. Click **Add secret**.

---

## 🧪 Step 3: Test & Verify Automated Deployment

Once `GCP_SA_KEY` is added:
1. Merge **[PR #25](https://github.com/JBavaji/jinsei-bio-redesign/pull/25)** into `staging`.
2. Go to **Actions** tab in GitHub.
3. Observe **Deploy Serverpod Backend to Google Cloud Run** workflow executing automatically.
4. Expand **🚀 Build Docker Container & Deploy to Cloud Run** step log to view your live Cloud Run API URL!
