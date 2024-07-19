
all: deploy

plan:
	make -C terraform plan

deploy:
	make -C terraform deploy

destroy:
	make -C terraform destroy

init:
	cp .env srcs
	cd srcs && docker composer up -d 