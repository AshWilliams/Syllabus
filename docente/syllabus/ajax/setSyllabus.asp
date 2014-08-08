<%	

	cdAsigna = Int(Request.Form("cdAsigna"))
	cdCarrera = Int(Request.Form("cdCarrera"))
	Semestre = Int(Request.Form("Semestre"))
	Anio = Int(Request.Form("Anio"))
	horario = Request.Form("horarios")
	atencion = Request.Form("atencion")
	usuario = Request.Form("userRut")
	fecha = Request.Form("fecha")

	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_contSyllabus(Semestre,Anio,cdCarrera,cdAsigna,n_retorno)
	

	If (n_retorno > 0) Then
		call o.fn_upSylla1(Anio,Semestre,cdCarrera,cdAsigna,horario,atencion,usuario,mensaje)
		
	Else
		call o.fn_setSylla1(Anio,Semestre,cdCarrera,cdAsigna,horario,atencion,usuario,mensaje)
		
	End If

	Set o = Nothing 
	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.write(mensaje)
	

%>