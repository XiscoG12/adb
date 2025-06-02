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
    'Paciente con diagn�stico de colecistitis aguda. Persiste dolor en hipocondrio derecho, aunque de menor intensidad con analg�sicos. Tolera dieta blanda. Sin fiebre. Se mantiene en vigilancia para posible colecistectom�a programada.',
    'TA: 125/80 mmHg, FC: 75 lpm, FR: 16 rpm, Temp: 37.1�C, SatO2: 97%',
    'Ultrasonido abdominal: Ves�cula biliar distendida con c�lculo en el cuello. Leucocitosis 10,500/uL.',
    'Colecistitis aguda liti�sica.',
    'Reservado a evoluci�n quir�rgica.',
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
    'Paciente con diagn�stico de asma bronquial. Tras 24h de tratamiento, presenta franca mejor�a de la disnea y sibilancias. Se encuentra afebril y con buena saturaci�n de ox�geno. Se valora egreso hospitalario.',
    'TA: 110/70 mmHg, FC: 68 lpm, FR: 14 rpm, Temp: 36.5�C, SatO2: 98%',
    'Gasometr�a arterial dentro de par�metros normales. Radiograf�a de t�rax sin infiltrados nuevos.',
    'Asma bronquial en remisi�n.',
    'Favorable para egreso. Buen pron�stico con apego a tratamiento ambulatorio.',
    'Plan de egreso: Salbutamol inhalador 2 disparos cada 6h PRN disnea. Prednisona 20mg VO cada 24h por 3 d�as. Cita a consulta externa en 7 d�as.'
);
GO

SELECT * FROM dbo.NotasEvolucion;
GO