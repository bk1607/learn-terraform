git:
	git pull
state_file:
	git pull
	terraform init -backend-config=env-dev/state.tfvars
dev-apply:
	git pull
	terraform apply -auto-approve -var-file=env-dev/main.tfvars
dev-destroy:
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars
