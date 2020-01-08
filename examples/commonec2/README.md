# commonec2 Example
Configuration in this directory creates an AWS IAM role for commonec2. It also create customer-managed policy which will be attached to the IAM role. Commonec2 policy is a list of policy that commonly used in multi-account. This policy need to be provided before you launch your service in multi-account.

## Usage
To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```