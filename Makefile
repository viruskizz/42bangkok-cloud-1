
all: apply deploy

deploy:
	./deploy.sh

plan:
	make -C terraform plan

apply:
	make -C terraform deploy

destroy:
	make -C terraform destroy