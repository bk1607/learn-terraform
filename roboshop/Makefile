git:
	git pull
state_file:
	terraform init -backend-config=env-dev/state.tfvars
dev-apply:
	terraform apply -auto-approve -var-file=env-dev/main.tfvars
dev-destroy:
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars
