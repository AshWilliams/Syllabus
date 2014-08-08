<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="librDocenteUVM.inc"-->
<html>
<head>
<title>PortalUVM - Alumno</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../estilos.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();MM_preloadImages('../img/home2.jpg')">
<% 
Dim o, cuerpomail, s_NmApePat, s_NmApeMat, s_NmNombrs, s_CorreoElec, n_NrRutCoor, n_NrRut, d_FcEnvio, s_TpBusqueda
	Response.CacheControl = "no-cache"
	Response.Buffer = True
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
	'n_NrAnoActivo = Session("n_NrAnoActivo")
	'n_NrPerActivo = Session("n_NrPerActivo")
	'd_Fecha_Envio = Session("d_FcSistema")
	'n_NrRutProfe = Session("n_NrRutProfe")
	'n_TpUser_De = Session("n_TpUSer")
	Set o = getComponent()
If Request("accion") = "Enviar" Then	
	l_parr1 = Request.Form("parr1")
	l_parr2 = Request.Form("parr2")	
	l_parr3 = Request.Form("parr3")
    s_TpUser_Para = CStr(Request("s_TpUser_Para"))
	
    If s_TpUser_Para = "A" then
		s_NmCarrera = request ("s_NmCarrera")
	End If
	If s_TpUser_Para = "P" then
		n_NrRut_Para = CDbl(Request.Form("AluSelec"))
		Call o.Busca_Egresado(n_NrRut_Para, s_NmAlumno)
	End If
	'If n_NrRut_Para < 0  then 
		'n_NrRut_Para = 0
	'End If
	
	
	's_NmCarrer = CStr(Request("s_NmCarrer"))
	's_NrMalla = CStr(Request("s_NrMalla"))
	'n_NrParale = Request("n_NrParale")
	'n_CdAsigna = Request("n_CdAsigna")
	's_NmAsigna = CStr(Request("s_NmAsigna"))
	
	'n_CdSede = Request("n_CdSede")
	's_NmSede = CStr(Request("s_NmSede"))
	'n_CdDepartamento = Request("n_CdDepartamento")
	's_Adjunto = Request("Adjunto")
	'n_Enviar = CInt(Request("Enviar"))
	's_NmTpPrograma = Session("s_NmTpPrograma")
	'n_CdTpPrograma = Session("n_CdTpPrograma")
	's_Adjunto = request("s_Adjunto")
    's_StringAsig=Request("s_StringAsig")
End If
	'n_NrRut_De = n_NrRutProfe
	'n_TpUser_De = 2
	d_Fecha_Envio = date()

%>
<table width="950" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr valign="top"> 
    <td height="100" colspan="3"><!--#include file="headerdocente.asp"--></td>
  </tr>
  <tr> 
    <td height="10" colspan="3" bgcolor="#990000" class="fondo4"> <div><img src="../img/rojo.jpg" width="10" height="10"></div></td>
  </tr>
  <tr> 
    <td width="190" valign="top" bgcolor="#990000" class="fondo1"> <table width="190" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="160" valign="top"><!--#include file="menu_docente.asp"--></td>
          <td width="30" height="100%" valign="top"><img src="../img/arco.jpg" width="30" height="100%"></td>
        </tr>
      </table></td>
    <td width="570" valign="top"> <table width="570" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><p><img src="img/portaldocente.jpg" width="277" height="16"></p>
                  </td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade> </td>
        </tr>
        <tr> 
          <td valign="top"> 
            <form name="form2" method="post" action="nuevo_mensaje.asp">
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td class="texto"><p><span class="texto"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Estimado(a) 
                      </strong></font></span><font size="2" face="Arial, Helvetica, sans-serif"><strong><br>
                      <%response.write (s_NmCarrera&" "&s_NmAlumno)%>
                      </strong> </font></p>
                    <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <%response.write (l_parr1)%>
                    </font><br> 
                    </p>
                    <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <%response.write (l_parr2)%>
                    </font><br> 
                    </p>
                    <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <%response.write (l_parr3)%>
                    </font><br> 
                    </p>
                    <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif">Esperando 
                      que esta iniciativa sea de tu inter&eacute;s, te saluda 
                      cordialmente</font></p>
                    <p><font size="2" face="Arial, Helvetica, sans-serif"><strong><b><font face=Arial color=black size=2><span lang=ES 
