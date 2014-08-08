<%Dim n_NrRutProfe, n_NrAnoActivo, n_NrPerAtivo, s_NmBrsProfe, d_FcSistema, PruebaSeleccionada, n_NvPrueba, n_NrSubPru, n_NrSubPar , s_TpPrueba, s_NmPrueba, s_NmError, s_StringAsig
   Response.CacheControl = "no-cache"
	Function Separa(s)
		dim text
		text = s
		pos = 0
		pos = InStr(text,"*")
		if pos > 0 then
	  		salida=left(text,pos-1)
		else
			salida=text
		end if
		s = Right(text,len(text)-pos)
		separa = salida
	End function
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_CdCarrer = 0
	n_NrParalelo = 0
	n_CdAsigna = 0
	n_NrPrueba = 0
	n_NvPrueba = 0
	s_NrSubPru = 0
	s_NrSubPar = 0
	s_NmBrsProfe = ""
	d_FcSistema=#12-1-1999#
	d_FcPrueba=#12/1/1999#
	s_NmError = ""
	n_NrError     = 0
    s_NmPrueba=""
	s_TipoAsig=""
	n_NrAnoActivo = Session("n_NrAnoActivo")
	'n_NrPerActivo = Session("n_NrPerActivo")
	n_NrProceMapaes = Session("n_NrProceMapaes")
	If n_NrProceMapaes > 0 Then
		n_NrPerActivo = n_NrProceMapaes
	End If
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")	
	If n_NrRutProfe = 0 Then
	   response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10
	s_StringAsig=Request("s_StringAsig")	
	If s_StringAsig <> "" Then
		n_CdCarrer = Separa(s_StringAsig)
		s_NmCarrer = Cstr(Separa(s_StringAsig))						   						   
		n_NrParalelo = Separa(s_StringAsig)
	    s_NrMalla = Cstr(Separa(s_StringAsig))
	    n_CdAsigna = Separa(s_StringAsig)
	    s_NmAsigna = Cstr(Separa(s_StringAsig))
		s_TipoAsig = Cstr(Separa(s_StringAsig))
	    n_NrPrueba = Separa(s_StringAsig)
	    n_NvPrueba = Separa(s_StringAsig)
	    n_NrSubPru = Separa(s_StringAsig)
	    n_NrSubPar = Separa(s_StringAsig)
	    s_NmPrueba = Separa(s_StringAsig)
		d_FcPrueba = CDate(Separa(s_StringAsig))
	End If
	If s_TipoAsig = "" and s_NrPrueba = "" Then 
		Response.Redirect("prof_notas_parciales.asp?s_StringAsigCarrera"&"="&n_CdAsigna&"-"&s_NmAsigna&"-"&s_TipoAsig&"-"&n_NrParalelo&"-"&n_CdCarrer)
	Else
		If n_NvPrueba = 0 Then 
			Response.Redirect("prof_np_ingreso_masivo.asp?s_StringAsig"&"="&n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&n_CdCarrer&"*"&n_NrPrueba&"*"&s_NmPrueba&"*"&d_FcPrueba&"*"&s_NmError)
		Else
			Response.Redirect("prof_notas_ayudantias.asp?s_StringAsig"&"="&n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_TpPrueba&"*"&s_NrPrueba&"*"&s_NmPrueba)	
		End If
	End If
	Session("s_TpPrueba")  = s_TpPrueba
	Session("s_NrPrueba")  = s_NrPrueba
	Session("s_NmPrueba")  = s_NmPrueba
%>
