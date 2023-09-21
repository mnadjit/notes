---
aliases:
  - CySA+ Risk Mitigation
tags:
  - tech
  - cybsec
  - risk_mitigation
category: cyber_security
subcategory: analyst
---
# Risk Identification
## Enterprise Risk Management
[NIST Information Security - Special Publication 800-39](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-39.pdf)

![[Risk_Mitigatin.png|600]]
- **Frame**: Strategic Framework; primarily defined by business stakeholders
- **Assess**:
- **Monitor**:
- **Respond**:

## Quantitative vs Qualitative methods

# Assessment
- Business Continuity Loss
- Legal Loss
- Reputational Loss

## System Assessment
To assess the above we need to conduct **System Assessment** i.e. systematic identification of critical systems by compiling inventory of the business processes and the tangible and intangible assets and resources that support those processes.
- People
- Tangible assets
- Intangible assets
- Procedures
## MEF
- **Mission Essential Function**: Define which function are essential to the business
## Asset Tracking
- **Asset Inventory Tracking** using **asset management database**
## Threat and Vulnerability Assessment
# Risk Calculation
## Quantitative Method
> [!tip] Risk Calculation Formula
RISK = Probability x Magnitude

### Single Loss Expectancy
#SLE #single_loss_expectancy #AV #asset_value #EF #exposure_factor
> [!tip] Formula
SLE = AV x EF
- Single Loss Expectancy
- AV = Asset Value
- Exposure Factor (probability) expressed in percentage
e.g. `$2,500 = $50,000 x 0.05`

### Annual Loss Expectancy
#ALE #annual_loss_expectancy #annual_rate_of_occurrence #ARO 
> [!tip] Formula
ALE = SLE x ARO
- ARO: Annual Rate of Occurrence
e.g. `$10,000 = $25,000 x 4`

## Qualitative
Output would be a **Risk Matrix**
Traffic light system makes it visually understandable

## Semi-Quantitative

# Business Impact Analysis
#bia 
Define business availability e.g. 99%
## Maximum Tolerable Downtime
#mtd #maximum_tolerable_downtime
**longest time** a biz can be **inoperable** w/o causing irrevocable biz failure.
Each biz process has its own MTD
## Recovery Time Objective
#rto #recover_time_objective
**time** it takes to **resume normal biz** operations after an event
## Work Recovery Time
#wrt #work_recovery_time
**time** *in addition to RTO* of **individual systems** to perform **reintegration** and **testing** of a restored or upgraded system after an event
## Recovery Point Objective 
#rpo #recovery_point_objective
**longest time** an org can tolerate **lost data being unrecoverable**
e.g. in case of ransomware
# Risk Prioritization
# Communicating Risk
# Training and Exercises