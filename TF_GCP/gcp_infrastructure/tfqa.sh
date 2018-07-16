#!/bin/sh

echo "================================================================"
echo "||                                                            ||"
echo "||    USAGE:                                                  ||"
echo "||                                                            ||"
echo "||        Choose Action i | p | a | d                         ||"
echo "||                                                            ||"
echo "||        Where i: init, p: plan, a: apply, d: destroy        ||"
echo "||                                                            ||"
echo "================================================================"
echo " "
echo "Choose terraform action to perform: "
read action

if [ "$1" = "i" ]
then
    echo "terraform init"
    echo "----------------------------------------------------------------------"
    terraform init
    echo "----------------------------------------------------------------------"
elif [ "$1" = "p" ]
then    
    echo "terraform plan"
    echo "----------------------------------------------------------------------"
    yes | terraform plan \
        -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
        -var 'gcp_project_id=engaged-carving-192412' \
        -var 'gcp_region=us-central1' \
        -var 'environment=qa'
    echo "----------------------------------------------------------------------"
elif [ "$1" = "a" ]
then
    echo "terraform plan"
    echo "----------------------------------------------------------------------"
    yes | terraform apply \
        -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
        -var 'gcp_project_id=engaged-carving-192412' \
        -var 'gcp_region=us-central1' \
        -var 'environment=qa'
    echo "----------------------------------------------------------------------"
elif [ "$1" = "d" ]
then
    echo "terraform destroy"
    echo "----------------------------------------------------------------------"
    terraform destroy \
        -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
        -var 'gcp_project_id=engaged-carving-192412' \
        -var 'gcp_region=us-central1' \
        -var 'environment=qa'
    echo "----------------------------------------------------------------------"
else
    echo "Steps are init plan apply & destroy"
fi