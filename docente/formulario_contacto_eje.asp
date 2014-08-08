<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>PortalUVM - Docente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<body>
<%
Dim o, n_NrRutProfe, s_Para, s_Mensaje, s_CorreoElec
 Response.CacheControl = "no-cache"
d_FecRegistro = date()

if request("accion") = "Enviar" then
	n_NrRutProfe = 0
	s_Para = ""
	s_Mensaje = ""
	s_CorreoElec = ""
	n_NrRutProfe = Session("n_NrRutProfe")
    s_Para = Request("Para")	
	s_Mensaje = Request("Mensaje")
	s_CorreoElec = Request("s_NmMail") 
	If s_CorreoElec = "" Then
		s_CorreoElec = "sin_correo@uvm.cl"
	End If
	MandaMail()
	Response.Redirect("index.asp")	
End If 
%>
<%
'-----------------------EMAIL------------------------------------------------
function MandaMail()
	strTo = s_Para ' variable que contiene correo
	'strTo = "cristiansr@hotmail.com"
	strSubject = "Formulario de Contacto"
	strBody = "<html><body>"
	strBody = strBody &"Profesor Rut "& n_NrRutProfe & " Envía el siguiente comentario: " & s_Mensaje
	strBody = strBody & "</body></html>"
	Set cuerpomail = Server.CreateObject("CDONTS.NewMail") 'Creación del objeto
	cuerpomail.From = s_CorreoElec 'de este correo
	cuerpomail.To = strTo 'a este correo
	'cuerpomail.Cc = "cristian.sr@gmail.com"
	cuerpomail.Subject = strSubject'''

	cuerpomail.BodyFormat=0 'Estas dos línes
	cuerpomail.MailFormat=0 'permiten formatear mejor el mensaje

	cuerpomail.Body = strBody
	cuerpomail.Send 'Envía el mail

	Set cuerpomail = Nothing
end function 
'----------------EMAIL-----------------------------------------
set o = nothing
%>
</body>
</html>