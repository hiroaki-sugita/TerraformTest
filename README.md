# Terraform Test

Terraformテスト用リポジトリ

## 概要
- VPC ALB EC2 RDS を Terraformで自動作成する(GitHub Action)

## 構成
- main.tf
- output.tf
- variables.tf
- .github/workflows/terraform.yml
- .github/workflows/terraform-destory.yml

## Terraform フロー図
<img width="661" height="621" alt="Terraform drawio" src="https://github.com/user-attachments/assets/e6366ae6-b14e-4a17-8c46-d8680184a782" />


## 構成図
```mermaid

flowchart TD

    subgraph VPC["VPC 10.0.0.0/16"]
        
        subgraph PublicSubnet1a["Public Subnet 1a (10.0.1.0/24)"]
            EC2a["EC2 (WordPress) - 1a"]
        end

        subgraph PublicSubnet1c["Public Subnet 1c (10.0.3.0/24)"]
            EC2c["EC2 (WordPress) - 1c"]
        end

        subgraph PrivateSubnet1a["Private Subnet 1a (10.0.2.0/24)"]
            RDS["RDS MySQL"]
        end

        subgraph PrivateSubnet1c["Private Subnet 1c (10.0.4.0/24)"]
        end

        ALB["ALB (HTTP:80)"]
    end

    Internet(("Internet"))

    Internet --> ALB
    ALB --> EC2a
    ALB --> EC2c
    EC2a --> RDS
    EC2c --> RDS
