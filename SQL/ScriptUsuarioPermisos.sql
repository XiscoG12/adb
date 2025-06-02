USE [HospitalDB]
GO
CREATE USER UsuarioConsultaHospital FROM LOGIN UsuarioConsulta;
GO
-- Rol de solo lectura (db_datareader) para el usuario
ALTER ROLE db_datareader ADD MEMBER UsuarioConsultaHospital;
