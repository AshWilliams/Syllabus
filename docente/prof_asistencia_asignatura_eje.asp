<%Dim d_FcAsistencia,s_StringAsigIngMasivo, n_NrRutProfe
    Response.CacheControl = "no-cache"
	d_FcAsistencia=#12-1-2005#  
	s_StringAsigIngMasivo = ""
	n_NrRutProfe = Session("n_NrRutProfe")
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10	
	If Request("accion") = "-->" then 
		d_FcAsistencia= CDate(Request("Fecha"))
		s_StringAsigIngMasivo= Request("clavehoraria")
		Response.Redirect("prof_asistencia_ingreso_masivo.asp?s_StringAsig"&"="&Cdate(d_FcAsistencia)&"*"&s_StringAsigIngMasivo)	
	End If 
%>
