#This command tells Terraform that I am using AWS services

provider "aws"{
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region = "${var.region}"
}


#This will launch a t2.micro server with an Amazon Machine Image that has Wordpress
#pre-configured. 

resource "aws_instance" "blog_server" {
	ami = "${var.ami}"
	instance_type = "t2.micro"
}

resource "aws_security_group" "web_firewall" {
	name = "firewall"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]

		}
	
	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		}
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		}
}


		


