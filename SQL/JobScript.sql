USE msdb; -- Los Jobs se configuran en la base de datos msdb
GO

DECLARE @JobName NVARCHAR(128) = N'Respaldo Diario HospitalDB';
DECLARE @BackupPath NVARCHAR(260) = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\';  -- CAMBIA ruta si quieres guardar el respaldo en otro disco o ruta de red

DECLARE @DatabaseName NVARCHAR(128) = N'HospitalDB';
DECLARE @JobEnabled BIT = 1; -- 1 = habilitado, 0 = deshabilitado

DECLARE @ScheduleName NVARCHAR(128) = N'HorarioRespaldoDiarioHospitalDB';
DECLARE @StepName NVARCHAR(128) = N'Ejecutar Respaldo HospitalDB';
DECLARE @OwnerLoginName NVARCHAR(128) = N'sa'; -- Cambiar si quieres que otro login administre el job
DECLARE @BackupCommand NVARCHAR(MAX);
DECLARE @ScheduleId INT;

-- Eliminar Job y Schedule anterior (si existen), para evitar duplicados al volver a ejecutar el script
IF EXISTS (SELECT job_id FROM dbo.sysjobs_view WHERE name = @JobName)
BEGIN
    EXEC dbo.sp_delete_job @job_name = @JobName, @delete_unused_schedule = 1;
END

IF EXISTS (SELECT schedule_id FROM dbo.sysschedules WHERE name = @ScheduleName)
BEGIN
    SELECT TOP 1 @ScheduleId = schedule_id FROM dbo.sysschedules WHERE name = @ScheduleName;
    IF NOT EXISTS (
        SELECT 1 FROM dbo.sysjobschedules 
        WHERE schedule_id = @ScheduleId 
        AND job_id <> (SELECT job_id FROM dbo.sysjobs WHERE name = @JobName)
    )
    BEGIN
        BEGIN TRY
            IF @ScheduleId IS NOT NULL
            BEGIN
                EXEC dbo.sp_detach_schedule @job_name = @JobName, @schedule_id = @ScheduleId, @delete_automatic_del_schedule = 0;
            END
            EXEC dbo.sp_delete_schedule @schedule_name = @ScheduleName, @force_delete = 1;
        END TRY
        BEGIN CATCH
            -- Se ignora si no se puede eliminar el schedule
        END CATCH
    END
END

-- Crear Job
EXEC dbo.sp_add_job
    @job_name = @JobName,
    @enabled = @JobEnabled,
    @description = N'Realiza un respaldo completo diario de la base de datos HospitalDB.',
    @owner_login_name = @OwnerLoginName,
    @notify_level_email = 0, 
    @notify_level_netsend = 0,
    @notify_level_page = 0,
    @delete_level = 0;

-- Esto al ejecutarse el respaldo lo crea con un nombre dinamico basado en fecha y hora
SET @BackupCommand = N'DECLARE @BackupFileName NVARCHAR(500);' + CHAR(13) + CHAR(10) +
                     N'SET @BackupFileName = N''' + @BackupPath + @DatabaseName +
                     N'_FullBackup_'' + REPLACE(CONVERT(VARCHAR(10), GETDATE(), 112), ''-'', '''') + ''_'' + ' +
                     N'REPLACE(CONVERT(VARCHAR(8), GETDATE(), 108), '':'', '''') + ''.bak'';' + CHAR(13) + CHAR(10) +
                     N'BACKUP DATABASE [' + @DatabaseName + N'] ' + CHAR(13) + CHAR(10) +
                     N'TO DISK = @BackupFileName ' + CHAR(13) + CHAR(10) +
                     N'WITH NOFORMAT, INIT, NAME = N''' + @DatabaseName + N'-Full Database Backup'', ' + CHAR(13) + CHAR(10) +
                     N'SKIP, NOREWIND, NOUNLOAD, STATS = 10;';

EXEC dbo.sp_add_jobstep
    @job_name = @JobName,
    @step_name = @StepName,
    @step_id = 1,
    @cmdexec_success_code = 0,
    @on_success_action = 1, -- 1 = continuar al siguiente paso o finalizar si es el ultimo
    @on_fail_action = 2,    -- 2 = detener job al fallar
    @retry_attempts = 0,
    @retry_interval = 0,
    @os_run_priority = 0,
    @subsystem = N'TSQL',
    @command = @BackupCommand,
    @database_name = N'master',
    @flags = 0;

-- Crear el horario
EXEC dbo.sp_add_schedule
    @schedule_name = @ScheduleName,
    @enabled = 1,
    @freq_type = 4, -- Frecuencia del job:
                    -- 1 = Una sola vez
                    -- 4 = Diario
                    -- 8 = Semanal
                    -- 16 = Mensual
    @freq_interval = 1,  -- Ejecutar cada 1 dia (para @freq_type = 4)
    @freq_subday_type = 1, -- 1 = Una vez al dia (puedes usar 4 = cada X minutos, o 8 = cada X horas si quieres multiples veces)
    @freq_subday_interval = 0,
    @freq_relative_interval = 0,
    @freq_recurrence_factor = 1, -- Ejecutar cada X dias/semanas/etc (valor adicional segun freq_type)
    @active_start_date = NULL, -- NULL = empieza hoy
    @active_end_date = 99991231, -- Fecha lejana para que no expire
    @active_start_time = 020000, -- Hora de inicio (02:00 AM = 020000, formato HHMMSS)
    @active_end_time = 235959;   -- Hora maxima en la que puede ejecutarse

-- Asociar el horario al Job
SET @ScheduleId = NULL;
SELECT @ScheduleId = schedule_id FROM dbo.sysschedules WHERE name = @ScheduleName;

IF @ScheduleId IS NOT NULL
BEGIN
    EXEC dbo.sp_attach_schedule
       @job_name = @JobName,
       @schedule_id = @ScheduleId;
END

-- Establecer el servidor donde se ejecutara el Job
EXEC dbo.sp_add_jobserver
    @job_name = @JobName,
    @server_name = N'(local)'; -- INVESTIGAR Cambiar "(local)" por el nombre de otro servidor si se va a ejecutar remotamente (cosa de ambientes distribuidos INVESTIGAR)
GO
