#!/bin/bash

### Create DNNV environment
python -m venv .venv

### Activate environment
. .venv/bin/activate

### Install DNNV
pip install dnnv

### Install verifiers
dnnv_manage install neurify marabou nnenum verinet

### Install DNNF with cleverhans
pip install dnnf[cleverhans]