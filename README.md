# Terraform Test
Terraformテスト用リポジトリ

## 概要
TerraformによるAWSインフラの自動構築

## システム構成図
<img width="1179" height="857" alt="構成図 150_2" src="https://github.com/user-attachments/assets/48b401f0-8ee8-4320-90c7-bf1e67a4f2b1" />

## Terraform 実行フロー
<img width="992" height="932" alt="terraform150" src="https://github.com/user-attachments/assets/a4e0f587-b688-4f9a-b902-f0499e8f63e7" />

## 主な使用技術
- Iac: Terraform
- Cloud: AWS
- OS: Amazon Linux

##ディレクトリ構成
```text
├─ .github/workflows   # CI/CD設定（GitHub Actionsによる自動実行）
├─ bootstrap/          # 初期セットアップ（Backend用のS3/DynamoDB構築）
└─ main/               # メイン環境構築
    └─ modules/        # 各リソースごとの定義
        ├─ vpc/        # ネットワーク
        ├─ security/   # セキュリティグループ・通信制御
        ├─ iam/        # 権限管理
        ├─ alb/        # ロードバランサー設定
        ├─ asg/        # オートスケーリング設定
        ├─ ec2/        # EC2インスタンス設定(現在は未使用)
        ├─ rds/        # データベース(RDS)
        └─ cloudwatch/ # 監視・アラート設定

【構成ファイル】
main.tf                # リソース構築のメインロジック / モジュールの呼び出し定義
backend.tf             # Terraformの状態（State）をS3/DynamoDBで管理するための設定
variables.tf           # 環境に依存する設定値（変数）の定義
output.tf              # 実行結果の表示、親モジュールへの値の連携
alarms_alb.tf          # ALBの死活監視等に関するアラート定義
alarms_asg.tf          # スケーリングイベントやインスタンス異常に関するアラート定義
log_groups.tf          # CloudWatch Logs のロググループ一括管理
```

## 構築方針
- AWS無料利用枠を最大限活用し、ランニングコストを最小限に抑えた構成を目指す。
- Multi-AZ構成を前提としてALBおよびAuto Scalingグループによる冗長化を実装。
- パブリック/プライベートサブネットの分離および、Security Groupによる最小権限の原則に基づく通信制御
- CloudWatchによるログ監視およびリソース監視
