# Azure Bicep Resources Deployment

## Overview
This project uses Azure Bicep to deploy an App Service (Windows, Standard SKU), Cosmos DB (Serverless), and a Storage Account (Standard_LRS) to Azure. All resources are parameterized, follow Azure best practices, and are orchestrated via `main.bicep` at the resource group scope.

## Prerequisites
- Azure CLI installed ([Install Guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli))
- Azure Bicep CLI installed ([Install Guide](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/install))
- Logged in to Azure CLI:  
  ```pwsh
  az login
  ```
- Set your subscription (replace with your subscription name or ID):  
  ```pwsh
  az account set --subscription "<your-subscription-name-or-id>"
  ```

## File Structure
```
infra/
  appService.bicep         # App Service module
  cosmosDb.bicep           # Cosmos DB module
  storageAccount.bicep     # Storage Account module
  main.bicep               # Orchestrates all modules
  main.parameters.json     # Input parameters (edit as needed)
```

## Validation
Validate your Bicep files locally before deployment:

```pwsh
az bicep build --file .\infra\main.bicep
```

Validate against an existing resource group (replace `<resource-group-name>`):

```pwsh
az deployment group validate --resource-group <resource-group-name> --template-file .\infra\main.bicep --parameters .\infra\main.parameters.json
```

## Deployment
To deploy the resources (replace `<resource-group-name>`):

```pwsh
az deployment group create --resource-group <resource-group-name> --template-file .\infra\main.bicep --parameters .\infra\main.parameters.json
```

## Outputs
After deployment, the resource IDs for App Service, Cosmos DB, and Storage Account will be output.

## Testing
- Verify resources in the Azure Portal under your resource group.
- Check outputs in the CLI for resource IDs.

## Cleanup
To remove all resources:

```pwsh
az group delete --name <resource-group-name>
```

---

For more details, see the [Azure Bicep documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/).
