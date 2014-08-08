<%

	cdAsigna = Int(Request.Form("cdAsigna"))
	cdCarrera = Int(Request.Form("cdCarrera"))
	Semestre = Int(Request.Form("Semestre"))
	Anio = Int(Request.Form("Anio"))
	reglas = Request.Form("reglas")
	usuario = Request.Form("userRut")
	

	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_upReglas(Anio,Semestre,cdCarrera,cdAsigna,reglas,usuario,mensaje)

	Set o = Nothing 
	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.write(mensaje)

%>