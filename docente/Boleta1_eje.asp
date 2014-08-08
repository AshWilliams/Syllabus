<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="librDocenteUVM.inc"-->
<html>
<head>
<title>Red de Egresados UVM</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<body>
<%
Dim o, d_FecRegistro, n_NrRutProfe, n_NrEstado, s_NmError, n_AnoProcesar, n_MesProcesar, s_Observacion, n_NrBoleta, d_NrFecha, n_NrRutDestinatario, s_GlPrest1, n_NrValor1, n_NrRetencion1, n_NrTotal1, s_GlPrest2, n_NrValor2, n_NrRetencion2, n_NrTotal2, s_GlPrest3, n_NrValor3, n_NrRetencion3, n_NrTotal3, s_GlPrest4, n_NrValor4, n_NrRetencion4, n_NrTotal4
    Response.CacheControl = "no-cache"
    s_CorreoElec = "cristiansr@hotmail.com"

function Separa(s)
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
end function
function Cortar(s)
		dim text
		text = s
		pos = 0
		pos = InStr(text,",")
		if pos > 0 then
	  		salida=left(text,pos-1)
		else
			salida=text
		end if
		s = Right(text,len(text)-pos)
		Cortar = salida
end function
's_CdCarrer = CStr(Separa(s_String))
'Set o = session("comp_uvm_profe")
Set o = getComponent()
d_FecRegistro = date()


if request("accion") = "SI" then
    n_NrRutProfe = Session("n_NrRutProfe")
    call o.Valida_Ingreso_Boleta(n_NrRutProfe, n_AnoProcesar, n_MesProcesar, n_NrEstado)
	If n_NrEstado = 3 then
	   n_CdCodigo = 3
	   's_NmError = "Falta"
	   Response.Redirect("Boleta.asp?n_CdCodigo"&"="&n_CdCodigo)
	Else
       n_CdCodigo = 100
	   Session("n_AnoProcesar") = n_AnoProcesar 
	   Session("n_MesProcesar") = n_MesProcesar
	   Response.Redirect("Boleta.asp?n_CdCodigo"&"="&n_CdCodigo)
	End If
End If
if request("accion") = "NO" then	
	n_CdCodigo = 2
	Response.Redirect("Boleta.asp?n_CdCodigo"&"="&n_CdCodigo)
End If 
if request("accion") = "Volver" then	
	Response.Redirect("servicio.asp")
End If  
if request("accion") = "Enviar" then
    s_Observacion = ""   
	n_NrRutProfe = 0
	n_NrRutProfe = Session("n_NrRutProfe")
    s_Observacion = Request("Observacion")	
	n_CdAnulacion = 1    
	call o.No_Confirma_Monto(n_NrRutProfe, n_CdAnulacion, s_Observacion)
	MandaMail()
	'call o.No_Valida(n_NrRutProfe, s_CdConfirma, s_Observacion)
	Response.Redirect("index.asp")	
End If 

