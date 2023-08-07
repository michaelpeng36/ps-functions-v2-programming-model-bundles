# Azure Functions PowerShell New Programming Model (Extension Bundles)

This repository contains skeleton code for Azure PowerShell Functions in the V2 programming model.

---

## Installation Instructions

1. Install the Azure Functions Core Tools private build for your corresponding OS and architecture:
    ##  Core Tools Builds
**Build version**|**OS**|**Architecture**|**Download Link**
|:-----|:-----|:-----|:-----|
Core Tools V4 | Windows | x64 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/Azure.Functions.Cli.win-x64.4.0.5228.zip
Core Tools V4 | Linux | x64 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/Azure.Functions.Cli.linux-x64.4.0.5228.zip
Core Tools V4 | OSX | ARM64 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/Azure.Functions.Cli.osx-arm64.4.0.5228.zip
Core Tools V4 | OSX | x64 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/Azure.Functions.Cli.osx-x64.4.0.5228.zip
Core Tools V4 | Windows | ARM64 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/Azure.Functions.Cli.win-arm64.4.0.5228.zip
Core Tools V4 | Windows | x86 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/Azure.Functions.Cli.win-x86.4.0.5228.zip

## Core Tools MSI Installer

**Build version**|**OS**|**Architecture**|**Download Link**
|:-----|:-----|:-----|:-----|
Core Tools V4 | Windows | x64 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/func-cli-4.0.5228-x64.msi
Core Tools V4 | Windows | x86 | https://functionsintegclibuilds.blob.core.windows.net/ps-npm-insider-preview/func-cli-4.0.5228-x86.msi

2. ***(Optional)*** Install [Azurite](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azurite?tabs=npm) for storage emulation:
    - Example:
        ```
        npm install -g azurite
        ```
3. Clone this repository and cd into the function app root directory:
    ```
    git clone https://github.com/michaelpeng36/ps-functions-v2-programming-model-bundles.git
    cd ps-functions-v2-programming-model-bundles
    ```
<!-- TODO: add the verification script and the corresponding command to run the verification script -->
4. If you are using storage emulation, run the below command ***in a separate PowerShell window*** to start storage emulation:
    ```
    azurite
    ```
    Otherwise, ensure that the appropriate KeyVault reference or connection string is set in the `AzureWebJobsStorage` property of `host.json`.
5. Start Core Tools to begin local development:
    ```
    func start
    ```
    There should be one HTTP function pre-written for you called `HttpTrigger1`.
6. Continue writing your other functions in the V2 programming model!