// ----------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
// EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
// ----------------------------------------------------------------------------------

targetScope = 'subscription'

// Service Health
// Example (JSON)
// -----------------------------
// "serviceHealthAlerts": {
//   "value": {
//     "resourceGroupName": "pubsec-service-health"
//     "incidentTypes": [ "Incident", "Security", "Maintenance", "Informational", "ActionRequired" ],
//     "regions": [ "Global", "Canada East", "Canada Central" ],
//     "receivers": {
//       "app": [ "email-1@company.com", "email-2@company.com" ],
//       "email": [ "email-1@company.com", "email-3@company.com", "email-4@company.com" ],
//       "sms": [ { "countryCode": "1", "phoneNumber": "1234567890" }, { "countryCode": "1",  "phoneNumber": "0987654321" } ],
//       "voice": [ { "countryCode": "1", "phoneNumber": "1234567890" } ]
//     },
//     "actionGroupName": "ALZ action group",
//     "actionGroupShortName": "alz-alert",
//     "alertRuleName": "ALZ alert rule",
//     "alertRuleDescription": "Alert rule for Azure Landing Zone"
//   }
// }
@description('Service Health alerts')
param serviceHealthAlerts object = {}

// Log Analytics
@description('Log Analytics Resource Id to integrate Azure Security Center.')
param logAnalyticsWorkspaceResourceId string

// Azure Security Center
// Example (JSON)
// -----------------------------
// "securityCenter": {
//   "value": {
//       "email": "alzcanadapubsec@microsoft.com",
//       "phone": "5555555555"
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   email: 'alzcanadapubsec@microsoft.com'
//   phone: '5555555555'
// }
@description('Security Center configuration.  It includes email and phone.')
param securityCenter object

// Subscription Role Assignments
// Example (JSON)
// -----------------------------
// [
//   {
//       "comments": "Built-in Contributor Role",
//       "roleDefinitionId": "b24988ac-6180-42a0-ab88-20f7382dd24c",
//       "securityGroupObjectIds": [
//           "38f33f7e-a471-4630-8ce9-c6653495a2ee"
//       ]
//   }
// ]

// Example (Bicep)
// -----------------------------
// [
//   {
//     comments: 'Built-In Contributor Role'
//     roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
//     securityGroupObjectIds: [
//       '38f33f7e-a471-4630-8ce9-c6653495a2ee'
//     ]
//   }
// ]
@description('Array of role assignments at subscription scope.  The array will contain an object with comments, roleDefinitionId and array of securityGroupObjectIds.')
param subscriptionRoleAssignments array = []

// Subscription Budget
// Example (JSON)
// ---------------------------
// "subscriptionBudget": {
//   "value": {
//       "createBudget": false,
//       "name": "MonthlySubscriptionBudget",
//       "amount": 1000,
//       "timeGrain": "Monthly",
//       "contactEmails": [ "alzcanadapubsec@microsoft.com" ]
//   }
// }

// Example (Bicep)
// ---------------------------
// {
//   createBudget: true
//   name: 'MonthlySubscriptionBudget'
//   amount: 1000
//   timeGrain: 'Monthly'
//   contactEmails: [
//     'alzcanadapubsec@microsoft.com'
//   ]
// }
@description('Subscription budget configuration containing createBudget flag, name, amount, timeGrain and array of contactEmails')
param subscriptionBudget object

// Tags
// Example (JSON)
// -----------------------------
// "subscriptionTags": {
//   "value": {
//       "ISSO": "isso-tag"
//   }
// }

// Example (Bicep)
// ---------------------------
// {
//   ISSO: 'isso-tag'
// }
@description('A set of key/value pairs of tags assigned to the subscription.')
param subscriptionTags object

