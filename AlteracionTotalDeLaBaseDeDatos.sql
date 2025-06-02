USE HospitalDB;
GO
ALTER TABLE dbo.Establecimientos 
ADD deleted BIT NOT NULL CONSTRAINT DF_Establecimientos_deleted DEFAULT 0;
GO

ALTER TABLE dbo.Pacientes 
ADD deleted BIT NOT NULL CONSTRAINT DF_Pacientes_deleted DEFAULT 0;
GO

ALTER TABLE dbo.PersonalSalud 
ADD deleted BIT NOT NULL CONSTRAINT DF_PersonalSalud_deleted DEFAULT 0;
GO

ALTER TABLE dbo.HistoriasClinicas 
ADD deleted BIT NOT NULL CONSTRAINT DF_HistoriasClinicas_deleted DEFAULT 0;
GO

ALTER TABLE dbo.NotasEvolucion
ADD deleted BIT NOT NULL CONSTRAINT DF_NotasEvolucion_deleted DEFAULT 0;
GO

ALTER TABLE dbo.NotasInterconsulta
ADD deleted BIT NOT NULL CONSTRAINT DF_NotasInterconsulta_deleted DEFAULT 0;
GO

ALTER TABLE dbo.NotasReferenciaTraslado
ADD deleted BIT NOT NULL CONSTRAINT DF_NotasReferenciaTraslado_deleted DEFAULT 0;
GO