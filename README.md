# Azure Bicep Infrastructure Deployment

## Prerequisites
- Azure CLI installed and logged in
- Bicep CLI (included with latest Azure CLI)
- Access to an Azure subscription and resource group

## Files
- All Bicep and parameter files are in the `infra/` folder.

## How to Validate Bicep Files

```sh
az bicep build --file infra/main.bicep
az bicep build --file infra/appService.bicep
az bicep build --file infra/cosmosDb.bicep
az bicep build --file infra/storageAccount.bicep
```

## How to Validate Against a Resource Group

```sh
az deployment group validate \
  --resource-group <your-resource-group> \
  --template-file infra/main.bicep \
  --parameters infra/main.parameters.json
```

## How to Deploy (Ask before running)

```sh
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file infra/main.bicep \
  --parameters infra/main.parameters.json
```

## How to Test/Verify
- Check Azure Portal for deployed resources.
- Use Azure CLI to list resources:

```sh
az resource list --resource-group <your-resource-group>
```

- Check outputs for resource IDs:

```sh
az deployment group show --resource-group <your-resource-group> --name <deployment-name> --query properties.outputs
```

## Tagging and Naming
- Resource tags and names follow [Azure best practices](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-tagging) and [resource abbreviations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations).

---

**Note:** Update parameter values in `infra/main.parameters.json` as needed for your environment.
