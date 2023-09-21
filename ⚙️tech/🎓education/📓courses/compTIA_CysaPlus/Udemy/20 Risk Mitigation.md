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
> [!note] Formula
SLE = AV x EF
- Single Loss Expectancy
- AV = Asset Value
- Exposure Factor (probability) expressed in percentage
e.g. `$2,500 = $50,000 x 0.05`

### Annual Loss Expectancy
#ALE #annual_loss_expectancy #annual_rate_of_occurrence #ARO 
> [!note] Formula
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
## MTD - Maximum Tolerable Downtime
#mtd #maximum_tolerable_downtime
**longest time** a biz can be **inoperable** w/o causing irrevocable biz failure.
Each biz process has its own MTD
## RTO - Recovery Time Objective
#rto #recover_time_objective
**time** it takes to **resume normal biz** operations after an event.
## WRT - Work Recovery Time
#wrt #work_recovery_time
**time** *in addition to RTO* of **individual systems** to perform **reintegration** and **testing** of a restored or upgraded system after an event.
## RPO - Recovery Point Objective 
#rpo #recovery_point_objective
**longest time** an org can tolerate **lost data being unrecoverable**
e.g. in case of ransomware
# Risk Prioritization
- **Risk Appetite**: How big of a risk you can take.
## Mitigation
- deterrence or reduction by adding *controls*
## Avoidance
- cease an activity that might pose a risk 
- *changing plans*
## Transfer
- moving or sharing the responsibility of the risk with another entity
- e.g. *Cyber-insurance*, or use a 3rd party for a service
## Acceptance
- no countermeasure other than *monitoring* is available
- has to be less than org's risk appetite 

> Security Controls
> - Control required by framework, best practice or regulation
> - Cost of control
> - Amount of risk a control mitigates

- ROSI (Return on Security Investment) #rosi
> [!note] Formula
> ROSI = ((ALE - ALE<sup>m</sup>) - C) / C

- Engineering Tradeoff #engineering_tradeoff
Considering the benefits of adding a security measure against the cost and complexity it adds
# Communicating Risk
## Risk Register
#risk_register
A document highlighting the results of risk assessments in an easily comprehensible format. It contains:
- Impact/likelihood ratings
- Date of identification
- Description
- Countermeasures/Controls
- Risk Owner
- Status
## Compensating Control
a substitute of a principal control
e.g. adding MFA if long password is required but not possible on a certain system
## Exception Management
A formal process of documenting functions or assets non-compliant with written policy and procedural controls.
Points to note:
- Business process and assets affected
- Personnel involved
- Reason for exception
- Risk assessment
- Compensating controls utilized
- Duration of the exception
If a certain policy or procedure is generating numerous *exception requests*, it needs redesign or reconsideration
# Training and Exercises
## Tabletop exercises
#table_top_exercise #ttx

## Penetration testing
#pen_testing #penetration_testing #pentest
- Test to discover vulnerabilities or prove security controls work
- examine the system to identify any logical weakness
- Interviewing personnel to gather information
It should be targeted to be effective
## Red/Blue/White exercises
- Red: Attacker
- Blue: Defender:
- White: set up and evaluation 
