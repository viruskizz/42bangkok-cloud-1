
all: deploy

plan:
	make -C terraform plan

deploy:
	make -C terraform deploy

destroy:
	make -C terraform destroy