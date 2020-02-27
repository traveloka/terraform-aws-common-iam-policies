# commonec2 Example
This is an example of usage of `commonec2` module, the configuration in this directory creates an AWS IAM Role for commonly used by EC2 we called it `commonec2`. This module also create customer-managed policy which will be attached to the IAM role. This policy need to be provided before you launch your service in multi-account.

## Usage
To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```