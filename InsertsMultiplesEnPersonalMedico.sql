USE HospitalDB;
GO

-- Inserts para la tabla PersonalSalud (Corregido: PersonalID es IDENTITY)
INSERT INTO dbo.PersonalSalud (NombreCompleto, CedulaProfesional, Especialidad, TipoPersonal)
VALUES
('Dr. Alejandro Soto Pérez', '1234567', 'Medicina Interna', 'Médico'),
('Dra. Carla Méndez Ruíz', '7654321', 'Cirugía General', 'Médico'),
('Dr. Ricardo Vargas López', '9876543', 'Gastroenterología', 'Médico'),
('Enf. Laura Gómez Salas', 'ENF-001', 'Enfermería General', 'Enfermera'),
('Dr. Miguel Castro Díaz', '2345678', 'Pediatría', 'Médico'),
('Enf. Juanita Robles Cruz', 'ENF-002', 'Enfermería Quirúrgica', 'Enfermera'),
('Lic. Ana Torres Mora', 'TL-001', 'Químico Clínico Biólogo', 'Técnico Laboratorista');
GO

-- Para verificar los registros insertados en PersonalSalud:
SELECT * FROM dbo.PersonalSalud;
GO