// Example (JSON)
// -----------------------------
// "resourceTags": {
//   "value": {
//       "ClientOrganization": "client-organization-tag",
//       "CostCenter": "cost-center-tag",
//       "DataSensitivity": "data-sensitivity-tag",
//       "ProjectContact": "project-contact-tag",
//       "ProjectName": "project-name-tag",
//       "TechnicalContact": "technical-contact-tag"
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   ClientOrganization: 'client-organization-tag'
//   CostCenter: 'cost-center-tag'
//   DataSensitivity: 'data-sensitivity-tag'
//   ProjectContact: 'project-contact-tag'
//   ProjectName: 'project-name-tag'
//   TechnicalContact: 'technical-contact-tag'
// }
@description('A set of key/value pairs of tags assigned to the resource group and resources.')
param resourceTags object

// Resource Groups
// Example (JSON)
// -----------------------------
// "resourceGroups": {
//   "value": {
//     "automation": "azmlAutomation",
//     "compute": "azmlCompute",
//     "monitor": "azmlMonitor",
//     "networking": "azmlNetworking",
//     "networkWatcher": "NetworkWatcherRG",
//     "security": "azmlSecurity",
//     "storage": "azmlStorage"
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   automation: 'azmlAutomation'
//   compute: 'azmlCompute'
//   monitor: 'azmlMonitor'
//   networking: 'azmlNetworking'
//   networkWatcher: 'NetworkWatcherRG'
//   security: 'azmlSecurity'
//   storage: 'azmlStorage'
// }
@description('Resource groups required for the achetype.  It includes automation, compute, monitor, networking, networkWatcher, security and storage.')
param resourceGroups object

@description('Boolean flag to determine whether customer managed keys are used.  Default:  false')
param useCMK bool = false

// Azure Automation Account
// Example (JSON)
// -----------------------------
// "automation": {
//   "value": {
//     "name": "azmlautomation"
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   name: 'azmlautomation'
// }
@description('Azure Automation Account configuration.  Includes name.')
param automation object

// Azure Key Vault
// Example (JSON)
//-----------------------------
// "keyVault": {
//   "value": {
//     "secretExpiryInDays": 3650
//   }
// }

// Example (Bicep)
//-----------------------------
// {
//   secretExpiryInDays: 3650
// }
@description('Azure Key Vault configuraiton.  Includes secretExpiryInDays.')
param keyVault object

// Azure Kubernetes Service
// Example (JSON)
//-----------------------------
// "aks": {
//   "value": {
//     "version": "1.21.2"
//   }
// }

// Example (Bicep)
//-----------------------------
// {
//   version: '1.21.2'
// }
@description('Azure Kubernetes Service configuration.  Includes version.')
param aks object

// SQL Database
// -----------------------------
// Example (JSON)
// "sqldb": {
//   "value": {
//     "enabled": true,
//     "sqlAuthenticationUsername": "azadmin"
//   }
// }

// example 2
// "sqldb":{
//   "value":{
//     "enabled":true,
//     "aadAuthenticationOnly":true,
//     "aadLoginName":"John Smith",
//     "aadLoginObjectID":"88888-888888-888888-888888",
//     "aadLoginType":"User"
//   }
// }

// example 3
// "sqldb":{
//   "value":{
//     "enabled":true,
//     "aadAuthenticationOnly":false,
//     "sqlAuthenticationUsername": "azadmin",
//     "aadLoginName":"John Smith",
//     "aadLoginObjectID":"88888-888888-888888-888888",
//     "aadLoginType":"User"
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   enabled: true
//   aadAuthenticationOnly: false 
//   sqlAuthenticationUsername: 'azadmin'
// }

// Example (Bicep) 2
// {
//   enabled: true
//   aadAuthenticationOnly: true 
//   aadLoginName:'John Smith',
//   aadLoginObjectID:'88888-888888-888888-888888',
//   aadLoginType:'User'
// }

// Example (Bicep) 3
// {
//   enabled: true
//   aadAuthenticationOnly: false
//   sqlAuthenticationUsername: 'azadmin' 
//   aadLoginName:'John Smith',
//   aadLoginObjectID:'88888-888888-888888-888888',
//   aadLoginType:'User'
// }
@description('SQL Database configuration.  Includes enabled flag and username.')
param sqldb object

// SQL Managed Instance
// -----------------------------
// Example (JSON)
// "sqlmi": {
//   "value": {
//     "enabled": true,
//     "username": "azadmin"
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   enabled: true
//   username: 'azadmin'
// }
@description('SQL Managed Instance configuration.  Includes enabled flag and username.')
param sqlmi object