style="FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">Red de Egresados UVM</span></font></b></strong><b><font face=Arial color=black size=2><span 
lang=ES 
style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial"><br>
                      </span></font></b><font 
face=Arial color=black size=2><span lang=ES 
style="FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">Universidad de Vi&ntilde;a 
                      del Mar<br>
                      Fono: 56 (32) 462433 / 462430<br>
                      E-mail: <a 
title=mailto:egresados@uvmc.l 
href="mailto:egresados@uvmc.l">egresados@uvmc.l</a> </span></font><font 
face=Arial color=navy size=2><span lang=ES 
style="FONT-SIZE: 10pt; COLOR: navy; FONT-FAMILY: Arial"><o:p></o:p></span></font> 
                      <input name="n_NrRutCoor" type="hidden" id="n_NrRutCoor" value="<%=n_NrRutCoor%>">
                      <input name="n_NrRut" type="hidden" id="n_NrRut" value="<%=n_NrRut%>">
                      </font></p></td>
                </tr>
                <tr> 
                  <td><div align="center"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <input name="accion" type="submit" class="Submit" id="accion" value="Enviar">
                      <input name="accion" type="submit" class="Submit" id="accion" value="Volver">
                      <%If Request("accion") = "Ver" Then	
							   'MandaMail() 
							   Set o = getComponent()
								'Call o.Envio_Carta_Registrar(n_NrRut, d_FcEnvio)	
								Set o = Nothing
					    response.write ("Carta enviada")
			           End If%>
                      <%If Request("accion") = "Volver" Then	
				 'n_NrRut = CDbl(Request("n_NrRut"))
				 'n_NrRutCoor = CDbl(Request("n_NrRutCoor"))
				        Response.Redirect("nuevo_mensaje.asp")
			           End If%>
                      </font></div></td>
                </tr>
              </table>
            </form></td>
        </tr>
      </table></td>
    <td width="190" valign="top"> <div align="center"> 
        <div align="center"> 
          <table width="190" height="70" border="0" cellpadding="0" cellspacing="5">
            <tr> 
              <td valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td valign="top">&nbsp;</td>
            </tr>
          </table>
      </div></td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table> 
<%
'-----------------------EMAIL------------------------------------------------
function MandaMail()
strTo = s_CorreoElec
strSubject = "Red de Egresados UVM"
strBody = "<html><body>"
strBody = strBody & "Estimado(a): "&s_NmNombrs&" "&s_NmApePat&" "&s_NmApeMat&"<br><br>" ' en n_NtOt se coloca la variable del nombre del exalumno.
strBody = strBody & "Con el prop&oacute;sito de mantener activos v&iacute;nculos con los estudiantes egresados de sus distintas <br>"
strBody = strBody & "carreras, generar diversos beneficios y facilitar los procesos de inserci&oacute;n laboral de las nuevas <br>"
strBody = strBody & "generaciones de profesionales, te informamos que la Universidad de Vi&ntilde;a del Mar ha resuelto crear la  <br>"
strBody = strBody & "Red de Egresados UVM. <br><br>"
strBody = strBody & "Por esta raz&oacute;n nos hemos puesto en contacto contigo, porque queremos establecer una interacci&oacute;n <br>"
strBody = strBody & "intereses y necesidades, e informarte de  futuros servicios y productos que estamos creando para ti. <br>"
strBody = strBody & "Para que esto sea posible necesitamos establecer contacto a trav&eacute;s de un n&uacute;mero de tel&eacute;fono fijo o celular.</font> <br>"
strBody = strBody & "o puedes completar con tus datos el formulario haciendo click en <a href= " & s_URL & ">Red de Egresados </a> <br><br>"
strBody = strBody & "Esperando que esta iniciativa sea de tu inter&eacute;s, te saluda cordialmente, <br><br>"                             
strBody = strBody & "Paula Descalzi Solari <br>"
strBody = strBody & "Coordinadora Red de Egresados <br>"
strBody = strBody & "Universidad de Viña del Mar <br>"
strBody = strBody & "Fono: 56 (32) 462433 / 462430 <br>"
strBody = strBody & "E-mail: pdescalzi@uvm.cl <br>"
strBody = strBody & "</body></html>"
Set cuerpomail = Server.CreateObject("CDONTS.NewMail") 'Creación del objeto
cuerpomail.From = "pdescalzi@uvm.cl" 'de este correo
cuerpomail.To = strTo 'a este correo
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
%>
</body>
</html>