if request("accion") = "Guardar" then
	n_NrRutProfe = Session("n_NrRutProfe")
    n_NrBoleta = Request("NrBoleta")	
	n_NrDia = Request("dia")
	n_MesActivo = Request("n_MesActivo")  
	n_AnoActivo = Request("n_AnoActivo")
	d_NrFecha = CDate(n_NrDia&"-"&n_MesActivo&"-"&n_AnoActivo)
	'd_NrFecha = CDate(Request("Fecha"))
	'n_NrRutDestinatario = CDbl(Request("RutDestinatario"))
	'n_NrRutDestinatario = 71629400
	n_SdoBasCon = int(Request("n_SdoBasCon"))
	s_GlPrest1 = CStr(Request("Prest1"))
	n_NrValor1 = int(Request("Valor1"))	 
	n_NrRetencion1 = int(Request("Retencion1"))	
	n_NrTotal1 = int(Request("Total1"))
	
	n_NrAnoPer = Session("n_AnoProcesar")    
	n_NrMesPer = Session("n_MesProcesar")
	'**********************************************************

	n_NrRe = FormatNumber(((n_SdoBasCon * 10)/100), 1)   'Retención o sea el 10%	
	n_NrReten = int(n_NrRe)  ' se respalda el valor de una variable a otra, ya que se va a ingresar a la funcion cortar y la variable perdera su valor completo
	' Se ingresa a la función "cortar" y se obtiene el dìgito a la derecha de la coma n_Retencion, esto es para saber si se aproxima o no
	n_NrInutil = Cortar(n_NrRe)
	n_Retencion = int(Cortar(n_NrRe))
	 
	If n_Retencion >= 5 Then
	    n_NrRetencion = int(n_NrReten + 1)
	 Else
	    n_NrRetencion = int(n_NrReten)
	 End If
	n_NrLiquido = n_SdoBasCon -  n_NrRetencion    'Liquido
	
	'****************************************************
	
		'*** borrar memoria de session ****
		
	Session.Contents.Remove("s_ValidaError")
	Session.Contents.Remove("n_NrBoleta")
	Session.Contents.Remove("n_NrDia")
	Session.Contents.Remove("n_messistema")
	Session.Contents.Remove("n_anosistema")
	Session.Contents.Remove("n_SdoBasCon")
	Session.Contents.Remove("s_GlPrest1")
	Session.Contents.Remove("n_NrValor1")
	Session.Contents.Remove("n_NrRetencion1")
	Session.Contents.Remove("n_NrTotal1")
	Session.Contents.Remove("n_CdCodigo")

	If n_NrBoleta <= 0 Then
    	   s_ValidaError = "Error: El número de boleta tiene que ser MAYOR  a 0."
			n_CdCodigo = 100
			Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")
	End If
	If n_SdoBasCon = n_NrValor1	 Then 		
	   If n_NrRetencion = n_NrRetencion1 Then 
	      If n_NrTotal1 = n_NrLiquido Then
	         '*** antiguo **** call o.Ingresa_Boleta(n_NrRutProfe, n_NrAnoPer, n_NrMesPer, n_NrBoleta, d_NrFecha, s_GlPrest1, n_NrValor1, n_NrRetencion1, n_NrTotal1,  d_FecRegistro, s_GlPrest2, n_NrValor2, n_NrRetencion2, n_NrTotal2, s_GlPrest3, n_NrValor3, n_NrRetencion3, n_NrTotal3, s_GlPrest4, n_NrValor4, n_NrRetencion4, n_NrTotal4)    
			 call o.Ingresa_Boleta(n_NrRutProfe, n_NrAnoPer, n_NrMesPer, n_NrBoleta, d_NrFecha, s_GlPrest1, n_NrValor1, n_NrRetencion1, n_NrTotal1,  d_FecRegistro)    
			 s_Mensaje = "Los datos se Ingresaron en forma exitosa."
			 Session("s_Mensaje") = s_Mensaje
	         Response.Redirect("index.asp")	
		  Else	 
		    s_ValidaError = "Error: Valor líquido no corresponde."
			n_CdCodigo = 100
			Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")
		  End If
	   Else
	      s_ValidaError = "Error: Valor Retención no corresponde."
		  n_CdCodigo = 100
		  Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")		
	   End If	
	  Else
	   s_ValidaError = "Error: Valor no corresponde."
	   n_CdCodigo = 100
	   Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")
	End If 
End If 

'**************  ACTUALIZAR  *****************

