<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="librDocenteUVM.inc"-->
<%
Dim o, n_NrAnoActivo, n_NrPerActivo, d_Fecha_Envio, s_Asunto, l_Detalle, n_NrRut_De, n_TpUser_De, s_CdCarrer, s_NmCarrer, s_NrMalla, s_NrParale, s_CdAsigna, s_NmAsigna, s_TpUser_Para, n_Enviar, s_NmTpPrograma, n_CdTpPrograma
	Function Separa(s)
		dim text
		text = s
		pos = 0
		pos = InStr(text,"-")
		if pos > 0 then
	  		salida=left(text,pos-1)
		else
			salida=text
		end if
		s = Right(text,len(text)-pos)
		separa = salida
	End function		
	s_Asunto=""
	l_Detalle = ""
	s_Fecha = ""
	n_NrRut_De = 0
	n_NrRut_Para = 0
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_CdCarrer = 0
	n_NrParale = 0
	n_CdSede = 0
	n_CdAsigna  = 0
	n_CdDepartamento = 0
	s_NmSede = ""
	s_NrMalla  = ""
	s_NmCarrer = ""
	s_NmAsigna = ""
	s_Adjunto=""
	s_TpPrioridad = "A"
	n_TpUser_De = 0
	d_Fecha_Envio=#12-1-1999#
	s_TpUser_Para = ""
	n_Enviar = 0
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_Fecha_Envio = Session("d_FcSistema")
	d_Fecha_Envio = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	n_TpUser_De = Session("n_TpUSer")
	s_Asunto = Request.Form("Asunto")
	l_Detalle = Request.Form("Detalle")	
	n_CdCarrer = Request("n_CdCarrer")
	s_NmCarrer = CStr(Request("s_NmCarrer"))
	s_NrMalla = CStr(Request("s_NrMalla"))
	n_NrParale = Request("n_NrParale")
	n_CdAsigna = Request("n_CdAsigna")
	s_NmAsigna = CStr(Request("s_NmAsigna"))
	s_TpUser_Para = CStr(Request("s_TpUser_Para"))
	n_CdSede = Request("n_CdSede")
	s_NmSede = CStr(Request("s_NmSede"))
	n_CdDepartamento = Request("n_CdDepartamento")
	's_Adjunto = Request("Adjunto")
	n_Enviar = CInt(Request("Enviar"))
	s_NmTpPrograma = Session("s_NmTpPrograma")
	n_CdTpPrograma = Session("n_CdTpPrograma")
	s_Adjunto = request("s_Adjunto")
    s_StringAsig=Request("s_StringAsig")

	n_NrRut_De = n_NrRutProfe
	n_TpUser_De = 2
	d_Fecha_Envio = date()
	
	
	If s_TpUser_Para = "P" then
		n_NrRut_Para = CDbl(Request.Form("AluSelec"))
	End If
	If n_NrRut_Para < 0  then 
		n_NrRut_Para = 0
	End If
	'If n_NrRut_De = 0 Then
		'Response.Redirect("../index.htm")
	'End If	
	'If Request.Form("Enviar.x") <> "" then
	If Request.Form("accion") = "Enviar" then
		Set o = getComponent() 
		'''''Call o.Ingreso_Nuevo_Mensaje(n_NrAnoActivo, n_NrPerActivo, n_NrRut_De, n_TpUser_De, n_CdAsigna, n_NrParale, d_Fecha_Envio, s_Asunto, l_Detalle, s_TpUser_Para, n_NrRut_Para, s_TpPrioridad, n_CdTpPrograma, s_Adjunto, s_NrMalla, n_CdCarrer)
		Call o.Ingreso_Comunicado(n_NrAnoActivo, n_NrPerActivo, n_NrRut_De, n_TpUser_De, n_CdAsigna, n_NrParale, d_Fecha_Envio, s_Asunto, l_Detalle, s_TpUser_Para, n_NrRut_Para, s_TpPrioridad, n_CdTpPrograma, s_NrMalla, n_CdCarrer)
		Session.Contents.Remove("n_CdCarrer") 
		Session.Contents.Remove("s_NmCarrer") 
		Session.Contents.Remove("n_NrParale") 
		Session.Contents.Remove("s_NrMalla") 
		Session.Contents.Remove("n_CdAsigna") 
		Session.Contents.Remove("s_NmAsigna") 
		Session.Contents.Remove("n_CdSede") 
		Session.Contents.Remove("n_CdDepartamento") 
		Session.Contents.Remove("s_NmSede") 
		Session.Contents.Remove("s_TpUser_Para") 
		Session.Contents.Remove("s_Asunto") 
		Session.Contents.Remove("n_NrRut_Para")
		'Response.Redirect("prof_bandeja_salida.asp?s_StringAsig"&"="&n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede)
		Response.Redirect("prof_bandeja_salida.asp?s_StringAsig"&"="&n_CdCarrer&"-"&n_NrParale&"-"&s_NrMalla&"-"&n_CdAsigna&"-"&s_NmAsigna)
	End If				
	'If Request.Form("Cancelar.x") <> "" then
	If Request.Form("accion") = "Cancelar" then
	   s_Asunto=""
	   s_Adjunto =""
	   s_Direccion=""
	   'Response.Redirect("prof_bandeja_salida.asp?s_StringAsig"&"="&n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede)
	   Response.Redirect("prof_bandeja_salida.asp?s_StringAsig"&"="&n_CdCarrer&"-"&n_NrParale&"-"&s_NrMalla&"-"&n_CdAsigna&"-"&s_NmAsigna)
	End If
	'If Request.Form("Nuevo.x") <> "" then
	If Request.Form("accion") = "Limpiar" then
	   s_Asunto=""
	   s_Adjunto =""
	   s_Direccion=""
	   Response.Redirect("prof_nuevo_mensaje.asp?s_StringAsig"&"="&n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede)
	End If
%><%Set o = Nothing%>
    