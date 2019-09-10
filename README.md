

gcloud kms encrypt --plaintext-file=id_rsa \
                   --ciphertext-file=../id_rsa.enc \
                   --location=global --keyring=cloudbuild-secrets \
                   --key=cloudbuild-key \
                   --project=apszaz-cloudbuild-demo

ssh-keyscan -t rsa github.com > known_hosts


RSA_FILE=/Users/alpalacios/.ssh/id_rsa_github
cat <<EOF >~/.ssh/config
Hostname github.com
 IdentityFile $RSA_FILE
EOF

Hostname github.com
 IdentityFile /Users/alpalacios/.ssh/id_rsa_github
