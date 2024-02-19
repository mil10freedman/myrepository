[CmdletBinding()]
param(
[parameter(Mandatory=$true)]
[string] $FilePath,
[parameter()]
[string] $OutPutFilePath
)

Write-Verbose "Starting TestConnection.ps1 script"
Write-Verbose "Starting FilePath validation checks"

if ((Test-Path -Path $FilePath) -ne $true) {

    Write-Verbose "Uh oh $Filepath doesn't exist"
    Write-Host "$FilePath is not a valid path. Please try again" -ForegroundColor Yellow
    Write-Verbose "Starting to exit script"
    exit
}
<# this that new new bruh bruh#>
if ($OutPutFilePath -ne "" -and (Test-Path $OutPutFilePath) -ne $true) {

    Write-Verbose "Creating the new Output File"
    New-Item -Path $OutPutFilePath -ItemType File | Out-Null
    Write-Verbose "Created the $OutPutFilePath"

    Write-Verbose "Verifying the new output path exists"
    if ((Test-Path -Path $OutPutFilePath) -ne $true) {
        Write-Verbose "$OutPutFilePath failed to created"
        Write-Host "$OutPutFilePath was not successfully created" -ForegroundColor Yellow
        exit
    }

    Write-Verbose "$OutputFilePath was created successfully"
    

}

Write-Verbose "FilePath validations heck complete"
Write-Verbose "Starting to retrieve content from $FilePath"

function output {

    param($Computer)

    Write-Verbose "Copying $Computer to $OutputFilePath"

    $Computer >> $OutPutFilePath
    Write-Verbose "Copying of$Computer complete"

}


$Computers = Get-Content C:\temp\Computers.txt

Write-Verbose "Content retrieved"
Write-Verbose "Beginning ForEach Loop"

ForEach($ComputerName in $Computers) {

    Write-Verbose "Starting checks on $ComputerName"

        if ((Test-Connection -ComputerName $ComputerName -Count 2 -Quiet) -eq $true) {
        Write-Verbose "$ComputerName is olnine"
        Write-Host "$ComputerName is pingable" -ForegroundColor Green
        Write-Verbose "Escaping loop"
    }
    else {
        Write-Verbose "$ComputerName is not responding"
        Write-Host "$ComputerName is offline" -ForegroundColor Red


        Write-Verbose "Determining if $ComputerName will be copied to outfile"
        if ($OutPutFilePath -ne "") {
        
            Write-Verbose "Passing $ComputerName to the output function"
            output -Computer $ComputerName
            Write-Verbose "Exiting If Statement"

        }


        Write-Verbose "Escaping Loop"
    }
}

Write-Verbose "Script Complete"