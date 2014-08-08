<%

	cdAsigna = Int(Request.Form("asignatura"))
	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_getMaxUnidad(cdAsigna,mensaje)

	Set o = Nothing 
	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.Write(mensaje)


%>