// Example (JSON)
// -----------------------------
// "aml": {
//   "value": {
//     "enableHbiWorkspace": false
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   enableHbiWorkspace: false
// }
@description('Azure Machine Learning configuration.  Includes enableHbiWorkspace.')
param aml object

// Networking
// Example (JSON)
// -----------------------------
// "hubNetwork": {
//   "value": {
//       "virtualNetworkId": "/subscriptions/ed7f4eed-9010-4227-b115-2a5e37728f27/resourceGroups/pubsec-hub-networking-rg/providers/Microsoft.Network/virtualNetworks/hub-vnet",
//       "rfc1918IPRange": "10.18.0.0/22",
//       "rfc6598IPRange": "100.60.0.0/16",
//       "egressVirtualApplianceIp": "10.18.0.36",
//       "privateDnsManagedByHub": true,
//       "privateDnsManagedByHubSubscriptionId": "ed7f4eed-9010-4227-b115-2a5e37728f27",
//       "privateDnsManagedByHubResourceGroupName": "pubsec-dns-rg"
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   virtualNetworkId: '/subscriptions/ed7f4eed-9010-4227-b115-2a5e37728f27/resourceGroups/pubsec-hub-networking-rg/providers/Microsoft.Network/virtualNetworks/hub-vnet'
//   rfc1918IPRange: '10.18.0.0/22'
//   rfc6598IPRange: '100.60.0.0/16'
//   egressVirtualApplianceIp: '10.18.0.36'
//   privateDnsManagedByHub: true,
//   privateDnsManagedByHubSubscriptionId: 'ed7f4eed-9010-4227-b115-2a5e37728f27',
//   privateDnsManagedByHubResourceGroupName: 'pubsec-dns-rg'
// }
@description('Hub Network configuration that includes virtualNetworkId, rfc1918IPRange, rfc6598IPRange, egressVirtualApplianceIp, privateDnsManagedByHub flag, privateDnsManagedByHubSubscriptionId and privateDnsManagedByHubResourceGroupName.')
param hubNetwork object

// Example (JSON)
// -----------------------------
// "network": {
//   "value": {
//     "peerToHubVirtualNetwork": true,
//     "useRemoteGateway": false,
//     "name": "vnet",
//     "dnsServers": [
//       "10.18.1.4"
//     ],
//     "addressPrefixes": [
//       "10.2.0.0/16"
//     ],
//     "subnets": {
//       "oz": {
//         "comments": "Foundational Elements Zone (OZ)",
//         "name": "oz",
//         "addressPrefix": "10.2.1.0/25"
//       },
//       "paz": {
//         "comments": "Presentation Zone (PAZ)",
//         "name": "paz",
//         "addressPrefix": "10.2.2.0/25"
//       },
//       "rz": {
//         "comments": "Application Zone (RZ)",
//         "name": "rz",
//         "addressPrefix": "10.2.3.0/25"
//       },
//       "hrz": {
//         "comments": "Data Zone (HRZ)",
//         "name": "hrz",
//         "addressPrefix": "10.2.4.0/25"
//       },
//       "privateEndpoints": {
//         "comments": "Private Endpoints Subnet",
//         "name": "privateendpoints",
//         "addressPrefix": "10.2.5.0/25"
//       },
//       "sqlmi": {
//         "comments": "SQL Managed Instances Delegated Subnet",
//         "name": "sqlmi",
//         "addressPrefix": "10.2.6.0/25"
//       },
//       "databricksPublic": {
//         "comments": "Databricks Public Delegated Subnet",
//         "name": "databrickspublic",
//         "addressPrefix": "10.2.7.0/25"
//       },
//       "databricksPrivate": {
//         "comments": "Databricks Private Delegated Subnet",
//         "name": "databricksprivate",
//         "addressPrefix": "10.2.8.0/25"
//       },
//       "aks": {
//         "comments": "AKS Subnet",
//         "name": "aks",
//         "addressPrefix": "10.2.9.0/25"
//       }
//     }
//   }
// }

