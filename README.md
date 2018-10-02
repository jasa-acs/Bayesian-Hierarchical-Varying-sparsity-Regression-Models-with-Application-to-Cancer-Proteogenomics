# Bayesian Hierarchical Varying-sparsity Regression Models with Application to Cancer Proteogenomics

# Author Contributions Checklist Form

## Data

### Abstract
The dataset contains gene expressions, protein expressions and patients’ survival times across
4 cancers (kidney renal clear cell carcinoma, ovarian serous cystadenocarcinoma, skin
cutaneous melanoma and head and neck squamous cell carcinoma. The genes/proteins are
key members of 12 core pathways in those 4 cancers.

### Availability
We retrieve the genomic, proteomic and clinical data from TCGA (https://tcga-
data.nci.nih.gov/docs/publications/tcga/?) using TCGA-Assembler (Zhu et al., 2014)

### Description 
The TCGA data portal has been moved to https://gdc.cancer.gov/access-data
TCGA-Assembler (http://www.compgenome.org/TCGA-Assembler/) or other similar software
can be used to download the data.

## Code

### Abstract 
The code implements the MCMC algorithm of BEHAVIOR model described in Section 2.
It allows for drawing posterior samples from the model and making prediction in survival times
for testing dataset.

### Description
The Matlab compiled executable is submitted in a zip file with the manuscript, which can be run
on any platform with or without Matlab license.

### Optional Information 
Free MATLAB Runtime (v9.1) can be downloaded and installed from
(http://www.mathworks.com/products/compiler/mcr/).

### Reproducibility
Table 1 and Figures 2-6

## Notes

The main function is BEHAVIOR which takes 6 inputs and returns 10 outputs which are
necessary to reproduce our results in simulations and case studies.

- Input files (put in the same directory of BEHAVIOR)
``parameter.csv``: in the format of [N,s] where N is the number of MCMC iterations and s is the
seed used by random number generator.
``y.csv``: n by 2 survival variable with 1st column being survival/censoring times and 2nd column
being censoring indicator (1=death,0=censored)
``P.csv``: n by p proteins
``G.csv``: n by p genes
``Pt.csv``: n by p proteins for test data
``Gt.csv``: n by p genes for test data
- Output variables are stored in ``BEHAVIOR.mat``:
``reg_coef``: protein effect
``reg_rate``: inclusion probability of protein
``lambda``: threshold
``lin_coef``: linear gene effect
``nlin_coef``: nonlinear gene effect
``const_coef``: constant gene effect
``lin_rate``: inclusion probability of linear gene effect
``nlin_rate``: inclusion probability of nonlinear gene effect
``const_rate``: inclusion probability of constant gene effect
``ypred``: predictive values of y for training data Pt and Gt.

