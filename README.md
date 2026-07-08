# Dental Clinic Database Design

## Project Overview

This project presents the design of a relational database for a dental clinic system based on a real-world case study. It models operations such as patients, dentists, appointments, treatments, equipment, offices, and clinical history.

## Objectives

- Design a structured relational database
- Model real-world healthcare operations
- Implement SQL schema and relationships
- Support appointment and treatment workflows

## Main Entities

- Patients
- Dentists
- Appointments
- Treatments
- Clinical Histories
- Locations
- Offices
- Equipment
- Membership Plans

## Tools Used

- SQL
- ER Modeling
- Database Design

## Key Features

- Normalized relational structure
- Foreign key relationships
- Real-world constraints
- Clinical history tracking
- Appointment and treatment management

## ER Diagram

![ER Diagram](https://github.com/ValerieDC/dental-clinic-database/raw/main/diagrams/er-diagram.png)

## Project Structure

```
dental-clinic-database/
├── sql/                  # SQL scripts: schema creation, constraints, and sample queries
├── diagrams/
│   └── er-diagram.png    # Entity-relationship diagram
└── README.md
```

## How to Use

1. Clone the repository.
2. Review the ER diagram above to understand the data model.
3. Run the scripts inside `sql/` in order (schema first, then any seed/query scripts) on a MySQL or compatible SQL instance.

## Files Included

- `sql/` — database schema and query scripts
- `diagrams/er-diagram.png` — entity-relationship diagram
- `README.md` — project documentation
