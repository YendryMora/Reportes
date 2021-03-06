USE [clinicasCR]
GO
/****** Object:  StoredProcedure [dbo].[calcuDistribuida]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[calcuDistribuida]
as
   declare @prod as smallint = 1;
   declare @canti as tinyint;
   while @prod < 498
        Begin
			set @canti = (Select (1+ floor(rnd_valor*4)) from vwAleatorio)
			while @canti > 0
			     Begin
						Begin Try
							insert into Distribuida(idProveedor,idFarmaco) select (1+ floor(rnd_valor*17)), @prod from vwAleatorio;
						End Try
						Begin Catch
								print 'Error...! ';								
						End Catch
						 set @canti = @canti - 1;
				 End
			set @prod = @prod + 1;
		End







GO
/****** Object:  StoredProcedure [dbo].[PA_Afiliado]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---Procedimiento almacenado que inserta, modifica y elimina datos en la tabla de carrera.
-------------------------------------------------------------------
--proceso almacenado de TB_AFILIADO
create procedure [dbo].[PA_Afiliado]

@accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@AFI_numafil int,
@AFI_cedula VARCHAR(25),
@AFI_nombre VARCHAR(15),
@AFI_apelp VARCHAR(15),
@aAFI_pelm VARCHAR(15),
@AFI_email VARCHAR(50),
@AFI_dirfisica VARCHAR(50),
@AFI_nacido DATETIME, 
@AFI__clinica TINYINT,
@AFI_distrito INT,
@AFI_canton INT,
@AFI_provincia INT,
@AFI_sexo CHAR(1),
@AFI_sangre TINYINT


AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Afiliado VALUES(@AFI_numafil,
		UPPER(@AFI_cedula),
		UPPER(@AFI_nombre),
		UPPER(@AFI_apelp),
		UPPER(@aAFI_pelm),
		UPPER(@AFI_email),
		UPPER(@AFI_dirfisica),
	      @AFI_nacido,
		@AFI__clinica,
		@AFI_distrito,
		@AFI_canton,
		@AFI_provincia,
		UPPER(@AFI_sexo),
		@AFI_sangre)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Afiliado SET
			AFI_numafil = @AFI_numafil,
			 AFI_cedula = UPPER(@AFI_cedula),
		AFI_nombre= UPPER(@AFI_nombre),
		AFI_apelp= UPPER(@AFI_apelp),
		aAFI_pelm =UPPER(@aAFI_pelm),
		AFI_email=UPPER(@AFI_email),
		AFI_dirfisica=UPPER(@AFI_dirfisica),
	     AFI_nacido= @AFI_nacido,
		AFI__clinica = @AFI__clinica,
		AFI_distrito = @AFI_distrito,
		AFI_canton = @AFI_canton,
		AFI_provincia = @AFI_provincia,
		AFI_sexo = UPPER(@AFI_sexo),
		AFI_sangre = @AFI_sangre 
		WHERE  AFI_numafil = @AFI_numafil
	 
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Afiliado WHERE AFI_numafil = @AFI_numafil
				ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_Canton]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 -----------------------------------------------------------------------------------
 -- Procedimiento almacenado de TB_CANTON
 Create procedure [dbo].[PA_Canton]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@C_ID int,
@C_provincia int,
@C_nombre VARCHAR(30)

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Canton VALUES(UPPER(@C_ID), UPPER(@C_provincia), UPPER(@C_nombre))

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Canton SET C_provincia=  UPPER(@C_provincia), C_nombre= UPPER(@C_nombre) WHERE C_ID = UPPER(@C_ID)
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Canton WHERE C_ID = UPPER(@C_ID)
	
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_catcentroMedico]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--procedimiento almacenado de TB_catcentromedico
 Create procedure [dbo].[PA_catcentroMedico]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @CATCM_idcategoria TINYINT,
@CATCM_descricion VARCHAR(50)


AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_catcentroMedico VALUES(@CATCM_idcategoria,@CATCM_descricion)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_catcentroMedico SET CATCM_descricion= UPPER(@CATCM_descricion) WHERE CATCM_idcategoria = @CATCM_idcategoria
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_catcentroMedico WHERE CATCM_idcategoria = @CATCM_idcategoria
	
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_catDrogas]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------------------
--procedimiento almacenado de TB_catdrogas
Create procedure [dbo].[PA_catDrogas]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @CD_ID tinyint,
 @CD_nombre varchar(20)


AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_catDrogas VALUES (@CD_ID,UPPER(@CD_nombre))

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_catDrogas SET CD_nombre= UPPER(@CD_nombre) WHERE CD_ID = @CD_ID
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_catDrogas WHERE CD_ID = @CD_ID
	
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_CentroMedico]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------
--procedimiento almacenado de TB_Centromedico
Create procedure [dbo].[PA_CentroMedico]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @CM_IdcentroMedico  TINYINT,
 @CM_nombre VARCHAR(35),
 @CM_circuito VARCHAR(25),
 @CN_canton INT, 
 @CM_provincia INT,
 @CM_idcategoria TINYINT


AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_CentroMedico VALUES (@CM_IdcentroMedico,UPPER(@CM_nombre), 
		UPPER(@CM_circuito),@CN_canton, @CM_provincia, @CM_idcategoria )

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_CentroMedico SET CM_nombre = UPPER(@CM_nombre), 
		CM_circuito = UPPER(@CM_circuito),
		CN_canton = @CN_canton,
		CM_provincia =  @CM_provincia, 
		CM_idcategoria =  @CM_idcategoria 
		 WHERE CM_IdcentroMedico = @CM_IdcentroMedico
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_CentroMedico WHERE CM_IdcentroMedico = @CM_IdcentroMedico
	
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_DetaRece]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_DETARECE
Create procedure [dbo].[PA_DetaRece]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @DR_numreceta int, 
 @DR_farmaco smallint, 
 @DR_cantidad tinyint, 
 @DR_monto decimal(9,2)

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_DetaRece VALUES (@DR_numreceta, @DR_farmaco,@DR_cantidad,@DR_monto )

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_DetaRece SET DR_farmaco = @DR_farmaco,
			DR_cantidad= @DR_cantidad,
			DR_monto=@DR_monto  
			WHERE DR_numreceta = @DR_numreceta
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_DetaRece WHERE DR_numreceta = @DR_numreceta
	
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_detaSolicitud]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_DETARECE
Create procedure [dbo].[PA_detaSolicitud]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@DTS_numSolicitud int, 
@DTS_farmaco smallint,
@DTS_cantidad int

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_detaSolicitud VALUES (@DTS_numSolicitud, @DTS_farmaco,@DTS_cantidad)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_detaSolicitud SET 
			 DTS_farmaco= @DTS_farmaco,
			DTS_cantidad = @DTS_cantidad   
			WHERE DTS_numSolicitud= @DTS_numSolicitud
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_detaSolicitud WHERE DTS_numSolicitud= @DTS_numSolicitud
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_Distribuida]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_Distribuida
Create procedure [dbo].[PA_Distribuida]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@D_idProveedor tinyint,
@D_idFarmaco smallint

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Distribuida VALUES (@D_idProveedor, @D_idFarmaco)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Distribuida SET 
			  D_idFarmaco = @D_idFarmaco
			WHERE D_idProveedor = @D_idProveedor
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Distribuida WHERE  D_idProveedor = @D_idProveedor
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_Distrito]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_Distrito
Create procedure [dbo].[PA_Distrito]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @DIS_ID int, 
 @DIS_canton int, 
@DIS_provincia int, 
@DIS_nombre varchar(30)

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Distrito VALUES (@DIS_ID, @DIS_canton, @DIS_provincia, UPPER(@DIS_nombre))

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Distrito SET 
			 DIS_canton=  @DIS_canton,
			 DIS_provincia=  @DIS_provincia,
			 DIS_nombre =  UPPER(@DIS_nombre)
			WHERE DIS_ID = @DIS_ID
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Distrito WHERE DIS_ID = @DIS_ID
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_doctor]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PA_doctor]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @DOC_idafiliado int, 
 @DOC_idcentroMedico tinyint

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_doctor VALUES (@DOC_idafiliado,@DOC_idcentroMedico )

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_doctor SET 
		  DOC_idcentroMedico = @DOC_idcentroMedico
			WHERE DOC_idafiliado = @DOC_idafiliado
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_doctor WHERE DOC_idafiliado = @DOC_idafiliado
			ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END


GO
/****** Object:  StoredProcedure [dbo].[PA_Invetario]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_invetario
Create procedure [dbo].[PA_Invetario]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @I_clinica tinyint, 
 @I_farrmaco smallint, 
 @I_cantidad int, 
 @I_precio decimal(9,2)

AS
BEGIN
	declare @minimo int = 3000
	

	IF(UPPER(@accion) = 'I' and @I_cantidad < @minimo)
	-- ESTA CONDICION VALIDA QUE EL INVENTARIO NO SE SOBRECARGUE
		INSERT INTO TB_Inventario VALUES (@I_clinica, @I_farrmaco,@I_cantidad, @I_precio)
		
	ELSE
	PRINT 'INVENTARIO LLENO' 

		IF(UPPER(@accion) = 'M')
			UPDATE TB_Inventario SET
			I_farrmaco =  @I_farrmaco,
			I_cantidad =   @I_cantidad, 
			I_precio =   @I_precio
			WHERE I_clinica = @I_clinica
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Inventario WHERE I_clinica = @I_clinica
			ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_Medicamentos]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_medicamentos
Create procedure [dbo].[PA_Medicamentos]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@M_ID smallint, 
@M_nombre varchar(75), 
@M_ategoria tinyint

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Medicamentos VALUES (@M_ID, UPPER(@M_nombre), @M_ategoria)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Medicamentos SET 
			M_nombre= UPPER(@M_nombre),
			 M_ategoria=   @M_ategoria
			WHERE M_ID = @M_ID
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Medicamentos WHERE  M_ID = @M_ID
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_ordDetalle]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_ordDetalle
Create procedure [dbo].[PA_ordDetalle]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @OD_numOrden int, 
 @OD_farmaco smallint, 
 @OD_cantidad int

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_ordDetalle VALUES (@OD_numOrden, @OD_farmaco, @OD_cantidad)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_ordDetalle SET 
			OD_farmaco= @OD_farmaco,
			 OD_cantidad= @OD_cantidad
			WHERE OD_numOrden = @OD_numOrden
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_ordDetalle WHERE OD_numOrden = @OD_numOrden
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_ordenCompra]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PA_ordenCompra]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @OC_numOrden int, 
 @OC_fecha datetime, 
@OC_proveedor tinyint

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_ordenCompra VALUES ( @OC_numOrden ,@OC_fecha, @OC_proveedor)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_ordenCompra SET 
	         OC_fecha=  @OC_fecha, 
	         OC_proveedor= @OC_proveedor
			WHERE OC_numOrden = @OC_numOrden
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_ordenCompra WHERE OC_numOrden = @OC_numOrden
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_Pais]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_Pais
Create procedure [dbo].[PA_Pais]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@PA_id tinyint, 
@PA_nombre varchar(15)

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Pais VALUES (@PA_id, UPPER(@PA_nombre))

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Pais SET 
	         PA_nombre =  UPPER(@PA_nombre)
			WHERE PA_id = @PA_id
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Pais WHERE PA_id = @PA_id
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_Proveedor]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_Proveedor
Create procedure [dbo].[PA_Proveedor]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@PRO_id tinyint, 
@PRO_nombre varchar(35), 
@PRO_pais tinyint

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Proveedor VALUES (@PRO_id, UPPER(@PRO_nombre), @PRO_pais)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Proveedor SET 
			PRO_nombre =  UPPER(@PRO_nombre),
			 PRO_pais = @PRO_pais
			WHERE PRO_id = @PRO_id
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Proveedor WHERE PRO_id = @PRO_id
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_Provincia]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_Provincia
Create procedure [dbo].[PA_Provincia]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
@PR_ID int, 
@PR_nombre varchar(30)

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Provincia VALUES (@PR_ID, UPPER(@PR_nombre))

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Provincia SET 
			PR_nombre =  UPPER(@PR_nombre)
			WHERE PR_ID = @PR_ID
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Provincia WHERE PR_ID = @PR_ID
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_prueba]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PA_prueba]
  @strCadena VARCHAR(255) -- nombre tablas
 
  as 
  begin
  declare
  @strValor VARCHAR(20), -- tabla
  @intBandera BIT,   -- la coma que delimita
  @intTamano INT  -- tamaño de cadena
  set @intBandera = 0
 
WHILE @intBandera = 0
BEGIN
  BEGIN TRY
    SET @strValor = RIGHT(LEFT(@strCadena,CHARINDEX(',', @strCadena,1)-1),CHARINDEX(',', @strCadena,1)-1)
    PRINT @strValor /* En esta variable se guarda un número */
    SET @intTamano = LEN(@strValor) 
 
    SET @strCadena = SUBSTRING(@strCadena,@intTamano + 2, LEN(@strCadena)) 
  END TRY
  BEGIN CATCH 
  --  PRINT @strCadena
    SET @intBandera = 1
	
  END CATCH 
