#!/bin/sh

echo "===================================================================="
echo "||                                                                ||"
echo "||  Choose Action i | p | a | d | g                               ||"
echo "||                                                                ||"
echo "||     Where i: init, p: plan, a: apply, d: destroy, g: graph     ||"
echo "||                                                                ||"
echo "===================================================================="
echo "Choose terraform action to perform: "
read action

echo "===================================================================="
echo "||                                                                ||"
echo "||  Choose Environemnt dev | qa                                   ||"
echo "||                                                                ||"
echo "===================================================================="
echo "Choose ENVIRONMENT for terraform action to perform: "
read environment

if [ "$env" = "dev" ]
then
    if [ "$action" = "i" ]
    then
        echo "terraform init"
        echo "----------------------------------------------------------------------"
        terraform init
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "p" ]
    then    
        echo "terraform plan"
        echo "----------------------------------------------------------------------"
        yes | terraform plan \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=dev'
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "a" ]
    then
        echo "terraform plan"
        echo "----------------------------------------------------------------------"
        yes | terraform apply \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=dev'
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "d" ]
    then
        echo "terraform destroy"
        echo "----------------------------------------------------------------------"
        terraform destroy \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=dev'
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "g" ]
    then
        echo "terraform graph"
        echo "----------------------------------------------------------------------"
        terraform graph \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=$environment'
        echo "----------------------------------------------------------------------"
    else
        echo "Choosen nothing or wrong!!"
        echo "===================================================================="
        echo "||                                                                ||"
        echo "||  USAGE:                                                        ||"
        echo "||                                                                ||"
        echo "||  Choose Action i | p | a | d | g                               ||"
        echo "||                                                                ||"
        echo "||     Where i: init, p: plan, a: apply, d: destroy, g: graph     ||"
        echo "||                                                                ||"
        echo "===================================================================="
        echo " "
    fi
elif [ "$env" = "qa" ]
then
    if [ "$action" = "i" ]
    then
        echo "terraform init"
        echo "----------------------------------------------------------------------"
        terraform init
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "p" ]
    then    
        echo "terraform plan"
        echo "----------------------------------------------------------------------"
        yes | terraform plan \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=qa'
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "a" ]
    then
        echo "terraform plan"
        echo "----------------------------------------------------------------------"
        yes | terraform apply \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=qa'
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "d" ]
    then
        echo "terraform destroy"
        echo "----------------------------------------------------------------------"
        terraform destroy \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=qa'
        echo "----------------------------------------------------------------------"
    elif [ "$action" = "g" ]
    then
        echo "terraform graph"
        echo "----------------------------------------------------------------------"
        terraform graph \
            -var 'gcp_credentials_file=My-First-Project-GGKTech-6a81fa81b4a0.json' \
            -var 'gcp_project_id=engaged-carving-192412' \
            -var 'gcp_region=us-central1' \
            -var 'environment=qa'
        echo "----------------------------------------------------------------------"
    else
        echo "Choosen nothing or wrong!!"
        echo "===================================================================="
        echo "||                                                                ||"
        echo "||  USAGE:                                                        ||"
        echo "||                                                                ||"
        echo "||  Choose Action i | p | a | d | g                               ||"
        echo "||                                                                ||"
        echo "||     Where i: init, p: plan, a: apply, d: destroy, g: graph     ||"
        echo "||                                                                ||"
        echo "===================================================================="
        echo " "
    fi