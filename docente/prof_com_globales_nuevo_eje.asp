<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="librDocenteUVM.inc"-->
<html>
<head>
<title>PortalUVM - Docente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<body>
<%
Dim o, n_NrRutProfe, s_Para, s_Mensaje, s_CorreoElec
 Response.CacheControl = "no-cache"
d_FecRegistro = date()

if request("accion") = "Guardar" then
	Set o = getComponent()
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	s_Activado = Request("Activado") 
	s_Index = Request("Index") 
	s_Perfil = Request("Perfil")
	s_Titulo = Request("Titulo") 
	s_Resumen = Request("Resumen") 
	s_Texto = Request("Texto") 
	
	call o.Nuevo_comunicado(d_FcSistema, s_Titulo, s_Resumen, s_Texto, s_Activado, s_Index, s_Perfil)
	Response.Redirect("prof_com_globales.asp")	
End If 
%>
</body>
</html>