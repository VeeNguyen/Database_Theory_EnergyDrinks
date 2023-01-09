# CMSC 508 Project Database Scripts

This folder contains MySQL scripts used to create and maintain the database, as well as the queries to answer the 20 questions in the phase 1 documentation.

To set up the database, the order of execution of scripts is:
1. createDatabase.sql
2. loadAdvancedConstraints.sql
3. loadEntityData.sql
4. loadRelationData.sql
5. createViewsandStoredProcedures.sql
6. loadUserRoles.sql

File | Description | Team Member(s)
--- | --- | ---
createDatabase.sql | Script to create the primary schema for the database, and the basic constraints. | McCrae Smith
loadAdvancedConstraints | Script to load the advanced constraints for the database, such as the type lists, and the date checking triggers. | McCrae Smith
loadEntityData.sql | Script to load the sample data for the primary entities of the database. | Guruman Singh, McCrae Smith
loadRelationData.sql | Script to load the sample data for the primary relations of the database. | McCrae Smith
loadUserRoles.sql | Script to create the primary and secondary user roles, and assign needed priviliges. | McCrae Smith
createViewsandStoredProcedures | Script to create primary views and stored procedures for common database operations. | McCrae Smith
Final20Query.sql | Script containing SQL queries for the twenty questions provided in the phase 1 documentation. | Christain Romero Taipe
