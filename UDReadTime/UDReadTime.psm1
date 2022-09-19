$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($IndexJs.FullName)

function New-UDReadTime {
    <#
    .SYNOPSIS
    Creates a estimated read time and word count value
    
    .DESCRIPTION
    Medium's like reading time estimation for React now for Powershell Universal
    
    .PARAMETER Id
    The ID of this editor

    .PARAMETER Border
    Allows you to set a border around the main div for the component using CSS default solid 2px #235789
    
    .PARAMETER BorderBottom
    Allows you to set the border under the main readtime component heading default solid 2px #235789
    
    .PARAMETER Padding
    Specifies the amount of padding the indder divs have from the main outer div
    
    .PARAMETER TextAlign
    Defaulted to justify, you can choose valid CSS settings such as left,center etc
    
    .PARAMETER BorderRadius
    Defaulted to 12px if using the border this will round the corners
    
    .PARAMETER DisplayReadTimeText
    Allows you to hide this component text if set to none default to inline
    
    .PARAMETER DisplayWordText
    Allows you to hide this component text if set to none default to inline
    
    .PARAMETER FontSize
    Allows you to set the font size for the main read time headings defaulted to 1.5em
    
    .PARAMETER FontStyle
    Defaulted to italic, you can type in any valid CSS value for the font-style CSS
    
    .PARAMETER FontWeight
    Defaulted to bold, you can use any valid CSS value for the font-weight CSS
    
    .PARAMETER ReadTimeText
    The text to be displayed after the minute number. Default to minute read
    
    .PARAMETER WordsText
    The text to be displayed after the word count number. Default to words
    
    .PARAMETER Text
    Text for the component

    .EXAMPLE
    New-UDReadTime -Text "Had denoting properly jointure you occasion directly raillery. In said to of poor full be post face snug. Introduced imprudence see say unpleasing devonshire acceptance son. Exeter longer wisdom gay nor design age. Am weather to entered norland no in showing service."
    #>
    
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter()]
        [string]$Border = "solid 2px #235789",
        [Parameter()]
        [string]$BorderBottom = "solid 2px #235789",
        [Parameter()]
        [string]$Padding = "20px",
        [Parameter()]
        [string]$TextAlign = "justify",
        [Parameter()]
        [string]$BorderRadius = "12px",
        [Parameter()]
        [ValidateSet("inline","none")]
        [string]$DisplayReadTimeText = "inline",
        [Parameter()]
        [ValidateSet("inline","none")]
        [string]$DisplayWordText = "inline",
        [Parameter()]
        [string]$FontSize = "2.5em",
        [Parameter()]
        [string]$FontStyle = "italic",
        [Parameter()]
        [string]$FontWeight = "bold",
        [Parameter()]
        [string]$ReadTimeText = "minute read",
        [Parameter()]
        [string]$WordsText = "words",
        [Parameter()]
        [string]$Text
    )

    End {
        @{
            assetId       = $AssetId 
            isPlugin      = $true 
            type          = "udreadtime"
            id            = $Id

            border        = $Border
            borderBottom  = $BorderBottom
            padding       = $Padding
            textAlign     = $TextAlign
            borderRadius  = $BorderRadius
            displayRead   = $DisplayReadTimeText
            displayWords  = $DisplayWordText
            fontSize      = $FontSize
            fontStyle     = $FontStyle
            fontWeight    = $FontWeight
            text          = $text
            timeToRead    = $ReadTimeText
            words         = $WordsText
        }
    }
}