all: deploy

plan: 
	mkdir -p output
	terraform init
	terraform plan

deploy: 
	mkdir -p output
	terraform init
	terraform plan
	terraform apply -auto-approve
	terraform output -raw public_keypair > output/my-keypair.pem
	terraform output -json > output/output.json
	terraform output -json instance_ips > output/instance_ips.json

clean:
	terraform destroy -auto-approve
	rm -rf output

fclean: clean
	rm -rf .terraform
	rm .terraform.lock.hcl
	rm terraform.tfstate
	rm terraform.tfstate.backup
