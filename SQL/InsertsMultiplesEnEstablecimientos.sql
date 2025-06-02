USE HospitalDB;
GO

-- Inserts para la tabla Establecimientos
INSERT INTO dbo.Establecimientos (TipoEstablecimiento, NombreEstablecimiento, DomicilioEstablecimiento, NombreInstitucionPertenece, RazonSocialPropietario, DenominacionSocialPropietario)
VALUES
('Hospital General', 'Hospital Central de la Ciudad', 'Avenida de la Salud 100, Centro, Ciudad Ejemplo, CP 89000', 'Secretaría de Salud', 'Gobierno del Estado', 'Servicios de Salud del Estado'),
('Clínica Especializada', 'Clínica San Juan', 'Calle de los Médicos 50, Colonia Doctores, Ciudad Eterna, CP 90000', 'Privado', 'Corporación Médica del Norte S.A. de C.V.', 'Clínica San Juan S.A.'),
('Hospital Infantil', 'Hospital Pediátrico Estrella', 'Bulevar de los Niños 20, Jardines del Sol, Villa Hermosa, CP 88000', 'IMSS', 'Instituto Mexicano del Seguro Social', 'IMSS - Hospital Pediátrico'),
('Centro de Salud', 'Centro de Salud Urbano No. 1', 'Calle Principal 1, Colonia Centro, Puerto Seguro, CP 91000', 'Secretaría de Salud', 'Gobierno del Estado', 'Servicios de Salud del Estado'),
('Hospital de Especialidades', 'Hospital de Alta Especialidad del Sureste', 'Avenida Tecnológico 300, Ciudad del Conocimiento, Nuevo Horizonte, CP 85000', 'ISSTE', 'Instituto de Seguridad y Servicios Sociales de los Trabajadores del Estado', 'ISSTE - Hospital Regional'),
('Consultorio Médico', 'Consultorio Dr. Gómez', 'Calle Tulipanes 15, Colonia Flores, Ciudad Tranquila, CP 86000', 'Privado', 'Dr. Carlos Gómez Ramírez', 'Consultorio Médico General');
GO

-- Para verificar los registros insertados en Establecimientos:
SELECT * FROM dbo.Establecimientos;
GO

