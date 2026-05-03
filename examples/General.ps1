<#
  .SYNOPSIS
    This is a general example of how to use the Hcl module.
#>

# Import the module
Import-Module -Name 'Hcl'

# Convert an HCL locals block to a PowerShell object
$hcl = @'
locals {
  environment = "production"
  region      = "us-east-1"
}
'@
ConvertFrom-Hcl -InputObject $hcl
