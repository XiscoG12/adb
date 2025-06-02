USE [HospitalDB]
GO
CREATE ROLE [RolVisualizadorPacientes]
GO
GRANT SELECT ON dbo.Pacientes TO RolVisualizadorPacientes;
GO
