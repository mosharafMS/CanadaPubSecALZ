# Archetype:  Central Logging

## Table of Contents

* [Overview](#overview)
* [Schema Definition](#schema-definition)
* [Deployment Instructions](#deployment-instructions)

## Overview

Centralized logging landing zone allows a common subscription for managing Log Analytics Workspace & Automation Account.  This landing zone will be in the pubsecPlatform management group.

![Archetype:  Central Logging](../media/architecture/archetype-logging.jpg)

**Workflow**

*	A new subscription is created through existing process (either via ea.azure.com or Azure Portal).
*	The subscription will automatically be assigned to the **pubsecSandbox** management group.
*	Update configuration in Azure DevOps Git repo.
*	Execute the **Platform – Logging** Azure DevOps Pipeline.  The pipeline will:
  * Move it to the target management group.
  *	Scaffold the subscription with baseline configuration.

**Subscription Move**

Subscription can be moved to a target Management Group through Azure ARM Templates/Bicep.  Move has been incorporated into the landing zone Azure DevOps Pipeline automation.

**Capabilities**

| Capability | Description |
| --- | --- |
| Service Health Alerts | Configures Service Health alerts such as Security, Incident, Maintenance.  Alerts are configured with email, sms and voice notifications. |
| Azure Security Center | Configures security contact information (email and phone). |
| Subscription Role Assignments | Configures subscription scoped role assignments.  Roles can be built-in or custom. |
| Subscription Budget | Configures monthly subscription budget with email notification. Budget is configured by default for 10 years and the amount. |
| Log Analytics | Configures Automation Account, Log Analytics Workspace and Log Analytics Solutions (AgentHealthAssessment, AntiMalware, AzureActivity, ChangeTracking, Security, SecurityInsights, ServiceMap, SQLAssessment, Updates, VMInsights).  **SecurityInsights** solution pack will enable Azure Sentinel.  |
| Subscription Tags | A set of tags that are assigned to the subscription. |
| Resource Tags | A set of tags that are assigned to the resource group and resources.  These tags must include all required tags as defined the Tag Governance policy. |

## Schema Definition

Reference implementation uses parameter files with `object` parameters to consolidate parameters based on their context.  The schemas types are:

* v0.1.0

  * Common
    * [Service Health Alerts](../../schemas/v0.1.0/landingzones/types/serviceHealthAlerts.json)
    * [Azure Security Center](../../schemas/v0.1.0/landingzones/types/securityCenter.json)
    * [Subscription Role Assignments](../../schemas/v0.1.0/landingzones/types/subscriptionRoleAssignments.json)
    * [Subscription Budget](../../schemas/v0.1.0/landingzones/types/subscriptionBudget.json)
    * [Subscription Tags](../../schemas/v0.1.0/landingzones/types/subscriptionTags.json)
    * [Resource Tags](../../schemas/v0.1.0/landingzones/types/resourceTags.json)


## Deployment Instructions

Use the [Onboarding Guide for Azure DevOps](../onboarding/ado.md) to configure this archetype.