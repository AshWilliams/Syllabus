<%

	Anio = Int(Request.Form("Anio"))
	Semestre = Int(Request.Form("Semestre"))
	Carrera = Int(Request.Form("cdCarrera"))
	cdAsigna = Int(Request.Form("asignatura"))
	padre = Int(Request.Form("padre"))
	hijo = Int(Request.Form("hijo"))
	semana = Int(Request.Form("semana"))
	inicio = Request.Form("inicio")
	termino = Request.Form("termino")
	nmTema = Request.Form("temas")
	nmActividad = Request.Form("actividad")
	nmRecurso = Request.Form("recurso")
	usuario = Request.Form("userRut")



	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	call o.fn_setActividad(Anio,Semestre,Carrera,cdAsigna,padre,hijo,semana,inicio,termino,nmTema,nmActividad,nmRecurso,usuario,mensaje)

	Set o = Nothing 
	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.Write(mensaje)

%>