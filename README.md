Procurement Audit Automation & Margin Recovery System

Sector: Supply Chain & Fintech | Impact: $134,579 in identified procurement leakage | Efficiency Gain: 80% reduction in manual audit time


Executive Summary
A full-stack Business Intelligence solution engineered to detect financial leakage within procurement datasets. By transforming 244+ rows of unstructured retail data into a high-fidelity audit engine, this system identified a 6% variance on hardware procurement and built an automated risk-mitigation pipeline that bridges the gap between raw data and operational action — with a 48-hour resolution SLA.

Technical Stack
LayerToolsData EngineeringPower Query (M), Python (Pandas)Analysis & LogicSQL (CASE statements, Risk Scoring), Excel (VLOOKUP, Variance Auditing)VisualizationPower BI, TableauWorkflow AutomationAsana, Monday.com

Project Architecture: 3-Phase Roadmap

Phase 1 — Data Transformation (Sanitization Layer)
Problem: Raw data contained inconsistent product naming (e.g., iphone 15 vs iPhone 15) and unrealistic pricing units, making analysis unreliable.
Solution: Built a Power Query Transformation Layer using TRIM, CLEAN, and conditional pricing logic to standardize inputs at the source. The result is a Refresh-Proof pipeline — new data entering the system is automatically standardized without manual intervention.

Phase 2 — The Audit Engine (SQL & Python)
SQL — Risk Register Query

Engineered a Risk_Register query using CASE statements to quantify regional overpayment exposure
Finding: Identified $66,690 in overpayment risk concentrated in the East Coast warehouse region

Python — Automated Flagging Script

Developed a Pandas script to detect "High-Priority" variances (> 5% threshold)
Flags are automatically exported into the resolution pipeline — zero manual handoff required


Phase 3 — Operational Response (Workflow Automation)
Converted static audit findings into accountable, time-bound tasks:

Integrated High-Risk flags directly into Asana and Monday.com
Automated task assignment to procurement leads upon flag trigger
Enforced a mandatory 48-hour resolution window per flagged item


Key Business Outcomes
OutcomeResultProcurement Leakage Identified$134,579Manual Audit Time Reduced80% via Python automationResolution SLA48-hour automated workflowVisualization CoveragePower BI + Tableau (tool-agnostic deployment)

Repository Structure
/
├── scripts/          # Python automation — data cleaning & variance flagging
├── queries/          # SQL Risk Register & variance analysis queries
└── docs/             # Strategic slide deck (boardroom-ready translation)

About This Project
Built as part of a self-directed BA & Data Analytics portfolio spanning Excel, SQL, Power BI, Tableau, Python, and project management tooling. This project demonstrates end-to-end capability: from raw data ingestion to executive-level insight delivery.
