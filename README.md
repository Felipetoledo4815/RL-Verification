# Properties for Reinforcement Learning - CartPole
---

## Install Conda Environment
You will need to create a conda environment and install all the packages defined in the **env_req.yaml** file. To do it, execute the following command:

    conda create -n {environment-name} --file environment.yaml

This environment will need to be activated and used when running the notebooks. The environment can be activated with the following command:

    conda activate {environment-name}

## Install DNNV and DNNF
You can execute the `install.sh` script in the root of the repository. It will create a **.venv** folder with a python environment, in which DNNV and DNNF will be installed. After that, it will install 4 verifiers: "neurify", "nnenum", "marabou", and "verinet"; and the "cleverhans" package.

### Gurobi License
**Warning!** `Verinet` uses `gurobi`, which requires a license, you can get an academic license for free at https://www.gurobi.com/academia/academic-program-and-licenses/. Once you have your license code, activate the dnnv environment and install it by doing:

    . .venv/bin/activate
    grbgetkey *License Code*

## Repository structure
- **Properties:** 
  - *CartPoleProperties:* contains all the properties in [DNNP](https://docs.dnnv.org/en/stable/dnnp/introduction.html) format used by [DNNV](https://docs.dnnv.org/en/stable/index.html) and [DNNF](https://dnnf.readthedocs.io/en/latest/index.html).
  - *Results:* contains the logs and counter-examples produced when running the `verify_properties.sh` and `falsify_properties.sh` scripts.
  - *verify_properties.sh:* script for verifying all the properties in `CartPoleProperties`.
  - *falsify_properties.sh:* script for falsifying all the properties in `CartPoleProperties`.
  - *resmonitor.py:* python auxiliar script for controlling memory and time limits when running DNNV and DNNF.
  - *MyCartPole.py:* modified version of original CartPole environment, with a new reset function that allows to specify a initial state.
  - *CartPolePlayground.ipynb:* python notebook to play around with the cartPole environment.
  - *ProcessResults.ipynb:* python notebook to parse and analyze the verification and falsification results.
- **RL:**
  - *DQN.ipynb:* contains code to train a cartPole DQN model.
  - *training:* folder that contains training and test data for the DQN model.
  - *policy_network.h5:* saved model in tensorflow format.
  - *policy_network.onnx:* saved model in onnx format (needed for checking the properties using DNNV and DNNF).
- **ProVe.ipynb:** contains an example for matrix splitting operation based on the paper "Formal verification of neural networks for safety-critical tasks in deep reinforcement learning" [[Link](https://www.semanticscholar.org/paper/Formal-verification-of-neural-networks-for-tasks-in-Corsi-Marchesini/307bccaee7e7eda278b9cad46522e315b0a638de)]
- **install.sh:** script for installing DNNV and DNNF with their own environment
- **environment.yaml:** yaml file for creating conda environment