end
end


GO
/****** Object:  StoredProcedure [dbo].[PA_prueba2]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[PA_prueba2]
  @tablas VARCHAR(255), -- nombre tablas  (cadena
 @oldSchem varchar(20),
 @newSchem varchar(20)
  as 
  begin
  declare
  
  @tabla VARCHAR(20), -- tabla (valor
  @intBandera BIT,   -- la coma que delimita
  @intTamano INT  -- tamaño de cadena
  set @intBandera = 0
 
WHILE @intBandera = 0
BEGIN
  BEGIN TRY
    SET @tabla= RIGHT(LEFT(@tablas,CHARINDEX(',', @tablas,1)-1),CHARINDEX(',', @tablas,1)-1)

    SET @intTamano = LEN(@tabla) 
 
    SET @tablas = SUBSTRING(@tablas,@intTamano + 2, LEN(@tablas)) 
	 PRINT  @tabla /* En esta variable se guarda un número */
	 
 
  END TRY
  BEGIN CATCH 

    PRINT @tablas + ' error'
    SET @intBandera = 1
	
  END CATCH 
 
end
 declare @instruccionC varchar(8000)
   	     set @instruccionC =
 'ALTER SCHEMA [' + @newSchem + '] TRANSFER ['+@oldSchem+'].['+ @tabla+'] ' 
  
   exec sp_sqlexec @instruccionC;

