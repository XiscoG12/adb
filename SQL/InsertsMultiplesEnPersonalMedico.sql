USE HospitalDB;
GO

-- Inserts para la tabla PersonalSalud (Corregido: PersonalID es IDENTITY)
INSERT INTO dbo.PersonalSalud (NombreCompleto, CedulaProfesional, Especialidad, TipoPersonal)
VALUES
('Dr. Alejandro Soto P�rez', '1234567', 'Medicina Interna', 'M�dico'),
('Dra. Carla M�ndez Ru�z', '7654321', 'Cirug�a General', 'M�dico'),
('Dr. Ricardo Vargas L�pez', '9876543', 'Gastroenterolog�a', 'M�dico'),
('Enf. Laura G�mez Salas', 'ENF-001', 'Enfermer�a General', 'Enfermera'),
('Dr. Miguel Castro D�az', '2345678', 'Pediatr�a', 'M�dico'),
('Enf. Juanita Robles Cruz', 'ENF-002', 'Enfermer�a Quir�rgica', 'Enfermera'),
('Lic. Ana Torres Mora', 'TL-001', 'Qu�mico Cl�nico Bi�logo', 'T�cnico Laboratorista');
GO

-- Para verificar los registros insertados en PersonalSalud:
SELECT * FROM dbo.PersonalSalud;
GO
