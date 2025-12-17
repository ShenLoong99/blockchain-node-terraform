# blockchain-node-terraform
A 1-click Terraform deployment of a lightweight blockchain node: Ethereum Geth pruning mode

This Terraform configuration provisions a light-sync Ethereum (Geth) node on the Sepolia testnet using AWS EC2 Free Tier–eligible resources.

The deployment includes:

EC2 instance provisioning

Security group configuration for P2P traffic

Automated blockchain client installation via user_data

Parameterized AWS region and instance type

Optional Terraform Cloud remote state for collaboration and locking

The project is designed for learning, demonstration, and portfolio purposes, not for production mainnet usage.