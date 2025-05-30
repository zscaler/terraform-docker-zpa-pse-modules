<a href="https://terraform.io">
    <img src="https://raw.githubusercontent.com/hashicorp/terraform-website/master/public/img/logo-text.svg" alt="Terraform logo" title="Terraform" height="50" width="250" />
</a>
<a href="https://www.zscaler.com/">
    <img src="https://www.zscaler.com/themes/custom/zscaler/logo.svg" alt="Zscaler logo" title="Zscaler" height="50" width="250" />
</a>

# Zscaler Private Service Edge Docker Terraform Modules

## Support Disclaimer

-> **Disclaimer:** Please refer to our [General Support Statement](docs/guides/support.md) before proceeding with the use of this provider.

## Description

This repository contains modules and deployment configurations that can be used to deploy Zscaler Private Service Edge software on Docker containers to securely and quickly provision SCALANCE LPE-9000 (Local Processing Engine) and AXC F 3152 from Phoenix Contact  for industrial IoT (Internet of Things) device with a Linux Operating System.

These devices provide computing power for various applications in the network, and as a result you can use Docker to run your own applications.

These deployment templates are intended to be fully functional and self service for both greenfield/pov as well as production use.

## Prerequisites

Our Deployment scripts are leveraging Terraform v1.1.9 that includes full binary and provider support for MacOS M1 chips, but any Terraform version 0.13.7 should be generally supported.

- provider registry.terraform.io/kreuzwerker/docker v3.0.x
- provider registry.terraform.io/hashicorp/random v3.3.x
- provider registry.terraform.io/hashicorp/local v2.2.x
- provider registry.terraform.io/hashicorp/null v3.1.x
- provider registry.terraform.io/providers/hashicorp/tls v3.4.x
- provider registry.terraform.io/providers/zscaler/zpa v2.6.x

### Docker requirements

Please visit the Zscaler [Help Portal](https://help.zscaler.com/zpa/app-connector-deployment-guide-docker) the detailed requirements on Private Service Edges deployment on docker platform.

### Zscaler requirements

This module leverages the [Zscaler ZPA Provider](https://github.com/zscaler/terraform-provider-zpa) to connect to your ZPA Admin console and provision a new Private Service Edge Group + Provisioning Key. You can still run this template if deploying to an existing Private Service Edge Group rather than creating a new one, but using the conditional create functionality from variable byo_provisioning_key and supplying to name of your provisioning key to variable byo_provisioning_key_name. In either deployment, this is fed directly into the userdata for bootstrapping

## Legacy ZPA API Authentication Framework

1. A valid Zscaler Private Access subscription and portal access
2. Zscaler ZPA API Keys. Details on how to find and generate ZPA API keys can be located [here](https://registry.terraform.io/providers/zscaler/zpa/latest/docs#legacy-api-framework)
- `zpa_client_id`
- `zpa_client_secret`
- `zpa_customer_id`
- `zpa_cloud` - This authentication parameter is optional and only required if authenticating to a non-production cloud i.e `BETA`, `GOV`, `GOVUS`, `ZPATWO`
- `use_legacy_client` - This parameter MUST be set to `true` if your tenant is NOT migrated to Zidentity.

```hcl
provider "zpa" {
  zpa_client_id            = "zpa_client_id" # pragma: allowlist secret
  zpa_client_secret        = "zpa_client_secret" # pragma: allowlist secret
  zpa_customer_id          = "zpa_client_secret" # pragma: allowlist secret
  zpa_cloud                = "zpa_cloud" # pragma: allowlist secret
  use_legacy_client        = "true" # pragma: allowlist secret
}
```

3. (Optional) An existing Service Edge Group and Provisioning Key. Otherwise, you can follow the prompts in the examples terraform.tfvars to create a new Connector Group and Provisioning Key

See: [Zscaler Service Edge AWS Deployment Guide](https://help.zscaler.com/zpa/private-service-edge-deployment-guide-amazon-web-services) for additional prerequisite provisioning steps.

## ZPA OneAPI Authentication Framework (OneAPI)

1. A valid Zscaler Private Access subscription and portal access
2. Zscaler tenant MUST be migrated to Zidentity platform.
3. Details on how to authenticate to ZPA via Zidentity/OneAPI are located here [here](https://registry.terraform.io/providers/zscaler/zpa/latest/docs#authentication---oneapi-new-framework)
- `client_id`
- `client_secret`
- `zpa_customer_id`
- `vanity_domain`
- `zscaler_cloud` - This authentication parameter is optional and only required if authenticating to a non-production cloud i.e `beta`

```hcl
provider "zpa" {
  client_id = "client_id" # pragma: allowlist secret
  client_secret = "client_secret" # pragma: allowlist secret
  zpa_customer_id = "client_secret" # pragma: allowlist secret
  vanity_domain = "vanity_domain" # pragma: allowlist secret
  zscaler_cloud = "zscaler_cloud" # pragma: allowlist secret
}
```

See: [Zscaler Private Service Edge Deployment Guide for Docker](https://help.zscaler.com/zpa/app-connector-deployment-guide-docker) for additional prerequisite provisioning steps.

## How to deploy

Provisioning templates are available for customer use/reference to successfully deploy fully operational Private Service Edge containers once the prerequisites have been completed. Please follow the instructions located in [examples](examples/base_ac/README.md).

## Format

This repository follows the [Hashicorp Standard Modules Structure](https://www.terraform.io/registry/modules/publish):

- `modules` - All module resources utilized by and customized specifically for Private Service Edge deployments. The intent is these modules are resusable and functional for any deployment type referencing for both production or lab/testing purposes.

- `examples` - Zscaler provides fully functional deployment templates utilizing a combination of some or all of the modules published. These can utilized in there entirety or as reference templates for more advanced customers or custom deployments. For novice Terraform users, we also provide a bash script (zsac) that can be run from any Linux/Mac OS or CSP Cloud Shell that walks through all provisioning requirements as well as downloading/running an isolated teraform process. This allows Private Service Edge deployments from any supported client without needing to even have Terraform installed or know how the language/syntax for running it.

## Versioning

These modules follow recommended release tagging in [Semantic Versioning](http://semver.org/). You can find each new release,
along with the changelog, on the GitHub [Releases](https://github.com/zscaler/terraform-aws-zpa-app-connector-modules/releases) page.

# License and Copyright

Copyright (c) 2024 Zscaler, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
