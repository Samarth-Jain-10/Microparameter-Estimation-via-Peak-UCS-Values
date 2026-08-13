# Microparameter Estimation in Computational Geomechanics via Bayesian Inversion

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange.svg)](https://jupyter.org/)

> **Project Advisor:** Prof. Gaurav Tiwari, Associate Professor, Department of Civil Engineering, IIT Kanpur    

---

##📌 Overview

Determining soil microparameters for Discrete Element Method (DEM) and advanced constitutive modeling typically demands exhaustive physical laboratory testing and heavy, high-cost iterative simulations. This project introduces an end-to-end computational pipeline designed to cut down major infrastructural computation costs and energy usage.

By leveraging a metamodeled **Kriging Response Surface**, **Global Sensitivity Analysis (Sobol & Borgonovo)**, and **Markov Chain Monte Carlo (MCMC) Bayesian Inversion**, this framework directly predicts the **Probability Density Functions (PDFs)** of **15 soil microparameters** using easily observable macroparameters: **Peak Unconfined Compressive Strength ($\text{UCS}_{\text{peak}}$)** and **Shear Modulus ($G$)**.

---

## 📑 Detailed Description

Under the guidance of **Prof. Gaurav Tiwari** (Associate Professor, Department of Civil Engineering, IIT Kanpur), this project addresses the heavy infrastructural and computational costs associated with manually determining soil microparameters. In computational geomechanics, evaluating micro-level granular behavior through physical testing or exhaustive numerical simulations requires immense time and computational energy. To eliminate these bottlenecks, our primary objective was to engineer a predictive computational framework capable of directly estimating **15 fundamental soil microparameters** using readily measurable macroscopic observables—specifically **Peak Unconfined Compressive Strength ($\text{UCS}_{\text{peak}}$)** and **Shear Modulus ($G$)**.

To bypass computationally expensive high-fidelity forward runs during parameter estimation, we first constructed a surrogate metamodel using **Kriging (Gaussian Process Regression)**. By training on a dataset coupling the 15 microparameters with the 2 macroparameters, this Response Surface efficiently approximated the underlying non-linear mechanics of the soil samples. We then isolated which microparameters exerted dominant control over macro-behavior by performing **Global Sensitivity Analysis** via **Sobol** and **Borgonovo** methods. Sobol analysis quantified variance-based primary and interaction effects, while Borgonovo's density-based approach evaluated shifts across full probability distributions, enabling us to pinpoint the critical parameters governing response surface sensitivity.

Finally, we formulated the inverse mapping problem using **Bayesian inversion** powered by **Markov Chain Monte Carlo (MCMC)** sampling. Instead of yielding single deterministic values, this approach predicted full **Probability Density Functions (PDFs)** for the microparameters given target macro-values. By iteratively updating likelihood weights and evaluating candidate parameter sets back against the Kriging Response Surface, we ensured that the estimated microparameters robustly validated the target macro-properties. This closed-loop, uncertainty-aware framework drastically cuts computational and material testing costs while maintaining high precision in soil characterization.

---

## ⚙️ Methodology & Pipeline Workflow

1. **Dataset Representation:**
   * **Inputs:** 15 Microparameters (inter-particle stiffnesses, friction coefficients, bond parameters, etc.)
   * **Outputs:** 2 Macroparameters ($\text{UCS}_{\text{peak}}$, Shear Modulus $G$)

2. **Surrogate Modeling (Kriging):**
   * Built a Gaussian Process Kriging Response Surface to instantly project forward macro-responses from candidate microparameter sets without running costly direct simulations.

3. **Global Sensitivity Analysis (GSA):**
   * **Sobol Analysis:** Evaluates variance-based first-order and total-effect interaction indices.
   * **Borgonovo Analysis:** Evaluates moment-independent, density-based sensitivity metrics across full output distributions.

4. **Bayesian Inversion & MCMC Sampling:**
   * Inverts the forward surrogate model to construct posterior Probability Density Functions (PDFs) of the 15 microparameters.
   * Fine-tunes candidate parameter weights via MCMC to validate back against the original Kriging Response Surface.

---

## 💡 Key Highlights & Impact

* **Cost & Energy Reduction:** Eliminates brute-force manual/numerical trial-and-error, lowering high-performance computing (HPC) power requirements.
* **Uncertainty Quantification:** Replaces point estimates with full posterior probability distributions to capture soil variability.
* **Closed-Loop Validation:** Guarantees that predicted microparameter sets reliably reproduce target macro-scale responses.

## 🗂 Repository Structure
```text
Microparameter-Estimation-via-Peak-UCS-Values/
├── data/
│   └── raw/                            # Original datasets (UCS inputs/outputs)
├── notebooks/
│   ├── exploratory/                    # Exploratory analysis and older iterations
│   └── main/                           # Modular workflow notebooks
│       ├── 01_Data_Preparation.ipynb
│       ├── 02_Modeling_Response_Surface.ipynb
│       ├── 03_Sensitivity_Analysis.ipynb
│       ├── 04_Bayesian_Inversion.ipynb
│       └── 05_Inversion_Optimization.ipynb
├── references/                         # Research papers and literature
├── results/
│   └── figures/                        # Generated plots and visualizations
├── src/
│   └── matlab_sensitivity/             # MATLAB scripts for Sensitivity Analysis
├── .gitignore                          
├── LICENSE                             
├── requirements.txt                    
└── README.md                           
```

## 🚀 Methodology Walkthrough

### 1. Data Generation & Preparation
Macro and microparameter values were generated using UDEC software. The data was then cleaned, missing values imputed, and features scaled to prepare for machine learning modeling.

### 2. Response Surface Modeling
Various machine learning models were tested to create a Response Surface, mapping the 15 microparameters to Peak UCS and Young's Modulus. **Gaussian Process Regression (Kriging)** outperformed all other models (SVR, Random Forest, Gradient Boosting), achieving >99% testing NSE.

*Note: Below are the model performance comparisons highlighting Kriging's superiority.*
<br>
![Kriging vs Others](results/figures/plot_1.png)

### 3. Sensitivity Analysis
To understand which microparameters influence the Peak UCS the most, two Global Sensitivity Analysis techniques were employed:
- **Borgonovo Analysis**
- **Sobol Analysis**

The graphs below illustrate the first-order sensitivity of the microparameters with Peak UCS for both methods, as well as the second-order sensitivity for Sobol.

**First-Order Sensitivity (Borgonovo & Sobol)**
<br>
![First Order Sensitivity](results/figures/plot_2.png)
![First Order Sensitivity 2](results/figures/plot_3.png)

**Second-Order Sensitivity (Sobol)**
<br>
![Second Order Sensitivity](results/figures/plot_4.png)

### 4. Bayesian Inversion via MCMC
Using the Kriging Response Surface, we performed Bayesian Inversion via the Metropolis-Hastings MCMC algorithm (`emcee`). Given a Target UCS (e.g., 90 MPa) and an acceptable Coefficient of Variation (COV), the algorithm predicts the posterior Probability Density Functions (PDFs) of the 15 input microparameters required to achieve that target strength.

**Posterior PDFs of the 15 Microparameters**
<br>
![Bayesian Inversion PDFs](results/figures/plot_10.png)

### 5. Inversion Optimization (Current Work)
We are currently working on optimizing the MCMC inversion process to calculate even more accurate deterministic values from the posterior distributions.

## ⚙️ Installation & Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Microparameter-Estimation-via-Peak-UCS-Values.git
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Navigate to the `notebooks/main/` folder and execute the notebooks sequentially.

## 📄 License
This project is licensed under the [MIT License](LICENSE).
