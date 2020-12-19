USE [ClinicasCR-PrograIII]
CREATE ROLE [estudiantes] AUTHORIZATION [dbo]
CREATE ROLE [profesores] AUTHORIZATION [dbo]


CREATE USER [ana] FOR LOGIN [ana] WITH DEFAULT_SCHEMA=[dbo]
ALTER ROLE [estudiantes] ADD MEMBER [ana]

CREATE USER [yendry] FOR LOGIN [yendry] WITH DEFAULT_SCHEMA=[dbo]
ALTER ROLE [estudiantes] ADD MEMBER [yendry]

CREATE USER [huberth] FOR LOGIN [huberth] WITH DEFAULT_SCHEMA=[dbo]
ALTER ROLE [profesores] ADD MEMBER [huberth]


