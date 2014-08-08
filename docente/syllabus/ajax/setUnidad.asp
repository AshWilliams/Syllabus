<%

	contRes = 1
	cdAsigna = Int(Request.Form("cdasigna"))
	nivelPadre = Int(Request.Form("nivelPadre"))
	usuario = Request.Form("userRut")
	contenidoPadre = ""
	flag = 0
	Const Q = """"
	set o = Server.CreateObject("Portal_Profesor_Syllabus.Portal_Profesor_Syllabus")

	For Each elemento in Request.form
		'Response.Write elemento & ": " & Request.form(elemento) & "</br>"
		If InStr(elemento, "contenido") > 0 Then
			'Response.Write "es contenido" & "</br>"
			contenidoPadre =  Request.form(elemento)
			'inserto como padre-unidad
			If (contenidoPadre = "") Then
				flag = 1
				mensaje = "{"& Q &"mensaje"& Q & ":" & Q &"No se ingreso Unidad Tematica"& Q &"}"
				Exit For
			Else
				call o.fn_setUnidad(cdasigna,nivelPadre,contenidoPadre,usuario,mensaje)
			End If
			 
		End If
		If InStr(elemento, "sub") > 0 Then
			'Response.Write "es resultado" & "</br>"
			nivelHijo = contRes
			contenidoHijo = Request.form(elemento)
			contRes = contRes + 1
			'inserto como hijo-ra asociado al padre'
			If (flag = 0) Then
				call o.fn_setResultado(cdasigna,nivelPadre,contenidoPadre,nivelHijo,contenidoHijo,usuario,mensaje)
			End If
		End If
	Next

	set o = Nothing
	Response.ContentType = "application/json" 'con esta linea me ahorro el parse en el cliente=optimizacion'
	Response.CodePage = 65001
	Response.CharSet = "UTF-8"
	Response.write(mensaje)
	
%>