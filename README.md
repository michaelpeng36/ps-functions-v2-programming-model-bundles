# Azure Functions PowerShell Insider Preview of the v2 Programming Model

This repository contains skeleton code for Azure Functions using the V2 programming model for PowerShell.

---
# Getting started

## Prerequisites

* An Azure account with an active subscription.[ Create an account for free.](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio)
* Private build of Azure Functions Core Tools (Instructions below)
* [PowerShell 7.2](https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2#msi)
* [.Net Core 6 version SDK 6.0.408 or higher](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) 
* [.Net Core 8 version SDK 8.0.100-preview.3 or SDK 8.0.100-preview.4](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) **Please note that though this version is currently in preview, it is required for using the v2 PowerShell programming model.**
* [Visual Studio Code](https://code.visualstudio.com/) on one of the [supported platforms](https://code.visualstudio.com/docs/supporting/requirements#_platforms).
* The [PowerShell extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell).
* The [Azure Functions extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurefunctions) for Visual Studio Code.
* [Azurite emulator for local Azure Storage development](https://learn.microsoft.com/azure/storage/common/storage-use-azurite?tabs=visual-studio)
* [Azure Functions PowerShell SDK](https://www.powershellgallery.com/packages/AzureFunctions.PowerShell.SDK/0.0.3)

## Download the Core Tools private build

1. Install the Azure Functions Core Tools private build for your corresponding OS and architecture:
    - [Windows x64](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2Ffunc-cli-4.0.5210-x64.msi)
    - [Windows x86](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2Ffunc-cli-4.0.5210-x86.msi)
    - [macOS ARM64](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2FAzure.Functions.Cli.osx-arm64.4.0.5210.zip)
    - [macOS x64](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2FAzure.Functions.Cli.osx-x64.4.0.5210.zip)

2. Clone this repository and cd into the function app root directory:
    ```
    git clone https://github.com/michaelpeng36/ps-functions-v2-programming-model-bundles.git
    cd ps-functions-v2-programming-model-bundles
    ```
<!-- TODO: add the verification script and the corresponding command to run the verification script -->
3. If you are using storage emulation, run the below command ***in a separate PowerShell window*** to start storage emulation:
    ```
    azurite
    ```
    Otherwise, ensure that the appropriate KeyVault reference or connection string is set in the `AzureWebJobsStorage` property of `host.json`.
4. Start Core Tools to begin local development:
    ```
    func start
    ```
    There should be one HTTP function pre-written for you called `HttpTrigger1`.
5. Continue writing your other functions in the V2 programming model!

## Configure local settings

Please add the following (app settings) key value pairs to your file: 

```json
"FUNCTIONS_WORKER_RUNTIME_VERSION": "7.4" 
"AzureWebJobsFeatureFlags":"EnableWorkerIndexing" 
```

## Durable Functions

To use Durable Functions, you will need to add an app setting with a connection string to your storage account or utilize Azurite.

If using a real connection string, set: 

```json
"AzureWebJobsStorage": "DefaultEndpointsProtocol=https;AccountName=<myAccountName>;AccountKey=<key>;EndpointSuffix=core.windows.net" 
```

If using Azurite, set: 

```json
"AzureWebJobsStorage": "UseDevelopmentStorage=true" 
```

To use the latest ExternalDurablePowerShellSDK, you will have to add the following app setting 

```json
"ExternalDurablePowerShellSDK": "true", 
```

Sample local.json.settings: 

```json
{ 
  "IsEncrypted": false, 
  "Values": { 
    "AzureWebJobsStorage": "DefaultEndpointsProtocol=https;AccountName=<myAccount>;AccountKey=<myAccountKey>;EndpointSuffix=core.windows.net",  
    "FUNCTIONS_WORKER_RUNTIME": "powershell", 
    "FUNCTIONS_WORKER_RUNTIME_VERSION": "7.4", 
    "ExternalDurablePowerShellSDK": "true", 
    "AzureWebJobsFeatureFlags":"EnableWorkerIndexing" 
  } 
}
```

## Known issues

Known Issues: 
* The PowerShell language worker 7.4 fails to start when using .Net Core 8 version SDK 8.0.100-preview.5 due to this [breaking change](https://github.com/dotnet/runtime/issues/86713). The PowerShell team is working on a fix for this issue 
* Core Tools [hangs if an error is encountered](https://github.com/Azure/azure-functions-powershell-worker/issues/964) when indexing PowerShell functions.

File new issues in the [Azure Functions PowerShell Worker repository](https://github.com/Azure/azure-functions-powershell-worker/issues).  Please add [Insider Preview] to the title of the issue 

## Create a new function app

You can also create a new function app without cloning this repository. Note that `func new` currently is not currently supported.

1. ```func init``` and select PowerShell
2. Create a new ps1 file for a single function, e.g., MyFunction.ps1 or, create new psm1 file to have multiple functions, e.g., functions.psm1 


