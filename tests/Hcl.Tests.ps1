[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSReviewUnusedParameter', '',
    Justification = 'Required for Pester tests'
)]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Required for Pester tests'
)]
[CmdletBinding()]
param()

Describe 'Module' {
    It 'Function: ConvertFrom-Hcl - Throws NotImplementedException' {
        { ConvertFrom-Hcl -InputObject 'locals { }' } | Should -Throw
    }
    It 'Function: ConvertTo-Hcl - Throws NotImplementedException' {
        { ConvertTo-Hcl -InputObject @{} } | Should -Throw
    }
}