end

GO
/****** Object:  StoredProcedure [dbo].[PA_Receta]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_Receta
Create procedure [dbo].[PA_Receta]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @R_numreceta int, 
 @R_paciente int, 
 @R_fecha datetime

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_Receta VALUES (@R_numreceta, @R_paciente, @R_fecha)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_Receta SET 
			R_paciente=  @R_paciente, 
			R_fecha= @R_fecha
			WHERE R_numreceta = @R_numreceta
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_Receta WHERE R_numreceta = @R_numreceta
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_soliFarmacos]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_soliFarmacos
Create procedure [dbo].[PA_soliFarmacos]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @SF_numSolicitud int, 
@SF_Fecha datetime, 
@SF_clinica smallint

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_soliFarmacos VALUES (@SF_numSolicitud, @SF_Fecha, @SF_clinica)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_soliFarmacos SET 
		  SF_Fecha =   @SF_Fecha,
			SF_clinica =  @SF_clinica
			WHERE SF_numSolicitud = @SF_numSolicitud
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_soliFarmacos WHERE SF_numSolicitud = @SF_numSolicitud
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_soliOrden]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_soliOrden
Create procedure [dbo].[PA_soliOrden]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @SO_ordenCompra int, 
 @SO_ordenSolicitud int 

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_soliOrden VALUES (@SO_ordenCompra, @SO_ordenSolicitud)

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_soliOrden SET 
		  SO_ordenSolicitud =  @SO_ordenSolicitud
			WHERE SO_ordenCompra = @SO_ordenCompra
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_soliOrden WHERE  SO_ordenCompra = @SO_ordenCompra
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  StoredProcedure [dbo].[PA_tipoSangre]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------

--procedimiento almacenado de TB_tipoSangre
Create procedure [dbo].[PA_tipoSangre]
 @accion CHAR(1), --- Insertar = I, Modificar = M y Eliminar = E.
 @TS_id tinyint, 
 @TS_nombre varchar(5)

AS
BEGIN
	
	IF(UPPER(@accion) = 'I')
		INSERT INTO TB_tipoSangre VALUES (@TS_id, UPPER(@TS_nombre))

	ELSE
		IF(UPPER(@accion) = 'M')
			UPDATE TB_tipoSangre SET 
		TS_nombre =  UPPER(@TS_nombre)
			WHERE TS_id = @TS_id
	
	ELSE
		IF(UPPER(@accion) = 'E')
			DELETE FROM TB_tipoSangre WHERE  TS_id = @TS_id
	ELSE
		PRINT 'La accion digitada no es correcta. Digite I, M o E' 
END



GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bitacora](
	[idTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[tipoProceso] [char](1) NOT NULL,
	[servidor] [varchar](30) NOT NULL,
	[baseDatos] [varchar](20) NOT NULL,
	[tabla] [varchar](20) NOT NULL,
	[regAnterior] [varchar](max) NOT NULL,
	[regNuevo] [varchar](max) NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[aplicacion] [varchar](200) NOT NULL,
	[equipo] [varchar](30) NOT NULL,
	[fechaMov] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Afiliado]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Afiliado](
	[AFI_numafil] [int] NOT NULL,
	[AFI_cedula] [varchar](25) NOT NULL,
	[AFI_nombre] [varchar](15) NOT NULL,
	[AFI_apelp] [varchar](15) NOT NULL,
	[aAFI_pelm] [varchar](15) NOT NULL,
	[AFI_email] [varchar](50) NOT NULL,
	[AFI_dirfisica] [varchar](150) NOT NULL,
	[AFI_nacido] [datetime] NOT NULL,
	[AFI__clinica] [tinyint] NOT NULL,
	[AFI_distrito] [int] NOT NULL,
	[AFI_canton] [int] NOT NULL,
	[AFI_provincia] [int] NOT NULL,
	[AFI_sexo] [char](1) NULL,
	[AFI_sangre] [tinyint] NULL,
 CONSTRAINT [pk_Afiliado] PRIMARY KEY CLUSTERED 
(
	[AFI_numafil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Canton]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Canton](
	[C_ID] [int] NOT NULL,
	[C_provincia] [int] NOT NULL,
	[C_nombre] [varchar](30) NOT NULL,
 CONSTRAINT [pk_Canton] PRIMARY KEY CLUSTERED 
(
	[C_provincia] ASC,
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_catcentroMedico]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_catcentroMedico](
	[CATCM_idcategoria] [tinyint] NOT NULL,
	[CATCM_descricion] [varchar](50) NULL,
 CONSTRAINT [PK__TB_catce__3E3F30D3911B41AE] PRIMARY KEY CLUSTERED 
(
	[CATCM_idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_catDrogas]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_catDrogas](
	[CD_ID] [tinyint] NOT NULL,
	[CD_nombre] [varchar](20) NOT NULL,
 CONSTRAINT [pk_catDrogas] PRIMARY KEY CLUSTERED 
(
	[CD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_CentroMedico]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_CentroMedico](
	[CM_IdcentroMedico] [tinyint] NOT NULL,
	[CM_nombre] [varchar](35) NOT NULL,
	[CM_circuito] [varchar](25) NOT NULL,
	[CN_canton] [int] NOT NULL,
	[CM_provincia] [int] NOT NULL,
	[CM_idcategoria] [tinyint] NULL,
 CONSTRAINT [pk_Clinica] PRIMARY KEY CLUSTERED 
(
	[CM_IdcentroMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_DetaRece]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DetaRece](
	[DR_numreceta] [int] NOT NULL,
	[DR_farmaco] [smallint] NOT NULL,
	[DR_cantidad] [tinyint] NULL,
	[DR_monto] [decimal](9, 2) NOT NULL,
 CONSTRAINT [pk_DetaRece] PRIMARY KEY CLUSTERED 
(
	[DR_numreceta] ASC,
	[DR_farmaco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_detaSolicitud]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_detaSolicitud](
	[DTS_numSolicitud] [int] NOT NULL,
	[DTS_farmaco] [smallint] NOT NULL,
	[DTS_cantidad] [int] NOT NULL,
 CONSTRAINT [PK_detaSolicitud_1] PRIMARY KEY CLUSTERED 
(
	[DTS_numSolicitud] ASC,
	[DTS_farmaco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_Distribuida]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Distribuida](
	[D_idProveedor] [tinyint] NOT NULL,
	[D_idFarmaco] [smallint] NOT NULL,
 CONSTRAINT [pk_Distribuida] PRIMARY KEY CLUSTERED 
(
	[D_idProveedor] ASC,
	[D_idFarmaco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_Distrito]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Distrito](
	[DIS_ID] [int] NOT NULL,
	[DIS_canton] [int] NOT NULL,
	[DIS_provincia] [int] NOT NULL,
	[DIS_nombre] [varchar](30) NOT NULL,
 CONSTRAINT [pk_Distrito] PRIMARY KEY CLUSTERED 
(
	[DIS_ID] ASC,
	[DIS_canton] ASC,
	[DIS_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_doctor]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_doctor](
	[DOC_idafiliado] [int] NOT NULL,
	[DOC_idcentroMedico] [tinyint] NULL,
 CONSTRAINT [PK__TB_docto__54CA238B4E10E8C8] PRIMARY KEY CLUSTERED 
(
	[DOC_idafiliado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_Inventario]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Inventario](
	[I_clinica] [tinyint] NOT NULL,
	[I_farrmaco] [smallint] NOT NULL,
	[I_cantidad] [int] NOT NULL,
	[I_precio] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_INVENTARIO] PRIMARY KEY CLUSTERED 
(
	[I_clinica] ASC,
	[I_farrmaco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_Medicamentos]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Medicamentos](
	[M_ID] [smallint] NOT NULL,
	[M_nombre] [varchar](75) NOT NULL,
	[M_ategoria] [tinyint] NOT NULL,
 CONSTRAINT [pk_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[M_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_ordDetalle]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ordDetalle](
	[OD_numOrden] [int] NOT NULL,
	[OD_farmaco] [smallint] NOT NULL,
	[OD_cantidad] [int] NOT NULL,
 CONSTRAINT [PK_ORDDETALLE] PRIMARY KEY CLUSTERED 
(
	[OD_numOrden] ASC,
	[OD_farmaco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_ordenCompra]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ordenCompra](
	[OC_numOrden] [int] NOT NULL,
	[OC_fecha] [datetime] NOT NULL,
	[OC_proveedor] [tinyint] NOT NULL,
 CONSTRAINT [PK_ORDENCOMPRA] PRIMARY KEY CLUSTERED 
(
	[OC_numOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_Pais]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Pais](
	[PA_id] [tinyint] NOT NULL,
	[PA_nombre] [varchar](15) NULL,
 CONSTRAINT [pk_Pais] PRIMARY KEY CLUSTERED 
(
	[PA_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Proveedor]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Proveedor](
	[PRO_id] [tinyint] NOT NULL,
	[PRO_nombre] [varchar](35) NOT NULL,
	[PRO_pais] [tinyint] NOT NULL,
 CONSTRAINT [pk_Proveedor] PRIMARY KEY CLUSTERED 
(
	[PRO_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Provincia]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Provincia](
	[PR_ID] [int] NOT NULL,
	[PR_nombre] [varchar](30) NOT NULL,
 CONSTRAINT [pk_Provincia] PRIMARY KEY CLUSTERED 
(
	[PR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Receta]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Receta](
	[R_numreceta] [int] NOT NULL,
	[R_paciente] [int] NOT NULL,
	[R_fecha] [datetime] NOT NULL,
 CONSTRAINT [pk_Receta] PRIMARY KEY CLUSTERED 
(
	[R_numreceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_soliFarmacos]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_soliFarmacos](
	[SF_numSolicitud] [int] NOT NULL,
	[SF_Fecha] [datetime] NOT NULL,
	[SF_clinica] [smallint] NOT NULL,
 CONSTRAINT [PK_SOLIFARMACOS] PRIMARY KEY CLUSTERED 
(
	[SF_numSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_soliOrden]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_soliOrden](
	[SO_ordenCompra] [int] NOT NULL,
	[SO_ordenSolicitud] [int] NOT NULL,
 CONSTRAINT [PK_SOLIORDEN] PRIMARY KEY CLUSTERED 
(
	[SO_ordenCompra] ASC,
	[SO_ordenSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_tipoSangre]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_tipoSangre](
	[TS_id] [tinyint] NOT NULL,
	[TS_nombre] [varchar](5) NOT NULL,
 CONSTRAINT [PK_tipoSangre] PRIMARY KEY CLUSTERED 
(
	[TS_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[AFILIADO_POR_SECTOR]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AFILIADO_POR_SECTOR]
	AS SELECT	Afiliado= CONCAT(Afiliado.AFI_cedula,'-', Afiliado.AFI_nombre,'-', Afiliado.AFI_apelp,'-', Afiliado.aAFI_pelm),
				Distrito.DIS_nombre
		FROM TB_Afiliado AS Afiliado
			LEFT JOIN TB_Distrito AS Distrito
		ON Distrito.DIS_ID=Afiliado.AFI_distrito
		

GO
/****** Object:  View [dbo].[permisos]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[permisos]
 as
  select dp.NAME AS principal_name, 
dp.type_desc AS principal_type_desc, 
o.NAME AS object_name, 
p.permission_name, 
p.state_desc AS permission_state_desc 

from clinicasCR.sys.database_permissions  p 
left JOIN clinicasCR.sys.all_objects as o 
on p.major_id = o.OBJECT_ID 
inner JOIN clinicasCR.sys.database_principals as dp 
on p.grantee_principal_id = dp.principal_id

GO
/****** Object:  View [dbo].[serverRol]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[serverRol]
as
SELECT SP1.[name] AS 'Login', SP2.[name] AS 'ServerRol'
FROM sys.server_principals SP1
JOIN sys.server_role_members SRM
ON SP1.principal_id = SRM.member_principal_id
JOIN sys.server_principals SP2
ON SRM.role_principal_id = SP2.principal_id

GO
/****** Object:  View [dbo].[VIS_GRUPOS]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIS_GRUPOS]
AS
SELECT        dp.name AS Grupo
FROM            sys.database_role_members AS rm INNER JOIN
                         sys.database_principals AS dp ON rm.role_principal_id = dp.principal_id
WHERE        (dp.name <> 'db_owner') AND (dp.name <> 'Usuarios')
GROUP BY dp.name


GO
/****** Object:  View [dbo].[VIS_PERMISOS_GRUPOS]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIS_PERMISOS_GRUPOS]
AS
SELECT        dp.name AS Grupo, o.name AS Tabla, p.permission_name AS Accion, p.state_desc AS Tipo_Permiso
FROM            sys.database_permissions AS p INNER JOIN
                         sys.all_objects AS o ON p.major_id = o.object_id INNER JOIN
                         sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id INNER JOIN
                         sys.database_role_members AS rm ON rm.role_principal_id = dp.principal_id
WHERE        (dp.name <> 'db_owner') AND (o.name NOT IN ('sysrowsets', 'sysclones', 'sysallocunits'))
GROUP BY dp.name, o.name, p.permission_name, p.state_desc


GO
/****** Object:  View [dbo].[VIS_TABLAS]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIS_TABLAS]
AS
SELECT        name AS Tabla
FROM            clinicasCR.sys.sysobjects
WHERE        (type = 'U')

GO
/****** Object:  View [dbo].[VIS_USUARIOS]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIS_USUARIOS]
AS
SELECT        us.name AS Usuario
FROM            sys.sysusers AS us INNER JOIN
                         sys.database_role_members AS rm ON us.uid = rm.member_principal_id
WHERE        (us.name <> 'dbo') AND (us.name <> 'admin')
GROUP BY us.name


GO
/****** Object:  View [dbo].[VIS_USUARIOSXGRUPOS]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIS_USUARIOSXGRUPOS]
AS
SELECT        dp.name AS Grupo, us.name AS Usuario
FROM            clinicasCR.sys.sysusers AS us INNER JOIN
                        clinicasCR.sys.database_role_members AS rm ON us.uid = rm.member_principal_id INNER JOIN
                         clinicasCR.sys.database_principals AS dp ON rm.role_principal_id = dp.principal_id
WHERE        (dp.name <> 'db_owner') AND (us.name <> 'admin') AND (dp.name <> 'Usuarios')


GO
/****** Object:  View [dbo].[VW_farmacia]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[VW_farmacia]

		AS SELECT	Afiliado= CONCAT(Afiliado.AFI_numafil,'-', Afiliado.AFI_cedula,'-', Afiliado.AFI_nombre,'-', Afiliado.AFI_apelp,'-', Afiliado.aAFI_pelm),
					Receta=CONCAT(Receta.R_numreceta,'-', Receta.R_paciente,'-', Receta.R_fecha),
					DetaRece=CONCAT(DetalleReceta.DR_numreceta,' - ',DetalleReceta.DR_farmaco,' - ',DetalleReceta.DR_cantidad,' - ',DetalleReceta.DR_monto),
					Medicamentos=CONCAT(Medicamentos.M_ID,' - ',Medicamentos.M_nombre,' - ',Medicamentos.M_ategoria)
			
		FROM TB_Afiliado AS Afiliado
			LEFT JOIN TB_Receta AS Receta
		ON Afiliado.AFI_numafil = Receta.R_paciente
			LEFT JOIN TB_DetaRece AS DetalleReceta
		ON DetalleReceta.DR_numreceta = Receta.R_numreceta
			LEFT JOIN TB_Medicamentos AS Medicamentos
		ON Medicamentos.M_ID = DetalleReceta.DR_farmaco

		

	 ----------------------------------------------------------------------------------------




GO
/****** Object:  View [dbo].[VW_INVENTARIO]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[VW_INVENTARIO]
		AS SELECT	Inventario= CONCAT(Inventario.I_cantidad,'-', Inventario.I_clinica,'-', Inventario.I_farrmaco,'-', Inventario.I_precio),
				    CentroMedico=CONCAT(CentroMedico.CM_IdcentroMedico,'-', CentroMedico.CM_nombre,'-', CentroMedico.CM_provincia )
		FROM TB_Inventario AS Inventario
			LEFT JOIN TB_CentroMedico AS CentroMedico
		ON Inventario.I_clinica = CentroMedico.CM_IdcentroMedico
			
			 GROUP BY CONCAT(Inventario.I_cantidad,'-', Inventario.I_clinica,'-', Inventario.I_farrmaco,'-', Inventario.I_precio), 
					  CONCAT(CentroMedico.CM_IdcentroMedico,'-', CentroMedico.CM_nombre,'-', CentroMedico.CM_provincia)

	-----------------------------------------------------------



GO
/****** Object:  View [dbo].[VW_Orden_Compra]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[VW_Orden_Compra]
		AS SELECT Proveedor=CONCAT(Proveedor.PRO_id, '-',Proveedor.PRO_nombre, '-',Proveedor.PRO_pais), 
				  Ord_Compra=CONCAT(Ord_Compra.OC_numOrden,'-', Ord_Compra.OC_fecha,'-',Ord_Compra.OC_proveedor),
				  Det_Compra=CONCAT(Det_Compra.OD_numOrden,'-', Det_Compra.OD_farmaco,'-',Det_Compra.OD_cantidad)
		FROM TB_Proveedor AS Proveedor
			LEFT JOIN TB_ordenCompra AS Ord_Compra
		ON Proveedor.PRO_id=Ord_Compra.OC_proveedor
			LEFT JOIN TB_ordDetalle AS Det_Compra
		ON Det_Compra.OD_numOrden=Ord_Compra.OC_numOrden
	------------------------------------------------------------------------------------------




GO
/****** Object:  View [dbo].[VW_TIPO_SANGRE]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[VW_TIPO_SANGRE]
		AS SELECT	Afiliado= CONCAT(Afiliado.AFI_numafil,'-', Afiliado.AFI_cedula,'-', Afiliado.AFI_nombre,'-', Afiliado.AFI_apelp,'-', Afiliado.aAFI_pelm),
				    tipsangre=CONCAT(tipsangre.TS_id,'-', tipsangre.TS_nombre)
		FROM TB_Afiliado AS Afiliado
			LEFT JOIN TB_tipoSangre AS tipsangre
		ON Afiliado.AFI_sangre = tipsangre.TS_id
	------------------------------------------------------------------------------------------




GO
/****** Object:  View [dbo].[VW_ubicacion_persona]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 CREATE VIEW [dbo].[VW_ubicacion_persona]
		AS SELECT Afiliado=CONCAT(Afiliado.AFI_numafil, '-', Afiliado.AFI_nombre, '-', Afiliado.AFI_apelp, '-',Afiliado.aAFI_pelm), 
				  Provincia=CONCAT(Provincia.PR_ID,'-', Provincia.PR_nombre)
		   FROM TB_Afiliado AS Afiliado
				LEFT JOIN TB_Provincia AS Provincia
		   ON Afiliado.AFI_provincia = Provincia.PR_ID

	-------------------------------------------------------------------------------------




GO
/****** Object:  View [dbo].[vwAleatorio]    Script Date: 26/04/2017 0:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vwAleatorio]
as
  select rand() rnd_valor







GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 

INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (1, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'1,San José', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A75701185806 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (2, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'-', N'1,SAN JOSÉ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A49A1 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (3, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'-', N'2,ALAJUELA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A49B4 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (4, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'-', N'3,CARTAGO', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A49C7 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (5, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'-', N'4,HEREDIA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A49DA AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (6, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'-', N'5,GUANACASTE', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A49F1 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (7, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'-', N'6,PUNTARENAS', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A4A05 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (8, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Provincia', N'-', N'7,LIMÓN', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A4A19 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (9, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'1,SAN JOSÉ,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A725E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (10, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'2,PÉREZ ZELEDÓN,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7273 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (11, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'3,ESCAZÚ,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7288 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (12, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'4,DESAMPARADOS,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A72A4 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (13, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'5,PURISCAL,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A72BA AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (14, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'6,TARRAZÚ,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A72D2 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (15, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'7,ASERRÍ,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A72E7 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (16, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'8,MORA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A72FC AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (17, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'9,GOICOECHEA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7312 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (18, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'10,SANTA ANA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7327 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (19, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'11,ALAJUELITA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A733B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (20, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'12,VÁZQUEZ DE CORONADO,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7350 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (21, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'13,ACOSTA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7364 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (22, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'14,TIBÁS,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A737B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (23, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'15,MORAVIA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A738E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (24, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'16,MONTES DE OCA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A73A2 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (25, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'17,TURRUBARES,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A73B7 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (26, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'18,DOTA,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A73CB AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (27, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'19,CURRIDABAT,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A73DF AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (28, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'20,LEÓN CORTÉS CASTRO,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A73F5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (29, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'21,ALAJUELA,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7409 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (30, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'22,SAN CARLOS,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A741F AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (31, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'23,UPALA,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7433 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (32, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'24,LOS CHILES,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7448 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (33, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'25,GUATUSO,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A745C AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (34, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'26,SAN MATEO,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7470 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (35, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'27,OROTINA,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7486 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (36, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'28,SAN RAMÓN,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7499 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (37, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'29,GRECIA,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A74AE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (38, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'30,ATENAS,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A74C2 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (39, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'31,NARANJO,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A74D7 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (40, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'32,PALMARES,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A74EC AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (41, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'33,POÁS,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7500 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (42, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'34,ZARCERO,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7515 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (43, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'35,VALVERDE VEGA,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A752A AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (44, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'36,CARTAGO,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A753F AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (45, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'37,PARAÍSO,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7553 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (46, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'38,LA UNIÓN,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7568 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (47, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'39,JIMÉNEZ,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A757B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (48, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'40,TURRIALBA,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7590 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (49, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'41,ALVARADO,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A75A6 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (50, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'42,OREAMUNO,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A75B9 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (51, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'43,EL GUARCO,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A75CE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (52, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'44,HEREDIA,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A75E3 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (53, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'45,SARAPIQUÍ,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A75F8 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (54, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'46,BARVA,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A760C AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (55, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'47,SANTO DOMINGO,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7621 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (56, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'48,SANTA BÁRBARA,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7636 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (57, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'49,SAN RAFAEL,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A764A AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (58, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'50,SAN ISIDRO,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A765E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (59, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'51,BELÉN,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7673 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (60, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'52,FLORES,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7687 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (61, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'53,SAN PABLO,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A769C AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (62, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'54,LIBERIA,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A76B1 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (63, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'55,NICOYA,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A76C5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (64, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'56,SANTA CRUZ,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A76E0 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (65, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'57,BAGACES,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A76F4 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (66, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'58,CARRILLO,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7709 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (67, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'59,CAÑAS,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A771D AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (68, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'60,ABANGARES,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7732 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (69, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'61,TILARÁN,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7747 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (70, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'62,NANDAYURE,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A775C AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (71, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'63,LA CRUZ,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7770 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (72, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'64,HOJANCHA,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7785 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (73, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'65,PUNTARENAS,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7799 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (74, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'66,ESPARZA,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A77AE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (75, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'67,MONTES DE ORO,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A77C3 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (76, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'68,QUEPOS,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A77D7 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (77, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'69,PARRITA,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A77EC AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (78, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'70,GARABITO,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7801 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (79, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'71,BUENOS AIRES,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7815 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (80, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'72,OSA,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A782B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (81, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'73,GOLFITO,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7840 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (82, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'74,COTO BRUS,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7855 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (83, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'75,CORREDORES,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7869 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (84, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'76,LIMÓN,7', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A7887 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (85, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'77,POCOCÍ,7', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A789F AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (86, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'78,SIQUIRRES,7', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A78B5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (87, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'79,TALAMANCA,7', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A78CA AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (88, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'80,MATINA,7', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A78DE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (89, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'-', N'81,GUÁCIMO,7', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A78F4 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (90, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'1,Carmen,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9C61 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (91, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'2,Merced,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9CB9 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (92, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'3,Hospital,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9CCE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (93, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'4,Catedral,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9CE3 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (94, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'5,Zapote,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9CF8 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (95, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'6,San Francisco de Dos Ríos,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9D0E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (96, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'7,Uruca,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9D22 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (97, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'8,Mata Redonda,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9D39 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (98, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'9,Pavas,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9D4E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (99, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'10,Hatillo,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9D65 AS DateTime))
GO
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (100, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'11,San Sebastián,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9D79 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (101, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'12,El General,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9D8F AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (102, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'13,Daniel Flores,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9DA4 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (103, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'14,Rivas,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9DB8 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (104, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'15,San Pedro,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9DCC AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (105, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'16,Platanares,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9DE1 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (106, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'17,Pejibaye,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9DF6 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (107, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'18,Cajón,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E0A AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (108, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'19,Barú,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E1F AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (109, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'20,Río Nuevo,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E34 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (110, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'21,Páramo,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E47 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (111, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'22,La Amistad,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E5C AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (112, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'23,Escazú,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E70 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (113, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'24,San Antonio,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E86 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (114, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'25,San Rafael,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9E9B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (115, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'26,Desamparados,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9EB0 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (116, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'27,San Miguel,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9EC5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (117, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'28,San Juan de Dios,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9EDB AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (118, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'29,San Rafael Arriba,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9EF1 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (119, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'30,San Antonio,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9F06 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (120, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'31,Frailes,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9F1B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (121, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'32,Patarrá,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9F30 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (122, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'33,San Cristóbal,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9F44 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (123, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'34,Rosario,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9F5A AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (124, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Distritos', N'-', N'35,Damas,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011A9F6D AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (125, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'1,Amebicidas y anthelmíntcos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC292 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (126, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'2,Antbiótcos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC2A7 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (127, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'3,Anttuberculosos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC2BB AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (128, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'4,Antfúngicos y antvirales ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC2CF AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (129, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'5,Antseptcos y agentes urinarios ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC2E6 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (130, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'6,Adrenérgicos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC2FA AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (131, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'7,Agentes cardiacos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC30F AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (132, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'8,Anthipertensivos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC323 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (133, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'9,Diurétcos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC337 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (134, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'10,Vasodilatadores coronarios y antanginosos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC34E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (135, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'11,Agentes antcoagulantes, trombolítcos y antplaquetarios ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC362 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (136, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'12,Hemostátcos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC376 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (137, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'13,Antanémicos e hipolipemiantes ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC38B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (138, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'14,"Antin?amatorios no esteroideos, antrreumátcos, y agentes', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC3A0 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (139, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'15,Uricosúricos, antgotosos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC3C4 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (140, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'16,Analgésicos no narcótcos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC3D8 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (141, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'17,Analgésicos narcótcos y antagonistas ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC3EF AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (142, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'18,Anestésicos generales ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC403 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (143, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'19,Anestésicos locales ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC418 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (144, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'20,Relajantes musculares ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC42B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (145, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'21,Antcolinérgicos/antespasmódicos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC441 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (146, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'22,Colinérgicos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC454 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (147, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'23,Antasmátcos y broncodilatadores ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC468 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (148, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'24,Anttusígenos, ?uidifcantes y expectorantes ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC47E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (149, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'25,Anthistamínicos, antemétcos, antprurítcos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC492 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (150, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'26,Antparkinsonianos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC4A7 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (151, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'27,Antmigraña ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC4BC AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (152, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'28,Antconvulsivos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC4D1 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (153, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'29,Antdepresivos y psicoestmulantes ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC4E5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (154, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'-', N'30,Antpsicótcos ', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011AC4FA AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (155, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'81,GUÁCIMO,7', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B04B8 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (156, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'76,LIMÓN,7', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B0935 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (157, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'69,PARRITA,6', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B0D74 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (158, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'65,PUNTARENAS,6', N'65,El PUERTO,6', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B22A2 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (159, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'1,SAN JOSÉ,1', N'1,CHEPE,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B3347 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (160, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Cantones', N'21,ALAJUELA,2', N'21,LA LIGA,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B3F5D AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (161, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'10,Vasodilatadores coronarios y antanginosos ', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B586B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (162, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'20,Relajantes musculares ', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B5EDE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (163, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'28,Antconvulsivos ', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B637A AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (164, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'8,Anthipertensivos ', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B67C2 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (165, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'30,Antpsicótcos ', N'30,Antidiarréicos', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B7867 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (166, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'22,Colinérgicos ', N'22,Alicinógenos', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B82CE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (167, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'GruposMedicinas', N'9,Diurétcos ', N'9,Para diabéticos', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011B9313 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (168, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'1,HOLANDA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011BCBF5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (169, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'2,ALEMANIA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011BD16C AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (170, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'3,ESTADOS UNIDOS', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011BD96D AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (171, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'4,BRASIL', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011BDF06 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (172, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'5,MEXICO', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011BE7CE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (173, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'6,SUECIA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011BEF0F AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (174, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'7,INGLATERRA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011BF67A AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (175, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'9,ESPAÑA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C02CE AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (176, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'-', N'10,CHINA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C0A85 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (177, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'7,INGLATERRA', N'7,GRAN BRETAÑA', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C1C22 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (178, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'1,HOLANDA', N'1,PAÍSES BAJOS', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C2A4D AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (179, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'Pais', N'3,ESTADOS UNIDOS', N'3,EEUU', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C326B AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (180, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'1,A+', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4C3D AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (181, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'2,A-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4C54 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (182, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'3,B+', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4C69 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (183, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'4,B-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4C7C AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (184, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'5,AB+', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4C91 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (185, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'6,AB-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4CA5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (186, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'7,O+', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4CBA AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (187, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'-', N'8,O-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C4CCF AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (188, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'4,B-', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C53C5 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (189, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'7,O+', N'7,o+', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C6371 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (190, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'3,B+', N'3,b+', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011C67A2 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (191, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposSangre', N'1,A+', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011CA3BB AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (192, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'-', N'1,Ebais,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011CCE17 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (193, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'-', N'2,Clínica,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011CCE2E AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (194, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'-', N'3,Bodega Regional,3', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011CCE47 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (195, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'-', N'4,Bodega Central,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011CCE5D AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (196, N'E', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'4,Bodega Central,4', N'-', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011CE4A2 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (197, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'-', N'4,GRAN BODEGA CENTRAL,4', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011CF402 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (198, N'I', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'-', N'5,HOSPITALES,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011D0585 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (199, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'5,HOSPITALES,5', N'5,hospitales,5', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011D1284 AS DateTime))
GO
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (200, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'2,Clínica,2', N'2,CLINICAS,2', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011D1836 AS DateTime))
INSERT [dbo].[bitacora] ([idTransaccion], [tipoProceso], [servidor], [baseDatos], [tabla], [regAnterior], [regNuevo], [usuario], [aplicacion], [equipo], [fechaMov]) VALUES (201, N'M', N'FABRICIOPC', N'ClinicasCR-PrograIII', N'TiposCentros', N'1,Ebais,1', N'1,EBAIS,1', N'FABRICIOPC\Fabri', N'Microsoft SQL Server Management Studio', N'FABRICIOPC', CAST(0x0000A757011D1C47 AS DateTime))
SET IDENTITY_INSERT [dbo].[bitacora] OFF
ALTER TABLE [dbo].[TB_Afiliado]  WITH NOCHECK ADD  CONSTRAINT [fk_afilClinica] FOREIGN KEY([AFI__clinica])
REFERENCES [dbo].[TB_CentroMedico] ([CM_IdcentroMedico])
GO
ALTER TABLE [dbo].[TB_Afiliado] CHECK CONSTRAINT [fk_afilClinica]
GO
ALTER TABLE [dbo].[TB_Afiliado]  WITH NOCHECK ADD  CONSTRAINT [fk_afilDistrito] FOREIGN KEY([AFI_distrito], [AFI_canton], [AFI_provincia])
REFERENCES [dbo].[TB_Distrito] ([DIS_ID], [DIS_canton], [DIS_provincia])
GO
ALTER TABLE [dbo].[TB_Afiliado] CHECK CONSTRAINT [fk_afilDistrito]
GO
ALTER TABLE [dbo].[TB_Afiliado]  WITH CHECK ADD  CONSTRAINT [fk_afilSangre] FOREIGN KEY([AFI_sangre])
REFERENCES [dbo].[TB_tipoSangre] ([TS_id])
GO
ALTER TABLE [dbo].[TB_Afiliado] CHECK CONSTRAINT [fk_afilSangre]
GO
ALTER TABLE [dbo].[TB_Canton]  WITH CHECK ADD  CONSTRAINT [fk_canProvi] FOREIGN KEY([C_provincia])
REFERENCES [dbo].[TB_Provincia] ([PR_ID])
GO
ALTER TABLE [dbo].[TB_Canton] CHECK CONSTRAINT [fk_canProvi]
GO
ALTER TABLE [dbo].[TB_CentroMedico]  WITH CHECK ADD  CONSTRAINT [fk_cliCanton] FOREIGN KEY([CM_provincia], [CN_canton])
REFERENCES [dbo].[TB_Canton] ([C_provincia], [C_ID])
GO
ALTER TABLE [dbo].[TB_CentroMedico] CHECK CONSTRAINT [fk_cliCanton]
GO
ALTER TABLE [dbo].[TB_CentroMedico]  WITH CHECK ADD  CONSTRAINT [FK_Clinica_TB_catcentroMedico] FOREIGN KEY([CM_idcategoria])
REFERENCES [dbo].[TB_catcentroMedico] ([CATCM_idcategoria])
GO
ALTER TABLE [dbo].[TB_CentroMedico] CHECK CONSTRAINT [FK_Clinica_TB_catcentroMedico]
GO
ALTER TABLE [dbo].[TB_DetaRece]  WITH CHECK ADD  CONSTRAINT [FK_DetaRece_Medicamentos] FOREIGN KEY([DR_farmaco])
REFERENCES [dbo].[TB_Medicamentos] ([M_ID])
GO
ALTER TABLE [dbo].[TB_DetaRece] CHECK CONSTRAINT [FK_DetaRece_Medicamentos]
GO
ALTER TABLE [dbo].[TB_DetaRece]  WITH CHECK ADD  CONSTRAINT [FK_DetaRece_Receta] FOREIGN KEY([DR_numreceta])
REFERENCES [dbo].[TB_Receta] ([R_numreceta])
GO
ALTER TABLE [dbo].[TB_DetaRece] CHECK CONSTRAINT [FK_DetaRece_Receta]
GO
ALTER TABLE [dbo].[TB_detaSolicitud]  WITH CHECK ADD  CONSTRAINT [fk_detaSolicitud] FOREIGN KEY([DTS_numSolicitud])
REFERENCES [dbo].[TB_soliFarmacos] ([SF_numSolicitud])
GO
ALTER TABLE [dbo].[TB_detaSolicitud] CHECK CONSTRAINT [fk_detaSolicitud]
GO
ALTER TABLE [dbo].[TB_detaSolicitud]  WITH CHECK ADD  CONSTRAINT [fk_soliFarmaco] FOREIGN KEY([DTS_farmaco])
REFERENCES [dbo].[TB_Medicamentos] ([M_ID])
GO
ALTER TABLE [dbo].[TB_detaSolicitud] CHECK CONSTRAINT [fk_soliFarmaco]
GO
ALTER TABLE [dbo].[TB_Distribuida]  WITH CHECK ADD  CONSTRAINT [fk_distFarmaco] FOREIGN KEY([D_idFarmaco])
REFERENCES [dbo].[TB_Medicamentos] ([M_ID])
GO
ALTER TABLE [dbo].[TB_Distribuida] CHECK CONSTRAINT [fk_distFarmaco]
GO
ALTER TABLE [dbo].[TB_Distribuida]  WITH CHECK ADD  CONSTRAINT [fk_distProveedor] FOREIGN KEY([D_idProveedor])
REFERENCES [dbo].[TB_Proveedor] ([PRO_id])
GO
ALTER TABLE [dbo].[TB_Distribuida] CHECK CONSTRAINT [fk_distProveedor]
GO
ALTER TABLE [dbo].[TB_Distrito]  WITH CHECK ADD  CONSTRAINT [fk_disCanton] FOREIGN KEY([DIS_provincia], [DIS_canton])
REFERENCES [dbo].[TB_Canton] ([C_provincia], [C_ID])
GO
ALTER TABLE [dbo].[TB_Distrito] CHECK CONSTRAINT [fk_disCanton]
GO
ALTER TABLE [dbo].[TB_doctor]  WITH CHECK ADD  CONSTRAINT [FK_TB_doctor_Afiliado] FOREIGN KEY([DOC_idafiliado])
REFERENCES [dbo].[TB_Afiliado] ([AFI_numafil])
GO
ALTER TABLE [dbo].[TB_doctor] CHECK CONSTRAINT [FK_TB_doctor_Afiliado]
GO
ALTER TABLE [dbo].[TB_doctor]  WITH CHECK ADD  CONSTRAINT [FK_TB_doctor_Clinica] FOREIGN KEY([DOC_idcentroMedico])
REFERENCES [dbo].[TB_CentroMedico] ([CM_IdcentroMedico])
GO
ALTER TABLE [dbo].[TB_doctor] CHECK CONSTRAINT [FK_TB_doctor_Clinica]
GO
ALTER TABLE [dbo].[TB_Inventario]  WITH CHECK ADD  CONSTRAINT [fk_invClinica] FOREIGN KEY([I_clinica])
REFERENCES [dbo].[TB_CentroMedico] ([CM_IdcentroMedico])
GO
ALTER TABLE [dbo].[TB_Inventario] CHECK CONSTRAINT [fk_invClinica]
GO
ALTER TABLE [dbo].[TB_Inventario]  WITH CHECK ADD  CONSTRAINT [fk_invFarmaco] FOREIGN KEY([I_farrmaco])
REFERENCES [dbo].[TB_Medicamentos] ([M_ID])
GO
ALTER TABLE [dbo].[TB_Inventario] CHECK CONSTRAINT [fk_invFarmaco]
GO
ALTER TABLE [dbo].[TB_Medicamentos]  WITH CHECK ADD  CONSTRAINT [fk_medDroga] FOREIGN KEY([M_ategoria])
REFERENCES [dbo].[TB_catDrogas] ([CD_ID])
GO
ALTER TABLE [dbo].[TB_Medicamentos] CHECK CONSTRAINT [fk_medDroga]
GO
ALTER TABLE [dbo].[TB_ordDetalle]  WITH CHECK ADD  CONSTRAINT [fk_ordCompra] FOREIGN KEY([OD_numOrden])
REFERENCES [dbo].[TB_ordenCompra] ([OC_numOrden])
GO
ALTER TABLE [dbo].[TB_ordDetalle] CHECK CONSTRAINT [fk_ordCompra]
GO
ALTER TABLE [dbo].[TB_ordDetalle]  WITH CHECK ADD  CONSTRAINT [fk_ordFarmaco] FOREIGN KEY([OD_farmaco])
REFERENCES [dbo].[TB_Medicamentos] ([M_ID])
GO
ALTER TABLE [dbo].[TB_ordDetalle] CHECK CONSTRAINT [fk_ordFarmaco]
GO
ALTER TABLE [dbo].[TB_ordenCompra]  WITH CHECK ADD  CONSTRAINT [fk_ordProveedor] FOREIGN KEY([OC_proveedor])
REFERENCES [dbo].[TB_Proveedor] ([PRO_id])
GO
ALTER TABLE [dbo].[TB_ordenCompra] CHECK CONSTRAINT [fk_ordProveedor]
GO
ALTER TABLE [dbo].[TB_Proveedor]  WITH CHECK ADD  CONSTRAINT [fk_proPais] FOREIGN KEY([PRO_pais])
REFERENCES [dbo].[TB_Pais] ([PA_id])
GO
ALTER TABLE [dbo].[TB_Proveedor] CHECK CONSTRAINT [fk_proPais]
GO
ALTER TABLE [dbo].[TB_Receta]  WITH CHECK ADD  CONSTRAINT [fk_recAfiliado] FOREIGN KEY([R_paciente])
REFERENCES [dbo].[TB_Afiliado] ([AFI_numafil])
GO
ALTER TABLE [dbo].[TB_Receta] CHECK CONSTRAINT [fk_recAfiliado]
GO
ALTER TABLE [dbo].[TB_soliOrden]  WITH CHECK ADD  CONSTRAINT [fk_ordSolicitud] FOREIGN KEY([SO_ordenSolicitud])
REFERENCES [dbo].[TB_soliFarmacos] ([SF_numSolicitud])
GO
ALTER TABLE [dbo].[TB_soliOrden] CHECK CONSTRAINT [fk_ordSolicitud]
GO
ALTER TABLE [dbo].[TB_soliOrden]  WITH CHECK ADD  CONSTRAINT [fk_soliOrden] FOREIGN KEY([SO_ordenCompra])
REFERENCES [dbo].[TB_ordenCompra] ([OC_numOrden])
GO
ALTER TABLE [dbo].[TB_soliOrden] CHECK CONSTRAINT [fk_soliOrden]
GO