// Example (Bicep)
// -----------------------------
// {
//   peerToHubVirtualNetwork: true
//   useRemoteGateway: false
//   name: 'vnet'
//   dnsServers: [
//     '10.18.1.4'
//   ]
//   addressPrefixes: [
//     '10.2.0.0/16'
//   ]
//   subnets: {
//     oz: {
//       comments: 'Foundational Elements Zone (OZ)'
//       name: 'oz'
//       addressPrefix: '10.2.1.0/25'
//     }
//     paz: {
//       comments: 'Presentation Zone (PAZ)'
//       name: 'paz'
//       addressPrefix: '10.2.2.0/25'
//     }
//     rz: {
//       comments: 'Application Zone (RZ)'
//       name: 'rz'
//       addressPrefix: '10.2.3.0/25'
//     }
//     hrz: {
//       comments: 'Data Zone (HRZ)'
//       name: 'hrz'
//       addressPrefix: '10.2.4.0/25'
//     }
//     privateEndpoints: {
//       comments: 'Private Endpoints Subnet'
//       name: 'privateendpoints'
//       addressPrefix: '10.2.5.0/25'
//     }
//     sqlmi: {
//       comments: 'SQL Managed Instances Delegated Subnet'
//       name: 'sqlmi'
//       addressPrefix: '10.2.6.0/25'
//     }
//     databricksPublic: {
//       comments: 'Databricks Public Delegated Subnet'
//       name: 'databrickspublic'
//       addressPrefix: '10.2.7.0/25'
//     }
//     databricksPrivate: {
//       comments: 'Databricks Private Delegated Subnet'
//       name: 'databricksprivate'
//       addressPrefix: '10.2.8.0/25'
//     }
//     aks: {
//       comments: 'AKS Subnet'
//       name: 'aks'
//       addressPrefix: '10.2.9.0/25'
//     }
//   }
// }
@description('Network configuration.  Includes peerToHubVirtualNetwork flag, useRemoteGateway flag, name, dnsServers, addressPrefixes and subnets (oz, paz, rz, hrz, privateEndpoints, sqlmi, databricksPublic, databricksPrivate, aks) ')
param network object

// Telemetry - Azure customer usage attribution
// Reference:  https://docs.microsoft.com/azure/marketplace/azure-partner-customer-usage-attribution
var telemetry = json(loadTextContent('../../config/telemetry.json'))
module telemetryCustomerUsageAttribution '../../azresources/telemetry/customer-usage-attribution-subscription.bicep' = if (telemetry.customerUsageAttribution.enabled) {
  name: 'pid-${telemetry.customerUsageAttribution.modules.archetypes.machineLearning}'
}

/*
  Scaffold the subscription which includes:
    * Azure Security Center - Enable Azure Defender (all available options)
    * Azure Security Center - Configure Log Analytics Workspace
    * Azure Security Center - Configure Security Alert Contact
    * Role Assignments to Security Groups
    * Service Health Alerts
    * Subscription Budget
    * Subscription Tags
*/
module subScaffold '../scaffold-subscription.bicep' = {
  name: 'configure-subscription'
  scope: subscription()
  params: {
    serviceHealthAlerts: serviceHealthAlerts
    subscriptionRoleAssignments: subscriptionRoleAssignments
    subscriptionBudget: subscriptionBudget
    subscriptionTags: subscriptionTags
    resourceTags: resourceTags

    logAnalyticsWorkspaceResourceId: logAnalyticsWorkspaceResourceId

    securityCenter: securityCenter
  }
}

// Deploy Landing Zone
module landingZone 'lz.bicep' = {
  name: 'deploy-machinelearning-archetype'
  scope: subscription()
  params: {
    logAnalyticsWorkspaceResourceId: logAnalyticsWorkspaceResourceId

    securityContactEmail: securityCenter.email

    resourceTags: resourceTags
    resourceGroups: resourceGroups

    useCMK: useCMK

    automation: automation
    keyVault: keyVault
    aks: aks
    sqldb: sqldb
    sqlmi: sqlmi
    aml: aml

    hubNetwork: hubNetwork
    network: network
  }
}
