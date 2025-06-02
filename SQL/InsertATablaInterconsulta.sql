USE HospitalDB;
GO

INSERT INTO dbo.NotasInterconsulta (
    PacienteID, EstablecimientoID, MedicoSolicitanteID, MedicoConsultadoID,
    FechaHoraCreacion, FirmaCreador, EdadPacienteAlMomento, SexoPacienteAlMomento,
    NumeroCamaExpediente, FechaHoraSolicitud, MotivoSolicitud,
    CriteriosDiagnosticos, PlanEstudios, SugerenciasDiagnosticasTratamiento
)
VALUES
(
    1,
    1,
    1,
    3,
    '2025-05-30 11:00:00',
    'Dr. Ricardo Vargas',
    39,
    'Masculino',
    'C-05',
    '2025-05-29 18:00:00',
    'Valoraci�n por posible cuadro de colecistitis aguda en paciente con neumon�a. Dolor en hipocondrio derecho que no cede con analg�sicos habituales.',
    'El paciente presenta dolor en hipocondrio derecho, Murphy positivo, leucocitosis. Criterios de Tokyo para colecistitis aguda: Grado I (inflamaci�n local).',
    'Se sugiere realizar ultrasonido abdominal de control en 24h. Considerar colangioresonancia si hay sospecha de coledocolitiasis.',
    'Manejo conservador inicial con ayuno, hidrataci�n y antibi�tico. Valorar colecistectom�a laparosc�pica una vez resuelta la neumon�a y estabilizado el cuadro abdominal.'
),
(
    5,
    2,
    2,
    1,
    '2025-06-01 15:30:00',
    'Dr. Alejandro Soto',
    60,
    'Masculino',
    'C-10',
    '2025-06-01 10:00:00',
    'Valoraci�n preoperatoria de paciente diab�tico descompensado con neuropat�a, programado para cirug�a de hernia inguinal. Optimizaci�n de control gluc�mico.',
    'Paciente con DM2 descompensada (HbA1c 9.5%, glucemias elevadas). Riesgo cardiovascular elevado por edad y comorbilidades. Neuropat�a diab�tica presente.',
    'Se recomienda perfil de l�pidos, electrocardiograma, y valoraci�n cardiol�gica preoperatoria. Monitoreo estrecho de glucemias capilares.',
    'Ajustar dosis de insulina seg�n curva de glucemia. Mantener glucemias entre 100-180 mg/dL. Considerar posponer cirug�a electiva hasta lograr mejor control metab�lico.'
);
GO

SELECT * FROM dbo.NotasInterconsulta;
GO
