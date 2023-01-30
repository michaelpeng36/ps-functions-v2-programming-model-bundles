using namespace System.Net
using module AzureFunctions.PowerShell.SDK
 
function HttpTrigger1 {
    [Function()]
    param(
        [HttpTrigger()]
        $Request,
        $TriggerMetadata
    )
 
    $value =  ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body = 'This HTTP triggered function executed successfully!'
    })
 
    $value | Push-OutputBinding -Name Response
}