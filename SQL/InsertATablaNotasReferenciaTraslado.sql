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
    'Avenida Tecnol�gico 300, Ciudad del Conocimiento, Nuevo Horizonte, CP 85000',
    'Paciente con traumatismo craneoencef�lico severo por accidente automovil�stico. Requiere valoraci�n por neurocirug�a y manejo en unidad de cuidados intensivos.',
    'Traumatismo Craneoencef�lico Severo, Fractura de base de cr�neo, Hemorragia intraparenquimatosa.',
    'Estabilizaci�n hemodin�mica, intubaci�n orotraqueal, sedaci�n, manitol IV.'
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
    'Paciente con sospecha de neoplasia pulmonar. Requiere estudio y manejo por oncolog�a y neumolog�a.',
    'N�dulo pulmonar solitario (sospecha de malignidad), Tabaquismo cr�nico.',
    'Ninguna espec�fica, solo manejo sintom�tico.'
);
GO

SELECT * FROM dbo.NotasReferenciaTraslado;
GO