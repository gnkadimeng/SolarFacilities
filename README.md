---
title: "Solar Energy Data Exploration"
---

# Environment Setup

This project utilizes R for data analysis and visualization. To reproduce the analysis, follow these steps:

1.  **R Installation**: Ensure R is installed on your system. You can download it from [CRAN](https://cran.r-project.org/).

2.  **Required Packages**: Install the necessary R packages by running the following commands in your R console:

``` r
   install.packages(c("readxl", "dplyr", "FactoMineR", "ggplot2", "corrr", "factoextra", 
                      "gridExtra", "gt", "tidyr", "lubridate", "viridis", "rmarkdown", 
                      "plotly", "shinyalert", "timetk"))
```

# SolarEnergyDataExploration

## Abstract

This report offers a detailed analysis of daily solar energy data collected from 64 distinct locations within our facility over one year. It explores spatial dynamics, functional insights, and organizational impacts affecting solar energy utilization. Principal Component Analysis (PCA) is utilized to identify dominant factors driving energy variations across these locations.

## Key Findings

-   **Spatial Dynamics:** Locations like SKH 1(MANDIR) and N1 exhibit strong correlations in solar energy readings, suggesting shared solar exposure.
-   **Functional Insights:** Areas such as N4 AAC& DAC and N5&NAS(CANTEEN) demonstrate distinctive energy consumption patterns.
-   **Organizational Impacts:** Units like RADIO SAI AUDIO and LADIES SEVADAL show synchronized energy consumption behaviors.

## Correlation Analysis

The correlation matrix reveals relationships between solar energy readings at different locations, highlighting operational, locational, and environmental influences.

### Insights:

-   **Highly Correlated Pairs:** e.g., SKH 1 (MANDIR) and SKH 2 (0.911\*)
-   **Moderately Correlated Pairs:** e.g., N1 and N3 & N4 (0.862\*)
-   **Weakly Correlated Pairs:** e.g., S3 and S5 (0.446\*)

## Covariance Matrix Analysis

The covariance matrix provides insights into the variability and linear relationships between solar energy readings across locations.

### Insights:

-   **Highly Covariant Pairs:** e.g., SKH 1 (MANDIR) and SKH 2 (Covariance: 370.06)
-   **Moderately Covariant Pairs:** e.g., N1 and N3 & N4 (Covariance: 741.65)
-   **Weakly Covariant Pairs:** e.g., SSS RJY 2 and SSS HOSTEL EB2 (Covariance: 70.71)

## Principal Component Analysis (PCA)

PCA is applied to reduce dimensionality and identify significant components explaining variance in solar energy data.

### Insights:

-   **Eigenvalues and Variance Explained:** PC1 explains 74.04% of the variance.
-   **Loadings and Interpretation:** Facilities like N1, N2, N3, and N4 show similar loadings on PC1 (-0.23 to -0.28), indicating common operational influences.

## Operational Implications

-   **Resource Allocation:** Facilities with similar PCA loadings may benefit from similar resource allocation strategies.
-   **Strategic Planning:** PCA results inform strategic planning by highlighting key operational metrics across facilities.

## 
