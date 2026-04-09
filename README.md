# Stochastic Optimal Control of Biodiesel Production

**Optimal Temperature Profile Formation for Biodiesel Production in a Batch Reactor Under Uncertainty**

B.Tech Final Year Project — Electronics and Instrumentation Engineering  
Manipal Institute of Technology | Jan - Sep 2023  
Guide: Dr. I. Thirunavukkarasu, Professor, Dept. of Instrumentation & Control Engineering

---

## Overview

Biodiesel production via transesterification is inherently uncertain — variability in feedstock composition and reactor operation can significantly affect product yield and quality. This project develops a **stochastic optimal control framework** to determine the optimal temperature profile for a batch reactor that maximizes the expected concentration of methyl ester (biodiesel) despite these uncertainties.

---

## Problem Statement

Given stochastic disturbances in feedstock composition, find the optimal temperature trajectory for a batch transesterification reactor that:
- Maximizes expected methyl ester (E) concentration
- Satisfies reactor operating constraints
- Accounts for real-time uncertainty in a closed-loop control structure

---

## Methodology

### 1. Stochastic Modeling (Itô Calculus)
- Feedstock composition uncertainty modeled using **Stochastic Differential Equations (SDEs)** / Itô processes
- **Itô's Lemma** applied to derive expected concentration dynamics of the 6 biodiesel components
- Concentration profiles plotted before and after applying Itô's process (MS Excel)

### 2. Optimal Control (Stochastic Maximum Principle)
- **Stochastic Maximum Principle** applied to the objective function to derive adjoint equations for each biodiesel element and its associated uncertainty
- **Hamiltonian formulation** solved iteratively to obtain the optimal temperature profile
- Adjoint equations solved numerically using **MATLAB** with **Runge-Kutta-Fehlberg (RKF) integration**

### 3. Closed-Loop Operation
- Feedback control system designed to monitor reactor state in real-time
- Temperature profile adjusted dynamically to maintain optimal operation

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| MATLAB | Solving adjoint equations, Hamiltonian optimization, RKF integration |
| MS Excel | Itô process application, concentration plotting |
| SDEs / Itô Calculus | Stochastic uncertainty modeling |
| Stochastic Maximum Principle | Optimal control derivation |

---

## Key Results

- Successfully derived optimal temperature profile for batch biodiesel reactor under stochastic feedstock uncertainty
- Demonstrated improvement in expected methyl ester yield by applying stochastic control vs. deterministic approach
- Validated closed-loop control strategy for real-time adaptation under uncertainty

---

## Repository Structure

```
├── matlab/              # MATLAB scripts for adjoint equations and RKF integration
├── excel/               # Excel workbooks with Itô process and concentration plots
├── report/              # Final project report (PDF)
└── README.md
```

---

## Background

Transesterification converts triglycerides (vegetable oil/animal fat) + methanol into fatty acid methyl esters (FAME/biodiesel) + glycerol. The 6-component reaction system tracked in this project includes: Triglyceride (A), Diglyceride (B), Monoglyceride (C), Glycerol (D), Methanol (M), and Methyl Ester (E).
