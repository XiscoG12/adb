USE HospitalDB;
GO

-- Inserts para la tabla Establecimientos
INSERT INTO dbo.Establecimientos (TipoEstablecimiento, NombreEstablecimiento, DomicilioEstablecimiento, NombreInstitucionPertenece, RazonSocialPropietario, DenominacionSocialPropietario)
VALUES
('Hospital General', 'Hospital Central de la Ciudad', 'Avenida de la Salud 100, Centro, Ciudad Ejemplo, CP 89000', 'Secretar�a de Salud', 'Gobierno del Estado', 'Servicios de Salud del Estado'),
('Cl�nica Especializada', 'Cl�nica San Juan', 'Calle de los M�dicos 50, Colonia Doctores, Ciudad Eterna, CP 90000', 'Privado', 'Corporaci�n M�dica del Norte S.A. de C.V.', 'Cl�nica San Juan S.A.'),
('Hospital Infantil', 'Hospital Pedi�trico Estrella', 'Bulevar de los Ni�os 20, Jardines del Sol, Villa Hermosa, CP 88000', 'IMSS', 'Instituto Mexicano del Seguro Social', 'IMSS - Hospital Pedi�trico'),
('Centro de Salud', 'Centro de Salud Urbano No. 1', 'Calle Principal 1, Colonia Centro, Puerto Seguro, CP 91000', 'Secretar�a de Salud', 'Gobierno del Estado', 'Servicios de Salud del Estado'),
('Hospital de Especialidades', 'Hospital de Alta Especialidad del Sureste', 'Avenida Tecnol�gico 300, Ciudad del Conocimiento, Nuevo Horizonte, CP 85000', 'ISSTE', 'Instituto de Seguridad y Servicios Sociales de los Trabajadores del Estado', 'ISSTE - Hospital Regional'),
('Consultorio M�dico', 'Consultorio Dr. G�mez', 'Calle Tulipanes 15, Colonia Flores, Ciudad Tranquila, CP 86000', 'Privado', 'Dr. Carlos G�mez Ram�rez', 'Consultorio M�dico General');
GO

-- Para verificar los registros insertados en Establecimientos:
SELECT * FROM dbo.Establecimientos;
GO

