
# Terraform doc

- https://developer.hashicorp.com/terraform/tutorials/aws-get-started

- https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- https://github.com/morethancertified

- https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- https://dev.to/s3cloudhub/terraform-from-beginner-to-master-with-hands-on-example-14kd


# Ansible call by Terraform

- https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook 


# Notes

Keep variable in separate file. 
In variable we can type.
It help future update and make faster future updates.

Type of variable:
    List [0,1,2,..] - numbers, strings
    Map ( Key - value pairs) - we add type also
    Set (No duplicates) - we can add type
    Objects(we shoudl define types in Contruktor)
    Tuple (sequece of elements) - collection of variable with diffrent types)



# Free labs

- https://learn.kodekloud.com/user/courses/udemy-labs-terraform-for-beginners?utm_source=YouTube&utm_medium=Video&utm_campaign=Terraform_For_Beginners_Labs

# Command

INIT
PLAN
APPLY
SHOW
VALIDATE
FMT

PROVIDERS
PROVIDERS MIRROR

OUTPUT
OUTPUT

REFRESH = PLAN, APPLY

GRAPH

install soft in ubuntu
sudo apt update && apt install graphviz -y

terraform graph | dot -Tsvg > graph.svg

lifecycle{

    create_before_destroy = true
}

lifecycle{

    prevent_destroy = true
}

