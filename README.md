# Rock Strength Modeling & Bayesian Inversion

This repository contains a complete Machine Learning and Bayesian Inversion workflow to predict and optimize the Peak Unconfined Compressive Strength (UCS) and Young's Modulus of rock samples based on their microparameters.

## Project Structure

```text
├── data/
│   ├── UCS_InputsOutputs_E.csv         # Main dataset
│   └── UCS_InputsOutputs_E_Testing.csv # Testing dataset
├── results/                            # Saved graphs and CSV outputs (Sobol/Borgonovo)
├── RSM_Final.ipynb                     # Main Jupyter Notebook containing all the code
├── requirements.txt                    # List of Python dependencies
└── README.md                           # This file
```

## Setup & Installation

To run this project locally in VS Code or Jupyter Notebook, you need to install the required Python packages:

```bash
pip install -r requirements.txt
```

## How to Run

1. Open `RSM_Final.ipynb` in VS Code or Jupyter Notebook.
2. The notebook is organized into sequential steps:
   - **Step 1:** Data Loading, Cleaning & Scaling
   - **Step 2:** Machine Learning Models (Kriging, SVR, Random Forest, Gradient Boosting)
   - **Step 3:** Global Sensitivity Analysis (Sobol & Borgonovo)
   - **Step 4:** Bayesian Inversion using MCMC (Metropolis-Hastings via `emcee`)
3. Click **"Run All"** to execute the complete workflow.

## MCMC Inversion
The final step uses the `emcee` library to perform Bayesian Inversion. It takes a **Target UCS** and a **Coefficient of Variation (COV)**, and predicts the exact Probability Density Functions (PDFs) of the 15 input microparameters required to achieve that target strength.
