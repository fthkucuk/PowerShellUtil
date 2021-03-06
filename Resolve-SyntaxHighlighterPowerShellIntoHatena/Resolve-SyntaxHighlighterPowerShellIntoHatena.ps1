﻿#Requires -Version 3.0

function Resolve-SyntaxHighlighterPowerShellIntoHatena
{
    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        # Input PowerShell code to convert special character
        [Parameter(
            Mandatory,
            ValuefromPipeline,
            ValuefromPipelineByPropertyName,
            position = 0)]
        [string[]]
        $inputcode
    )

    Begin
    {
        $leftSquareBrackets  = @('\[','&#91;')
        $rightSquareBrackets = @('\]','&#93;')
        $leftAngleBrackets   = @('<','&lt;')
        $rightAngleBrackets  = @('>','&gt;')
        $leftBlanckets       = @('\(','&#40')
        $rightBlanckets      = @('\)','&#41')
        $colon               = @(':','&#58;')
    }

    Process
    {
        '<pre class="brush: powershell;">'
        $inputcode `
            -replace $leftSquareBrackets `
            -replace $rightSquareBrackets `
            -replace $leftAngleBrackets `
            -replace $rightAngleBrackets `
            -replace $leftBlanckets `
            -replace $rightBlanckets `
            -replace $colon
        '</pre>'
    }
}
<#
#### Sample
$inputcode = @'
string[]$hoge
"<>"
http://tech.guitarrapc.com
'@

$inputcode | Resolve-SyntaxHighlighterPowerShellIntoHatena
#>