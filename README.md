#College of Idaho Club Management Database

This project implements a comprehensive database schema for managing various student clubs and their activities at The College of Idaho. The system keeps track of club details, events, executive members, supervisors, and individual members. It also supports creating and managing views for insights into club operations.

##Overview

The database consists of tables such as:

- **Events:** Stores details of club events, including their descriptions, dates, and locations.
- **Yote:** Manages information about members, supervisors, and executive members within the college community.
- **ExecutiveMember:** Tracks executive roles and responsibilities within the clubs.
- **Club:** Contains club-specific information, including location, budget, meeting times, and supervisor details.
- **YoteExecutive and YoteClub:** Define relationships between members, executives, and their respective clubs.

##Views

The database includes several views to provide a structured presentation of data:

- **Club_Executive_Members:** Displays information about executive members and their roles within each club.
- **Club_Details:** Offers a detailed look into club information, including location, capacity, and the club's supervisor.
- **Club_Members:** Lists all members in each club.
- **Club_Events:** Shows events organized by each club, including budget, location, and supervisor information.
Presentation

For a deeper understanding of the database's UML design, constraints, and stakeholder involvement, a presentation has been prepared to walk through the structure and functionalities in detail. It covers the schema, key constraints, and how different stakeholders interact with the system.
