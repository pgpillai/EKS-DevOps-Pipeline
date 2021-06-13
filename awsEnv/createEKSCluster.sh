#!/bin/bash
role=$(aws iam get-role --role-name DevopsEKSClusterRole --query "Role.RoleName")
echo "Role name is $role"
if [[ -z $role || $role != 'EKSDevOpsClusterRole' ]]
then
aws iam create-role \
  --role-name DevopsEKSClusterRole \
  --assume-role-policy-document file://"cluster-role-trust-policy.json"


aws iam attach-role-policy \
  --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy \
  --role-name DevopsEKSClusterRole
fi

delete=true;
if $delete == true
then
aws iam detach-role-policy \
   --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy \
   --role-name DevopsEKSClusterRole
aws iam delete-role --role-name DevopsEKSClusterRole
fi