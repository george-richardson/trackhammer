set -ex

echo "Installing terraform"
curl -fSL "https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip" -o terraform.zip
sudo unzip terraform.zip -d /opt/terraform
sudo ln -s /opt/terraform/terraform /usr/bin/terraform
rm -f terraform.zip

echo "Executing terraform"
terraform init -input=false
terraform apply -auto-approve