#!/bin/bash

### Activate dnnf env
. /Data/dnnf_fork/.venv/bin/activate

for falsifier in "cleverhans.BIM" "cleverhans.FGM" "cleverhans.PGD"; do
    
    ### Variables
    results_dir="./Results/$falsifier"
    log_dir=$results_dir"/logs/"
    ce_dir=$results_dir"/ces/"
    mkdir -p $log_dir
    mkdir -p $ce_dir

    ##################
    ### Behavioral ###
    ##################

    ### pb_pole_angle_neg.py
    python -u ./resmonitor.py \
    -M 20G \
    -T 600 \
    dnnf \
    "./CartPoleProperties/behavioral/pb_pole_angle_neg.py" \
    --network N "../RL/policy_network.onnx" \
    --backend $falsifier \
    --set cleverhans.BIM n_starts 1 \
    --set cleverhans.FGM n_starts 1 \
    --save-violation $ce_dir"pb_pole_angle_neg" \
    --verbose &> $log_dir"pb_pole_angle_neg"".txt"

    ### pb_pole_angle_pos.py
    python -u ./resmonitor.py \
    -M 20G \
    -T 600 \
    dnnf \
    "./CartPoleProperties/behavioral/pb_pole_angle_pos.py" \
    --network N "../RL/policy_network.onnx" \
    --backend $falsifier \
    --set cleverhans.BIM n_starts 1 \
    --set cleverhans.FGM n_starts 1 \
    --save-violation $ce_dir"pb_pole_angle_pos" \
    --verbose &> $log_dir"pb_pole_angle_pos"".txt"

    ### pb_pole_angle_vel_neg.py
    python -u ./resmonitor.py \
    -M 20G \
    -T 600 \
    dnnf \
    "./CartPoleProperties/behavioral/pb_pole_angle_vel_neg.py" \
    --network N "../RL/policy_network.onnx" \
    --backend $falsifier \
    --set cleverhans.BIM n_starts 1 \
    --set cleverhans.FGM n_starts 1 \
    --save-violation $ce_dir"pb_pole_angle_vel_neg" \
    --verbose &> $log_dir"pb_pole_angle_vel_neg"".txt"

    ### pb_pole_angle_vel_pos.py
    python -u ./resmonitor.py \
    -M 20G \
    -T 600 \
    dnnf \
    "./CartPoleProperties/behavioral/pb_pole_angle_vel_pos.py" \
    --network N "../RL/policy_network.onnx" \
    --backend $falsifier \
    --set cleverhans.BIM n_starts 1 \
    --set cleverhans.FGM n_starts 1 \
    --save-violation $ce_dir"pb_pole_angle_vel_pos" \
    --verbose &> $log_dir"pb_pole_angle_vel_pos"".txt"

    ### pb_position.py
    python -u ./resmonitor.py \
    -M 20G \
    -T 600 \
    dnnf \
    "./CartPoleProperties/behavioral/pb_position.py" \
    --network N "../RL/policy_network.onnx" \
    --backend $falsifier \
    --set cleverhans.BIM n_starts 1 \
    --set cleverhans.FGM n_starts 1 \
    --save-violation $ce_dir"pb_position" \
    --verbose &> $log_dir"pb_position"".txt"

    ##################
    ### Robustness ###
    ##################

    for epsilon in 5 10 15 20 25; do

        ### pr_all_percentage.py
        python -u ./resmonitor.py \
        -M 20G \
        -T 600 \
        dnnf \
        "./CartPoleProperties/robustness/pr_all_percentage.py" \
        --network N "../RL/policy_network.onnx" \
        --backend $falsifier \
        --set cleverhans.BIM n_starts 1 \
        --set cleverhans.FGM n_starts 1 \
        --save-violation $ce_dir"pr_all_percentage_"$epsilon \
        --prop.epsilon $epsilon \
        --verbose &> $log_dir"pr_all_percentage_"$epsilon".txt"

        ### pr_cart_vel_percentage.py
        python -u ./resmonitor.py \
        -M 20G \
        -T 600 \
        dnnf \
        "./CartPoleProperties/robustness/pr_cart_vel_percentage.py" \
        --network N "../RL/policy_network.onnx" \
        --backend $falsifier \
        --set cleverhans.BIM n_starts 1 \
        --set cleverhans.FGM n_starts 1 \
        --save-violation $ce_dir"pr_cart_vel_percentage_"$epsilon \
        --prop.epsilon $epsilon \
        --verbose &> $log_dir"pr_cart_vel_percentage_"$epsilon".txt"

        ### pr_pole_angle_percentage.py
        python -u ./resmonitor.py \
        -M 20G \
        -T 600 \
        dnnf \
        "./CartPoleProperties/robustness/pr_pole_angle_percentage.py" \
        --network N "../RL/policy_network.onnx" \
        --backend $falsifier \
        --set cleverhans.BIM n_starts 1 \
        --set cleverhans.FGM n_starts 1 \
        --save-violation $ce_dir"pr_pole_angle_percentage_"$epsilon \
        --prop.epsilon $epsilon \
        --verbose &> $log_dir"pr_pole_angle_percentage_"$epsilon".txt"

        ### pr_pole_angle_vel_percentage.py
        python -u ./resmonitor.py \
        -M 20G \
        -T 600 \
        dnnf \
        "./CartPoleProperties/robustness/pr_pole_angle_vel_percentage.py" \
        --network N "../RL/policy_network.onnx" \
        --backend $falsifier \
        --set cleverhans.BIM n_starts 1 \
        --set cleverhans.FGM n_starts 1 \
        --save-violation $ce_dir"pr_pole_angle_vel_percentage_"$epsilon \
        --prop.epsilon $epsilon \
        --verbose &> $log_dir"pr_pole_angle_vel_percentage_"$epsilon".txt"

        ### pr_position_percentage.py
        python -u ./resmonitor.py \
        -M 20G \
        -T 600 \
        dnnf \
        "./CartPoleProperties/robustness/pr_position_percentage.py" \
        --network N "../RL/policy_network.onnx" \
        --backend $falsifier \
        --set cleverhans.BIM n_starts 1 \
        --set cleverhans.FGM n_starts 1 \
        --save-violation $ce_dir"pr_position_percentage_"$epsilon \
        --prop.epsilon $epsilon \
        --verbose &> $log_dir"pr_position_percentage_"$epsilon".txt"

    done
done