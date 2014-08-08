<%

	Anio = Int(Request.Form("Anio"))
	Semestre = Int(Request.Form("Semestre"))
	Carrera = Int(Request.Form("cdCarrera"))
	cdAsigna = Int(Request.Form("asignatura"))
	padre = Int(Request.Form("padre"))
	hijo = Int(Request.Form("hijo"))
	usuario = Request.Form("userRut")

	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_getActividad(Anio,Semestre,Carrera,cdAsigna,padre,hijo,usuario,mensaje)

	Set o = Nothing 
	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.Write(mensaje)


%>