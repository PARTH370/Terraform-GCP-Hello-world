Task: Setup Cloud Run with Terraform

## Prerequisites
- Google Cloud Platform account
- Google Cloud SDK
- Terraform

## Steps
1. Create a new project in Google Cloud Platform
2. Enable Cloud Run API, Cloud Build API, Cloud Run Admin API, Cloud Build Service Account
3. Create a service account and download the key
4. Download GCP CLI and authenticate
5. Run terraform

## Project Structure
- `main.tf` - Terraform configuration file
- main.py - Python Flask application file
- Dockerfile - Docker configuration file
- requirements.txt - Python dependencies file
- hello-world.tar - Docker image tar file
- .gitignore - Git ignore file
- .terraform - Terraform directory
- terraform.tfstate - Terraform state file
- terraform.tfstate.backup - Terraform state backup file
- credentials.json - Service account key file
- README.md - Readme file

## Create a new project in Google Cloud Platform
1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Click on `Select a project` and then `New Project`
3. Enter a project name and click `Create`

## Enable API
1. Go to the [API Library](https://console.cloud.google.com/apis/library)
2. Search for `Cloud Run API` and click `Enable`
3. Search for `Cloud Build API` and click `Enable`
4. Search for `Cloud Run Admin API` and click `Enable`
5. Search for `Cloud Build Service Account` and click `Enable`

## Create a service account
1. Go to the [Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts)
2. Click on `Create Service Account`
3. Enter a name and click `Create`
4. Select the role `Cloud Run Admin` and click `Continue`
5. Click `Done`
6. Click on the service account you just created
7. Click on `Add Key` and select `JSON`
8. Click `Create` and download the key

## Download GCP CLI and authenticate
1. Download the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
2. Authenticate with `gcloud auth login`

## Run terraform & Build Docker Image
1. Clone this repository
2. Run `terraform init`
3. Build the Docker image with the following command:
    ```
    docker build -t us-central1-docker.pkg.dev/${PROJECT_ID}/hello-world-repo/hello-world .
    ```
4. Push the Docker image to the container registry with the following command:
    ```
    docker push us-central1-docker.pkg.dev/${PROJECT_ID}/hello-world-repo/hello-world
    ```
5. Build another Docker image with a different tag using the following command:
    ```
    docker build -t gcr.io/${PROJECT_ID}/hello-world:latest .
    ```
6. Push the new Docker image to the container registry with the following command:
    ```
    docker push gcr.io/${PROJECT_ID}/hello-world:latest
    ```
7. Save the Docker image to a tar file with the following command:
    ```
    docker save -o hello-world.tar gcr.io/${PROJECT_ID}/hello-world:latest
    ```
8. Load the Docker image from the tar file with the following command:
    ```
    docker load -i hello-world.tar
    ```
9. Run the Docker container with the following command:
    ```
    docker run -p 8080:8080 gcr.io/${PROJECT_ID}/hello-world:latest
    ```
10. Test the Docker container by sending a request to `http://localhost:8080`
11. Terraform apply
`terraform apply`

## Clean up
1. Delete the project in the [Google Cloud Console](https://console.cloud.google.com/)

## Resources
- [Cloud Run](https://cloud.google.com/run)
- [Terraform](https://www.terraform.io/)
- [Google Cloud SDK](https://cloud.google.com/sdk)
- [Google Cloud Console](https://console.cloud.google.com/)
- [Google Cloud API Library](https://console.cloud.google.com/apis/library)
- [Google Cloud Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts)
- [Google Cloud SDK Installation](https://cloud.google.com/sdk/docs/install)
- [Google Cloud SDK Authentication](https://cloud.google.com/sdk/gcloud/reference/auth/login)
- [Terraform Google Cloud Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Terraform Google Cloud Run](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service)
- [Terraform Google Cloud Build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger)
- [Terraform Google Cloud Service Account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)
- [Terraform Google Cloud IAM Binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_binding)
- [Terraform Google Cloud IAM Member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member)
- [Terraform Google Cloud Project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project)
- [Terraform Google Cloud Project Service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service)
- [Terraform Google Cloud Project IAM Policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_policy)
- [Terraform Google Cloud Project Service Identity](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service_identity)
- [Terraform Google Cloud Project Service Identity Pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service_identity_pool)

