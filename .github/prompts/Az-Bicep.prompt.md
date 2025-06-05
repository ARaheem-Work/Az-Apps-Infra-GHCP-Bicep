# GitHub Copilot Prompt for Azure Bicep Resources Deployment

## Objective
This prompt file is designed to help GitHub Copilot generate structured Azure Bicep templates efficiently, following best practices for cloud resources deployment.

## Instructions for Copilot
- Use **Azure Bicep** best practices.
- Ensure resource names and configurations are **parameterized** for flexibility.
- Include **recommended properties** for each resource.
- Follow **Azure security and compliance guidelines**.
- Use **latest API versions** where applicable.
- Use WestUS3 as the location
- Keep all files in top level infra folder. 
- Use main.bicep to reference all modules. Set targetScope to 'resourceGroup' in main.bicep.
- Split Azure resources into seperate module files
- Use following resource tags
    | Key               | Value                     |
    |-----------        |---------------------------|
    | ProjectName       | GitHub Markdown Example   |
    | Environment       | Dev                       |
    | Technical Owner   | abdur.raheem@avanade.com  | 
- Create a seperate bicep input parameter file for deploying azure resources and use conventions as per: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
- Add Azure Resource ID output to the corresponding module files.
- Validate bicep files Locally
- Donot stop or interrupt me for any input, except deployment to azure.
- Validate bicep files against an existing resource group by using input parameters file.
- Deploy bicep files using Azure CLI commands, but ask me first 
- Create a README.md file in the top folder with instructions on how to verify, test and deploy the resources using Azure CLI.

    



## Prompts

### **Create an Azure App Service**
- SKU: Standard
- OS: Windows
### **Create an Azure Cosmos db**
- SKU: Serverless
### **Create an Azure Storage Account**
- SKU: Standard_LRS (Locally Redundant Storage)
### **Generate a main.bicep file to orchestrate and deploy all the modules

