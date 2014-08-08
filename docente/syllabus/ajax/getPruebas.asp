<%

	docCodigo = Int(Request.Form("codigo"))
	docTipo = Request.Form("tipo")
	docParalelo = Int(Request.Form("paralelo"))
	docCarrera = Int(Request.Form("carrera"))

	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_getNotas(docCodigo,docTipo,docParalelo,docCarrera,2014,1, pruebasJson)
	Set o = Nothing 

	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	'Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.write(pruebasJson)


%>