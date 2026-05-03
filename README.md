# Hcl

A PowerShell module for working with [HashiCorp Configuration Language (HCL)](https://github.com/hashicorp/hcl), as used in [Terraform](https://www.terraform.io/), [OpenTofu](https://opentofu.org/), and other infrastructure-as-code tools. Supports parsing `.tf` configuration files, `.tfvars` variable files, `locals {}` blocks, and converting PowerShell objects back to HCL format.

## Prerequisites

This uses the following external resources:
- The [PSModule framework](https://github.com/PSModule/Process-PSModule) for building, testing and publishing the module.

## Installation

To install the module from the PowerShell Gallery, you can use the following command:

```powershell
Install-PSResource -Name Hcl
Import-Module -Name Hcl
```

## Usage

Here is a list of examples that are typical use cases for the module.

### Example 1: Parse a Terraform locals block

```powershell
$hcl = @'
locals {
  environment = "production"
  region      = "us-east-1"
  tags = {
    project = "myapp"
    team    = "platform"
  }
}
'@
$result = ConvertFrom-Hcl -InputObject $hcl
$result.locals.environment  # production
$result.locals.tags.project # myapp
```

### Example 2: Parse a .tfvars file

```powershell
$tfvars = Get-Content -Path 'terraform.tfvars' -Raw
$variables = ConvertFrom-Hcl -InputObject $tfvars
$variables.region  # us-east-1
```

### Example 3: Convert a PowerShell object to HCL

```powershell
$config = [ordered]@{
    resource = [ordered]@{
        aws_instance = [ordered]@{
            example = [ordered]@{
                ami           = 'ami-0c55b159cbfafe1f0'
                instance_type = 't2.micro'
            }
        }
    }
}
ConvertTo-Hcl -InputObject $config
```

### Find more examples

To find more examples of how to use the module, please refer to the [examples](examples) folder.

Alternatively, you can use `Get-Command -Module 'Hcl'` to find commands available in the module.
To find examples of each command, use `Get-Help -Examples 'CommandName'`.

## Documentation

For detailed documentation on each function, use the built-in help system:

```powershell
Get-Help ConvertFrom-Hcl -Full
Get-Help ConvertTo-Hcl -Full
```

## Contributing

Coder or not, you can contribute to the project! We welcome all contributions.

### For users

If you don't code, you still sit on valuable information that can make this project even better. If you experience that the product does unexpected things, throw errors or is missing functionality, you can help by submitting bugs and feature requests. Please see the issues tab on this project and submit a new issue that matches your needs.

### For developers

If you do code, we'd love to have your contributions. Please read the [Contribution guidelines](CONTRIBUTING.md) for more information. You can either help by picking up an existing issue or submit a new one if you have an idea for a new feature or improvement.
