<%

	cdAsigna = Int(Request.Form("cdAsigna"))
	cdCarrera = Int(Request.Form("cdCarrera"))
	Semestre = Int(Request.Form("Semestre"))
	Anio = Int(Request.Form("Anio"))

	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_getSylla1(Anio,Semestre,cdCarrera,cdAsigna,mensaje)

	Set o = Nothing 
	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.write(mensaje)
	

%>