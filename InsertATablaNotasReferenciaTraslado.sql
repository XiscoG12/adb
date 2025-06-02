USE HospitalDB;
GO

INSERT INTO dbo.NotasReferenciaTraslado (
    PacienteID, MedicoEnviaID, FechaHoraCreacion, FirmaCreador,
    EdadPacienteAlMomento, SexoPacienteAlMomento, NumeroCamaExpediente,
    EstablecimientoEnviaID, NombreEstablecimientoReceptor, DomicilioEstablecimientoReceptor,
    MotivoEnvio, ImpresionDiagnostica, TerapeuticaEmpleada
)
VALUES
(
    6,
    1,
    '2025-06-03 10:00:00',
    'Dr. Alejandro Soto',
    30,
    'Masculino',
    'URG-01',
    1,
    'Hospital de Alta Especialidad del Sureste',
    'Avenida Tecnológico 300, Ciudad del Conocimiento, Nuevo Horizonte, CP 85000',
    'Paciente con traumatismo craneoencefálico severo por accidente automovilístico. Requiere valoración por neurocirugía y manejo en unidad de cuidados intensivos.',
    'Traumatismo Craneoencefálico Severo, Fractura de base de cráneo, Hemorragia intraparenquimatosa.',
    'Estabilización hemodinámica, intubación orotraqueal, sedación, manitol IV.'
),
(
    7,
    5,
    '2025-06-04 14:00:00',
    'Dr. Miguel Castro',
    52,
    'Femenino',
    'CONS-03',
    3,
    'Hospital Central de la Ciudad',
    'Avenida de la Salud 100, Centro, Ciudad Ejemplo, CP 89000',
    'Paciente con sospecha de neoplasia pulmonar. Requiere estudio y manejo por oncología y neumología.',
    'Nódulo pulmonar solitario (sospecha de malignidad), Tabaquismo crónico.',
    'Ninguna específica, solo manejo sintomático.'
);
GO

SELECT * FROM dbo.NotasReferenciaTraslado;
GO