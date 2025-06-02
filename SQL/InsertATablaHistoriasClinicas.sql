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
    'Madre con Diabetes Mellitus tipo 2, Padre con Hipertensi�n Arterial.',
    'Neumon�a hace 5 a�os (tratada), Apendicectom�a a los 15 a�os. No fumador, consumo social de alcohol (ocasional), niega uso de drogas.',
    'Vivienda con todos los servicios, dieta variada, ejercicio moderado 3 veces/semana.',
    'Paciente masculino de 39 a�os que acude por tos productiva de 3 d�as de evoluci�n, fiebre de 38.5�C y disnea de peque�os esfuerzos. Refiere dolor tor�cico pleur�tico derecho.',
    'Cardiovascular: Sincope negado, palpitaciones negadas. Respiratorio: Disnea, tos. Digestivo: N�useas negadas, v�mito negado, diarrea negada. Urinario: Disuria negada, polaquiuria negada. Neurol�gico: Cefalea negada, mareo negado.',
    'Normol�neo, hidratado, consciente, orientado, cooperador. Facies �lgica.',
    38.5,
    '130/85 mmHg',
    95,
    22,
    75.00,
    1.70,
    'T�rax: Campos pulmonares con crepitantes en base derecha. Coraz�n: Ruidos cardiacos r�tmicos, sin soplos. Abdomen: Blando, depresible, sin dolor a la palpaci�n. Extremidades: Sin edema.',
    'Radiograf�a de t�rax: Infiltrado en l�bulo inferior derecho. Biometr�a Hem�tica: Leucocitosis 15,000/uL con neutrofilia.',
    'Neumon�a Adquirida en la Comunidad (NAC), Hipertensi�n Arterial.',
    'Reservado a evoluci�n. Depende de la respuesta al tratamiento antibi�tico.',
    'Ingreso hospitalario. Ceftriaxona 1g IV cada 24h. Hidrataci�n IV. Paracetamol 500mg VO cada 6h PRN fiebre/dolor.'
),
(
    2,
    2,
    2,
    '2025-05-29 11:00:00',
    'Dra. Carla M�ndez',
    33,
    'Femenino',
    'CONS-02',
    'Ind�gena',
    'Abuela materna con Diabetes Mellitus tipo 2.',
    'Niega patol�gicos. Niega tabaquismo, alcoholismo o uso de drogas.',
    'Vivienda rural, agua potable, saneamiento b�sico. Dieta tradicional. Actividad f�sica moderada por trabajo agr�cola.',
    'Paciente femenina de 33 a�os que refiere dolor abdominal agudo en fosa il�aca derecha de 12 horas de evoluci�n, acompa�ado de n�useas y un episodio de v�mito. Niega fiebre.',
    'Cardiovascular: Sincope negado. Respiratorio: Sin alteraciones. Digestivo: Dolor abdominal, n�useas, v�mito. Urinario: Disuria negada. Ginecol�gico: Menarca 13 a�os, G2 P2 A0 C0.',
    'Delgada, hidratada, consciente, orientada. Facies de dolor.',
    37.0,
    '110/70 mmHg',
    88,
    18,
    58.00,
    1.60,
    'Abdomen: Dolor a la palpaci�n en fosa il�aca derecha, signo de McBurney positivo, Blumberg positivo. Ruidos intestinales presentes. Extremidades: Sin alteraciones.',
    'Biometr�a Hem�tica: Leucocitosis 12,000/uL. Ultrasonido abdominal: Ap�ndice cecal con signos de inflamaci�n aguda.',
    'Apendicitis Aguda.',
    'Favorable con tratamiento quir�rgico oportuno.',
    'Preparaci�n prequir�rgica. Apendicectom�a laparosc�pica. Hidrataci�n IV. Analgesia.'
);
GO

SELECT * FROM dbo.HistoriasClinicas;
GO