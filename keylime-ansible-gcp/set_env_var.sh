#!/bin/sh
echo "Exporting playbook environment variables..."
export GCP_PROJECT= "test" # ID of GCP project
export GCP_CRED_KIND="serviceaccount" 
export GCP_CRED_FILE= # path to service account file
export GCP_CRED_EMAIL= # service account email
export GCP_ZONE= # zone for GCP instance, ex "northamerica-northeast1-a"
export GCP_REGION= # region for GCP instance, ex  "northamerica-northeast1"
echo "Complete"
