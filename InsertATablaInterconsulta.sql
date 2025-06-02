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
    'Valoración por posible cuadro de colecistitis aguda en paciente con neumonía. Dolor en hipocondrio derecho que no cede con analgésicos habituales.',
    'El paciente presenta dolor en hipocondrio derecho, Murphy positivo, leucocitosis. Criterios de Tokyo para colecistitis aguda: Grado I (inflamación local).',
    'Se sugiere realizar ultrasonido abdominal de control en 24h. Considerar colangioresonancia si hay sospecha de coledocolitiasis.',
    'Manejo conservador inicial con ayuno, hidratación y antibiótico. Valorar colecistectomía laparoscópica una vez resuelta la neumonía y estabilizado el cuadro abdominal.'
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
    'Valoración preoperatoria de paciente diabético descompensado con neuropatía, programado para cirugía de hernia inguinal. Optimización de control glucémico.',
    'Paciente con DM2 descompensada (HbA1c 9.5%, glucemias elevadas). Riesgo cardiovascular elevado por edad y comorbilidades. Neuropatía diabética presente.',
    'Se recomienda perfil de lípidos, electrocardiograma, y valoración cardiológica preoperatoria. Monitoreo estrecho de glucemias capilares.',
    'Ajustar dosis de insulina según curva de glucemia. Mantener glucemias entre 100-180 mg/dL. Considerar posponer cirugía electiva hasta lograr mejor control metabólico.'
);
GO

SELECT * FROM dbo.NotasInterconsulta;
GO
