CREATE DATABASE [HospitalDB];
GO

USE [HospitalDB];
GO


-- Tabla para Establecimientos (5.2.1, 5.2.2)
CREATE TABLE Establecimientos (
    EstablecimientoID INT PRIMARY KEY IDENTITY(1,1),
    TipoEstablecimiento NVARCHAR(100),
    NombreEstablecimiento NVARCHAR(255) NOT NULL,
    DomicilioEstablecimiento NVARCHAR(MAX) NOT NULL,
    NombreInstitucionPertenece NVARCHAR(255), -- Ejemplo: ISSTE, IMSS, Privado
    RazonSocialPropietario NVARCHAR(255), -- (Ref: 5.2.2)
    DenominacionSocialPropietario NVARCHAR(255)
);
GO
-- Tabla para Pacientes (5.2.3)
CREATE TABLE Pacientes (
    PacienteID INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto NVARCHAR(255) NOT NULL,
    Sexo NVARCHAR(10) NOT NULL, -- Ejemplo: Femenino, Masculino, otros
    FechaNacimiento DATE,
    Edad AS ( -- Edad calculada en automatico
        CASE
            WHEN FechaNacimiento IS NULL THEN NULL
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, FechaNacimiento, GETDATE()), FechaNacimiento) > GETDATE()
            THEN DATEDIFF(YEAR, FechaNacimiento, GETDATE()) - 1
            ELSE DATEDIFF(YEAR, FechaNacimiento, GETDATE())
        END
    ),
    DomicilioPaciente NVARCHAR(MAX) NOT NULL,
    GrupoEtnico NVARCHAR(100),
    FechaRegistro DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE PersonalSalud (
    PersonalID INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto NVARCHAR(255) NOT NULL,
    CedulaProfesional VARCHAR(50), -- Si es que aplica
    Especialidad NVARCHAR(100), -- Ejemplos: Cardiologia, Pediatria
    TipoPersonal NVARCHAR(50) NOT NULL -- Ejemplos: Medico, Enfermera, Técnico Laboratorista
);
GO

CREATE TABLE HistoriasClinicas (
    HistoriaClinicaID INT PRIMARY KEY IDENTITY(1,1),
    PacienteID INT NOT NULL,
    EstablecimientoID INT NOT NULL,
    PersonalSaludID INT NOT NULL,
    FechaHoraCreacion DATETIME2 NOT NULL,
    FirmaCreador NVARCHAR(255),
    EdadPacienteAlMomento INT,
    SexoPacienteAlMomento NVARCHAR(10), -- Sexo del paciente al momento (5.9)
    NumeroCamaExpediente NVARCHAR(50), -- Numero de cama o expediente (5.9), no se requiere si es consulta general/especialidad

    -- 6.1.1 Interrogatorio
    GrupoEtnico NVARCHAR(100), 
    AntecedentesHeredoFamiliares NVARCHAR(MAX),
    AntecedentesPersonalesPatologicos NVARCHAR(MAX), -- Incluir uso y dependencia de tabaco, alcohol, drogas, otros
    AntecedentesPersonalesNoPatologicos NVARCHAR(MAX),
    PadecimientoActual NVARCHAR(MAX),
    InterrogatorioAparatosSistemas NVARCHAR(MAX),

    -- 6.1.2 Exploración Fisica
    HabitusExterior NVARCHAR(MAX),
    Temperatura DECIMAL(4,1),
    TensionArterial VARCHAR(20),
    FrecuenciaCardiaca INT,
    FrecuenciaRespiratoria INT, -- Respiraciones por minuto
    Peso DECIMAL(5,2), -- Kg
    Talla DECIMAL(3,2), -- M
    ExploracionDetallada NVARCHAR(MAX), -- Datos adicionales sobre percances en el cuerpo del paciente.

    -- 6.1.3 Resultados Previos y Actuales
    ResultadosEstudios NVARCHAR(MAX), -- De laboratorio, gabinete, otros

    -- 6.1.4 Diagnosticos
    DiagnosticosProblemasClinicos NVARCHAR(MAX),

    -- 6.1.5 Pronostico
    Pronostico NVARCHAR(MAX),

    -- 6.1.6 Indicacion Terapeutica
    IndicacionTerapeutica NVARCHAR(MAX),

    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (EstablecimientoID) REFERENCES Establecimientos(EstablecimientoID),
    FOREIGN KEY (PersonalSaludID) REFERENCES PersonalSalud(PersonalID)
);
GO