if request("accion") = "Actualizar" then
	n_NrRutProfe = Session("n_NrRutProfe")
    n_NrBoleta = Request("NrBoleta")	' nuevo valor de boleta
	n_NrBoletaAnt = Request("n_NrBoleta") 'boleta anterior
	n_NrDia = Request("dia")
	n_MesActivo = Request("n_MesActivo")
	n_AnoActivo = Request("n_AnoActivo")
	d_NrFecha = CDate(n_NrDia&"-"&n_MesActivo&"-"&n_AnoActivo)
	'd_NrFecha = CDate(Request("Fecha"))
	'n_NrRutDestinatario = CDbl(Request("RutDestinatario"))
	'n_NrRutDestinatario = 71629400
	n_SdoBasCon = int(Request("n_SdoBasCon"))
	n_AnoProcesar = Request("n_AnoProcesar")
	n_MesProcesar = Request("n_MesProcesar")
	s_GlPrest1 = CStr(Request("Prest1"))
	n_NrValor1 = int(Request.form("Valor1"))	 
	n_NrRetencion1 = int(Request("Retencion1"))	
	n_NrTotal1 = int(Request("Total1"))
	
	n_NrAnoPer = Session("n_AnoProcesar")    
	n_NrMesPer = Session("n_MesProcesar")

	
	'************* CALCULO DE VALORES ***********************************

	n_NrRe = FormatNumber(((n_SdoBasCon * 10)/100), 1)   'Retención o sea el 10%
	n_NrReten = int(n_NrRe)
	
	n_NrInutil = Cortar(n_NrRe)
	n_Retencion = int(Cortar(n_NrRe))
	 
	If n_Retencion >= 5 Then
	    n_NrRetencion = int(n_NrReten + 1)
	 Else
	    n_NrRetencion = int(n_NrReten)
	 End If
	 n_NrLiquido = n_SdoBasCon -  n_NrRetencion    'Liquido
	
		'*** borrar memoria de session ****
		
	Session.Contents.Remove("s_ValidaError")
	Session.Contents.Remove("n_NrBoleta")
	Session.Contents.Remove("n_NrDia")
	Session.Contents.Remove("n_messistema")
	Session.Contents.Remove("n_anosistema")
	Session.Contents.Remove("n_SdoBasCon")
	Session.Contents.Remove("s_GlPrest1")
	Session.Contents.Remove("n_NrValor1")
	Session.Contents.Remove("n_NrRetencion1")
	Session.Contents.Remove("n_NrTotal1")
	Session.Contents.Remove("n_CdCodigo")
	
	If n_NrBoleta <= 0 Then
    	   s_ValidaError = "Error: El número de boleta tiene que ser MAYOR  a 0."
			n_CdCodigo = 100
			Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoletaAnt   
			'Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")
	End If

	If n_SdoBasCon = n_NrValor1	 Then 		
	   If n_NrRetencion = n_NrRetencion1 Then 
	      If n_NrTotal1 = n_NrLiquido Then
	         call o.Modificar_Boleta(n_NrRutProfe, n_AnoProcesar, n_MesProcesar, n_NrBoletaAnt, n_NrBoleta, d_NrFecha, s_GlPrest1, n_NrValor1, n_NrRetencion1, n_NrTotal1,  d_FecRegistro)    
			 s_Mensaje = "Los datos se modificaron en forma exitosa."
			 Session("s_Mensaje") = s_Mensaje
	         Response.Redirect("index.asp")	
		  Else	 
		    s_ValidaError = "Error: Valor liquido no corresponde."
			n_CdCodigo = 100
			Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")
		  End If
	   Else
	      s_ValidaError = "Error: Valor Retención no corresponde."
		  n_CdCodigo = 100
		  Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")		
	   End If	
	  Else
	   s_ValidaError = "Error: Valor no corresponde."
	   n_CdCodigo = 100
	   Session("s_ValidaError") = s_ValidaError
			Session("n_NrBoleta") = n_NrBoleta
			Session("n_NrDia") = n_NrDia
			Session("n_messistema") = n_messistema
			Session("n_anosistema") = n_anosistema
			Session("n_SdoBasCon") = n_SdoBasCon
			Session("s_GlPrest1") = s_GlPrest1
			Session("n_NrValor1") = n_NrValor1
			Session("n_NrRetencion1") = n_NrRetencion1
			Session("n_NrTotal1") = n_NrTotal1
			Session("n_CdCodigo") = n_CdCodigo
		    Response.Redirect("boleta.asp")
	End If 
	'call o.Ingresa_Boleta(n_NrRutProfe, n_NrAnoPer, n_NrMesPer, n_NrBoleta, d_NrFecha, s_GlPrest1, n_NrValor1, n_NrRetencion1, n_NrTotal1,  d_FecRegistro, s_GlPrest2, n_NrValor2, n_NrRetencion2, n_NrTotal2, s_GlPrest3, n_NrValor3, n_NrRetencion3, n_NrTotal3, s_GlPrest4, n_NrValor4, n_NrRetencion4, n_NrTotal4)
	'Response.Redirect("servicio.asp")	
End If 

%>
<%
'-----------------------EMAIL------------------------------------------------
function MandaMail()
strTo = "cristiansr@hotmail.com"
'strTo = "csanchez@uvm.cl"
strSubject = "Envío de Desacuerdo de profesor por Pago de Sueldos"
strBody = "<html><body>"
strBody = strBody &"Profesor Rut "& n_NrRutProfe & " Envía el siguiente comentario: " & s_Observacion
strBody = strBody & "</body></html>"
Set cuerpomail = Server.CreateObject("CDONTS.NewMail") 'Creación del objeto
cuerpomail.From = s_CorreoElec 'de este correo
cuerpomail.To = strTo 'a este correo
cuerpomail.Cc = "cristian.sr@gmail.com"
cuerpomail.Subject = strSubject'''

cuerpomail.BodyFormat=0 'Estas dos línes
cuerpomail.MailFormat=0 'permiten formatear mejor el mensaje

cuerpomail.Body = strBody
cuerpomail.Send 'Envía el mail


Set cuerpomail = Nothing

'Response.redirect "gracias.html"
' O bien podemos ahorrar una página y escribir algo como
'Response.write "Gracias por enviarnos sus sugerencias"	
end function 
'----------------EMAIL-----------------------------------------
set o = nothing
%>
</body>
</html>