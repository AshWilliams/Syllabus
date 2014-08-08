<%

	docCodigo = Int(Request.Form("codigo"))
	docTipo = Request.Form("tipo")
	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_getUdust(docCodigo,docTipo,udustJson)
	Set o = Nothing 

	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	'Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.write(udustJson)
	
%>