CREATE TABLE NotasEvolucion (
    NotaEvolucionID INT PRIMARY KEY IDENTITY(1,1),
    PacienteID INT NOT NULL,
    EstablecimientoID INT NOT NULL,
    PersonalSaludID INT NOT NULL,
    FechaHoraCreacion DATETIME2 NOT NULL,
    FirmaCreador NVARCHAR(255), 
    EdadPacienteAlMomento INT,
    SexoPacienteAlMomento NVARCHAR(10),
    NumeroCamaExpediente NVARCHAR(50),

    -- 6.2.1
    EvolucionActualizacionCuadroClinico NVARCHAR(MAX),

    -- 6.2.2
    SignosVitales NVARCHAR(MAX),

    -- 6.2.3
    ResultadosRelevantesEstudiosAuxiliares NVARCHAR(MAX),

    -- 6.2.4
    DiagnosticosProblemasClinicos NVARCHAR(MAX),

    -- 6.2.5
    Pronostico NVARCHAR(MAX),

    -- 6.2.6
    TratamientoIndicacionesMedicas NVARCHAR(MAX), -- Para medicamentos: dosis, via, cada cuando se tienen que tomarlos

    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (EstablecimientoID) REFERENCES Establecimientos(EstablecimientoID),
    FOREIGN KEY (PersonalSaludID) REFERENCES PersonalSalud(PersonalID)
);
GO


-- Tabla para Notas de Interconsulta (6.3)
CREATE TABLE NotasInterconsulta (
    NotaInterconsultaID INT PRIMARY KEY IDENTITY(1,1),
    PacienteID INT NOT NULL,
    EstablecimientoID INT NOT NULL, -- Establecimiento donde se genera la consulta
    MedicoSolicitanteID INT NOT NULL, -- Medico que solicita la consulta
    MedicoConsultadoID INT NOT NULL, -- Medico que realiza la interconsulta y elabora la nota
    FechaHoraCreacion DATETIME2 NOT NULL, -- Esta se usa para cuando el medico especialista hace y guarda su respuesta
    FirmaCreador NVARCHAR(255), -- Firma del medico consultado
    EdadPacienteAlMomento INT, 
    SexoPacienteAlMomento NVARCHAR(10),
    NumeroCamaExpediente NVARCHAR(50),

    FechaHoraSolicitud DATETIME2, -- Fecha y hora en que se solicito la interconsulta
    MotivoSolicitud NVARCHAR(MAX), -- Motivo por el cual se solicita la interconsulta

    -- Notas del medico consultado (6.3.1, 6.3.2, 6.3.3)
    CriteriosDiagnosticos NVARCHAR(MAX),
    PlanEstudios NVARCHAR(MAX),
    SugerenciasDiagnosticasTratamiento NVARCHAR(MAX),

    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (EstablecimientoID) REFERENCES Establecimientos(EstablecimientoID),
    FOREIGN KEY (MedicoSolicitanteID) REFERENCES PersonalSalud(PersonalID),
    FOREIGN KEY (MedicoConsultadoID) REFERENCES PersonalSalud(PersonalID)
);
GO


-- Tabla para Notas de Referencia/Traslado (6.4)
CREATE TABLE NotasReferenciaTraslado (
    NotaReferenciaTrasladoID INT PRIMARY KEY IDENTITY(1,1),
    PacienteID INT NOT NULL,
    MedicoEnviaID INT NOT NULL,
    FechaHoraCreacion DATETIME2 NOT NULL,
    FirmaCreador NVARCHAR(255),
    EdadPacienteAlMomento INT, 
    SexoPacienteAlMomento NVARCHAR(10),
    NumeroCamaExpediente NVARCHAR(50),

    -- 6.4.1
    EstablecimientoEnviaID INT NOT NULL, -- Foreign key a Establecimientos

    -- 6.4.2
    NombreEstablecimientoReceptor NVARCHAR(255) NOT NULL, -- Nombre del establecimiento que recibe
    DomicilioEstablecimientoReceptor NVARCHAR(MAX), -- Domicilio del establecimiento receptor

    -- 6.4.3
    MotivoEnvio NVARCHAR(MAX) NOT NULL,
    ImpresionDiagnostica NVARCHAR(MAX) NOT NULL,
    TerapeuticaEmpleada NVARCHAR(MAX), -- Si la hubo

    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (EstablecimientoEnviaID) REFERENCES Establecimientos(EstablecimientoID),
    FOREIGN KEY (MedicoEnviaID) REFERENCES PersonalSalud(PersonalID)
);
GO