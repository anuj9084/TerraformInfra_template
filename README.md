# TerraformInfra_template

Standardized Infrastructure-as-Code (IaC) templates using Terraform to deploy scalable and secure cloud resources on Azure.

---

## 🚀 Azure DevOps CI/CD Pipeline Setup (Dev & Prod)

Pipeline fully modular bana di gayi hai: **Step Templates**, **Variable Templates**, aur **Multi-Stage Pipeline** ke saath.

- 🔑 **Service Connection:** `anuj-pipeline-sc`
- 📄 **Main Pipeline:** [`azure-pipelines.yml`](file:///d:/TerraformInfra_template/azure-pipelines.yml)
- 🧩 **Step Template:** [`pipelines/templates/terraform-steps.yml`](file:///d:/TerraformInfra_template/pipelines/templates/terraform-steps.yml)
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
│   │   └── terraform-steps.yml   # 🧩 Reusable Steps (Init, Validate, Plan, Apply)
│   └── variables/
│       ├── common-vars.yml       # ⚙️ Shared Pipeline Variables (Service connection, TF version)
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
   - `Dev` aur `Prod` dono ke liye `terraform init`, `validate`, aur `plan` chalta hai.
   - Har Pull Request (PR) aur Commit par run hota hai.

2. **Stage 2: Deploy Dev**  
   - `main` branch par merge hone par automatically `Dev` environment me `terraform apply` hota hai.

3. **Stage 3: Deploy Prod**  
   - `Dev` deploy successfully complete hone ke baad `Prod` environment me `terraform apply` hota hai.
   - *(Optional: Azure DevOps me **Pipelines -> Environments -> Prod** par jakar Approval gate laga sakte hain taaki Prod deploy hone se pehle aapki manual approval maange).*

---

### ⚙️ Kaise Run Karein (Azure DevOps me):

1. Apne Azure DevOps project me **Pipelines** -> **New Pipeline** par jayein.
2. **Azure Repos Git** (ya GitHub) select karein.
3. Apna repository choose karein.
4. **Existing Azure Pipelines YAML file** choose karein aur path me `/azure-pipelines.yml` select karein.
5. **Run** par click karein! 🎉
