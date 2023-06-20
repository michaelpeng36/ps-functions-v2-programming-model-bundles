# Azure Functions PowerShell New Programming Model (Extension Bundles)

This repository contains skeleton code for Azure PowerShell Functions in the V2 programming model.

---

## Installation Instructions

### Using Codespaces
The easiest way to get started with all dependencies is using CodeSpaces.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=codespaces&repo=654872607)

### Install on Windows
1. Install pre-reqs using [these steps](https://gist.github.com/paulyuk/2d86810c792e27bcabe595039a07bc77#file-azurefunctionsps-md)
2. Install the Azure Functions Core Tools private build for your corresponding OS and architecture:
    - [Windows x64](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2Ffunc-cli-4.0.5210-x64.msi)
    - [Windows x86](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2Ffunc-cli-4.0.5210-x86.msi)
### Install on Mac
1. Install pre-reqs using [these steps]()
2. Install the Azure Functions Core Tools private build for your corresponding OS and architecture:
    - [macOS ARM64](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2FAzure.Functions.Cli.osx-arm64.4.0.5210.zip)
    - [macOS x64](https://artprodwus21.artifacts.visualstudio.com/Ad1c51fbc-4477-4a0f-b99f-fc9013009a58/e6a70c92-4128-439f-8012-382fe78d6396/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL2F6ZnVuYy9wcm9qZWN0SWQvZTZhNzBjOTItNDEyOC00MzlmLTgwMTItMzgyZmU3OGQ2Mzk2L2J1aWxkSWQvMTM0MjI2L2FydGlmYWN0TmFtZS9kcm9w0/content?format=file&subPath=%2FAzure.Functions.Cli.osx-x64.4.0.5210.zip)
### Install on Linux/WSL
1. [Linux x64] Install the Azure Functions Core Tools private build for your corresponding OS and architecture:
    ```bash
    apt-get update && apt-get install -y unzip \
            && curl -SL --output azure-functions-core-tools.zip https://paulyukstoragev2.blob.core.windows.net/func-core-tools/Azure.Functions.Cli.linux-x64.4.0.5210.zip \
            && unzip -o azure-functions-core-tools.zip -d /usr/local/bin \
            && rm azure-functions-core-tools.zip \
            && chmod +x /usr/local/bin/func
    ```

## Run the application

1. If you are using storage emulation, run the below command ***in a separate PowerShell window*** to start storage emulation:
    ```powershell
    docker run -p 10000:10000 -p 10001:10001 -p 10002:10002 mcr.microsoft.com/azure-storage/azurite
    ```
    Otherwise, ensure that the Storage account is configured using appropriate KeyVault reference or connection string is set in the `AzureWebJobsStorage` property of `local.settings.json`.

2. Run the application:
    ```powershell
    func start
    ```
    There should be one HTTP function pre-written for you called `HttpTrigger1`.
