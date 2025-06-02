USE HospitalDB;
GO

INSERT INTO dbo.NotasEvolucion (
    PacienteID, EstablecimientoID, PersonalSaludID, FechaHoraCreacion, FirmaCreador,
    EdadPacienteAlMomento, SexoPacienteAlMomento, NumeroCamaExpediente,
    EvolucionActualizacionCuadroClinico, SignosVitales, ResultadosRelevantesEstudiosAuxiliares,
    DiagnosticosProblemasClinicos, Pronostico, TratamientoIndicacionesMedicas
)
VALUES
(
    3,
    1,
    3,
    '2025-06-01 16:00:00',
    'Dr. Ricardo Vargas',
    46,
    'Masculino',
    'C-08',
    'Paciente con diagnóstico de colecistitis aguda. Persiste dolor en hipocondrio derecho, aunque de menor intensidad con analgésicos. Tolera dieta blanda. Sin fiebre. Se mantiene en vigilancia para posible colecistectomía programada.',
    'TA: 125/80 mmHg, FC: 75 lpm, FR: 16 rpm, Temp: 37.1°C, SatO2: 97%',
    'Ultrasonido abdominal: Vesícula biliar distendida con cálculo en el cuello. Leucocitosis 10,500/uL.',
    'Colecistitis aguda litiásica.',
    'Reservado a evolución quirúrgica.',
    'Dieta blanda. Analgesia con Ketorolaco 30mg IV cada 8h. Ampicilina/Sulbactam 1.5g IV cada 8h.'
),
(
    4,
    3,
    5,
    '2025-06-02 09:30:00',
    'Dr. Miguel Castro',
    23,
    'Femenino',
    'C-02',
    'Paciente con diagnóstico de asma bronquial. Tras 24h de tratamiento, presenta franca mejoría de la disnea y sibilancias. Se encuentra afebril y con buena saturación de oxígeno. Se valora egreso hospitalario.',
    'TA: 110/70 mmHg, FC: 68 lpm, FR: 14 rpm, Temp: 36.5°C, SatO2: 98%',
    'Gasometría arterial dentro de parámetros normales. Radiografía de tórax sin infiltrados nuevos.',
    'Asma bronquial en remisión.',
    'Favorable para egreso. Buen pronóstico con apego a tratamiento ambulatorio.',
    'Plan de egreso: Salbutamol inhalador 2 disparos cada 6h PRN disnea. Prednisona 20mg VO cada 24h por 3 días. Cita a consulta externa en 7 días.'
);
GO

SELECT * FROM dbo.NotasEvolucion;
GO