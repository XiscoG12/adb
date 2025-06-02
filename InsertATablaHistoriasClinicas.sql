USE HospitalDB;
GO

INSERT INTO dbo.HistoriasClinicas (
    PacienteID, EstablecimientoID, PersonalSaludID, FechaHoraCreacion, FirmaCreador,
    EdadPacienteAlMomento, SexoPacienteAlMomento, NumeroCamaExpediente,
    GrupoEtnico, AntecedentesHeredoFamiliares, AntecedentesPersonalesPatologicos,
    AntecedentesPersonalesNoPatologicos, PadecimientoActual, InterrogatorioAparatosSistemas,
    HabitusExterior, Temperatura, TensionArterial, FrecuenciaCardiaca, FrecuenciaRespiratoria,
    Peso, Talla, ExploracionDetallada, ResultadosEstudios, DiagnosticosProblemasClinicos,
    Pronostico, IndicacionTerapeutica
)
VALUES
(
    1,
    1,
    1,
    '2025-05-28 09:00:00',
    'Dr. Alejandro Soto',
    39,
    'Masculino',
    'CONS-01',
    'Mestizo',
    'Madre con Diabetes Mellitus tipo 2, Padre con Hipertensión Arterial.',
    'Neumonía hace 5 años (tratada), Apendicectomía a los 15 años. No fumador, consumo social de alcohol (ocasional), niega uso de drogas.',
    'Vivienda con todos los servicios, dieta variada, ejercicio moderado 3 veces/semana.',
    'Paciente masculino de 39 años que acude por tos productiva de 3 días de evolución, fiebre de 38.5°C y disnea de pequeños esfuerzos. Refiere dolor torácico pleurítico derecho.',
    'Cardiovascular: Sincope negado, palpitaciones negadas. Respiratorio: Disnea, tos. Digestivo: Náuseas negadas, vómito negado, diarrea negada. Urinario: Disuria negada, polaquiuria negada. Neurológico: Cefalea negada, mareo negado.',
    'Normolíneo, hidratado, consciente, orientado, cooperador. Facies álgica.',
    38.5,
    '130/85 mmHg',
    95,
    22,
    75.00,
    1.70,
    'Tórax: Campos pulmonares con crepitantes en base derecha. Corazón: Ruidos cardiacos rítmicos, sin soplos. Abdomen: Blando, depresible, sin dolor a la palpación. Extremidades: Sin edema.',
    'Radiografía de tórax: Infiltrado en lóbulo inferior derecho. Biometría Hemática: Leucocitosis 15,000/uL con neutrofilia.',
    'Neumonía Adquirida en la Comunidad (NAC), Hipertensión Arterial.',
    'Reservado a evolución. Depende de la respuesta al tratamiento antibiótico.',
    'Ingreso hospitalario. Ceftriaxona 1g IV cada 24h. Hidratación IV. Paracetamol 500mg VO cada 6h PRN fiebre/dolor.'
),
(
    2,
    2,
    2,
    '2025-05-29 11:00:00',
    'Dra. Carla Méndez',
    33,
    'Femenino',
    'CONS-02',
    'Indígena',
    'Abuela materna con Diabetes Mellitus tipo 2.',
    'Niega patológicos. Niega tabaquismo, alcoholismo o uso de drogas.',
    'Vivienda rural, agua potable, saneamiento básico. Dieta tradicional. Actividad física moderada por trabajo agrícola.',
    'Paciente femenina de 33 años que refiere dolor abdominal agudo en fosa ilíaca derecha de 12 horas de evolución, acompañado de náuseas y un episodio de vómito. Niega fiebre.',
    'Cardiovascular: Sincope negado. Respiratorio: Sin alteraciones. Digestivo: Dolor abdominal, náuseas, vómito. Urinario: Disuria negada. Ginecológico: Menarca 13 años, G2 P2 A0 C0.',
    'Delgada, hidratada, consciente, orientada. Facies de dolor.',
    37.0,
    '110/70 mmHg',
    88,
    18,
    58.00,
    1.60,
    'Abdomen: Dolor a la palpación en fosa ilíaca derecha, signo de McBurney positivo, Blumberg positivo. Ruidos intestinales presentes. Extremidades: Sin alteraciones.',
    'Biometría Hemática: Leucocitosis 12,000/uL. Ultrasonido abdominal: Apéndice cecal con signos de inflamación aguda.',
    'Apendicitis Aguda.',
    'Favorable con tratamiento quirúrgico oportuno.',
    'Preparación prequirúrgica. Apendicectomía laparoscópica. Hidratación IV. Analgesia.'
);
GO

SELECT * FROM dbo.HistoriasClinicas;
GO