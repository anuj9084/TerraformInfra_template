# TerraformInfra_template

Standardized Infrastructure-as-Code (IaC) templates using Terraform to deploy scalable and secure cloud resources on Azure.

---

## 🚀 Azure DevOps CI/CD Pipeline Setup (Windows Self-Hosted Agent Compatible)

Pipeline fully configured hai **Windows Self-Hosted Agent** ke liye (**PowerShell native execution** aur **Pool configuration** ke saath).

- 🔑 **Service Connection:** `anuj-pipeline-sc`
- 🖥️ **Agent Pool:** `Default` (Aap [`pipelines/variables/common-vars.yml`](file:///d:/TerraformInfra_template/pipelines/variables/common-vars.yml) me change kar sakte hain)
- 📄 **Main Pipeline:** [`azure-pipelines.yml`](file:///d:/TerraformInfra_template/azure-pipelines.yml)
- 🧩 **Step Template:** [`pipelines/templates/terraform-steps.yml`](file:///d:/TerraformInfra_template/pipelines/templates/terraform-steps.yml) (PowerShell tasks for Windows)
- ⚙️ **Variable Templates:**
  - [`pipelines/variables/common-vars.yml`](file:///d:/TerraformInfra_template/pipelines/variables/common-vars.yml)
  - [`pipelines/variables/dev-vars.yml`](file:///d:/TerraformInfra_template/pipelines/variables/dev-vars.yml)
  - [`pipelines/variables/prod-vars.yml`](file:///d:/TerraformInfra_template/pipelines/variables/prod-vars.yml)

---

### 📂 Repository Structure

```text
.
├── Dev/
│   ├── dev.tfvars            # Dev variables (rg-dev-1, etc.)
│   ├── main.tf               # Dev resource group module
│   └── variables.tf
├── Prod/
│   ├── main.tf               # Prod resource group module
│   ├── prod.tfvars           # Prod variables (rg-prod-1, etc.)
│   └── variables.tf
├── pipelines/
│   ├── templates/
│   │   └── terraform-steps.yml   # 🧩 Reusable Steps (PowerShell commands for Windows)
│   └── variables/
│       ├── common-vars.yml       # ⚙️ Shared Variables (Agent Pool, SC, TF version)
│       ├── dev-vars.yml          # ⚙️ Dev Environment Variables
│       └── prod-vars.yml         # ⚙️ Prod Environment Variables
├── azure-pipelines.yml           # 🚀 Multi-Stage Pipeline (Plan -> Dev Apply -> Prod Apply)
├── main.tf                       # Root module calling Dev & Prod
├── provider.tf                   # Azure Provider & commented backend
├── variables.tf
└── README.md
```

---

### 🔄 Pipeline Workflow

1. **Stage 1: Validate & Plan (Dev & Prod)**  
   - Windows Agent par `terraform init`, `validate`, aur `plan` execute hota hai PowerShell ke through.
   - Har Pull Request (PR) aur Commit par run hota hai.

2. **Stage 2: Deploy Dev**  
   - `main` branch par merge hone par automatically `Dev` environment me `terraform apply` hota hai.

3. **Stage 3: Deploy Prod**  
   - `Dev` deploy successfully complete hone ke baad `Prod` environment me `terraform apply` hota hai.
   - *(Optional: Azure DevOps me **Pipelines -> Environments -> Prod** par jakar Approval gate laga sakte hain).*

---

### ⚙️ Self-Hosted Windows Agent Notes:

1. **Agent Pool Name Check Karein:**  
   Agar aapke self-hosted Windows agent ka pool `Default` ke alawa kuch aur hai, toh [`pipelines/variables/common-vars.yml`](file:///d:/TerraformInfra_template/pipelines/variables/common-vars.yml) me `agentPoolName` ko update kar lein:
   ```yaml
   agentPoolName: 'Default' # <-- Apne pool ka exact name dalein
   ```
2. **Azure CLI & Terraform:**  
   Aapke Windows agent system par **Azure CLI (`az`)** install aur configured honi chahiye.
