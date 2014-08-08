<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="librDocenteUVM.inc"-->
<html>
<head>
<title>PortalUVM - Docente</title>
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
<%  Dim o, doc, xml, ASIGNATURAS, LISTAASIGNATURAS, CURSO, LISTA, ALUMNOS, ASISTENCIA, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_StringAsig, n_TpUser, s_CdCarrer,s_NrMalla, s_NrParale, s_CdAsigna, s_NmCarrer, s_TpUser_Para, s_Prioridad_Alta, s_Asunto, l_Detalle, s_NrRutAlu, n_NrRut_Para, s_NmAlumno, s_NmTpPrograma, n_CdTpPrograma
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
		Separa = salida
	End function
	Function Valor(nodo,etiqueta)
		valor = nodo.selectSingleNode(etiqueta).text
	End function
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_CdCarrer = 0
	n_NrParale = 0
	n_CdSede = 0
	n_CdAsigna  = 0
	n_CdDepartamento = 0
	s_NmBrsProfe = ""
	d_FcSistema=#12/1/1999#
	d_FcEnvio=#12/1/1999#
	s_StringAsig = ""
	n_TpUser_De = 0
	s_CdCarrer = ""
	s_NrMalla  = ""
	s_NrParale = ""
	s_CdAsigna = ""
	s_NmCarrer = ""
	s_TpUser_Para = ""
	s_Prioridad_Alta = ""
	s_Asunto = ""
	s_Ajunto = ""
	l_Detalle = ""
	n_NrRut_Para = 0
	s_NmAlumno = ""
	s_Adjunto=""
	s_TpEnvio=""
	s_NmEnvio=""
	s_Direccion=""
	n_NrCorrelativo=0
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	n_TpUser_De = Session("n_TpUser")
	s_CdAsigna = Session("s_CdAsigna")
	s_NmTpPrograma = Session("s_NmTpPrograma")
	n_CdTpPrograma = Session("n_CdTpPrograma")
	If n_NrRutProfe = 0 Then
	    response.redirect("http://www.uvm.cl")
    End If
	s_StringAsig=Request("s_StringAsig")
	If s_StringAsig <>  "" then
		n_CdCarrer = Separa(s_StringAsig)
		s_NmCarrer = Separa(s_StringAsig)
		n_NrParale = Separa(s_StringAsig)
        s_NrMalla = Separa(s_StringAsig)
        n_CdAsigna = Separa(s_StringAsig)
        s_NmAsigna = Separa(s_StringAsig)
	    n_CdSede = Separa(s_StringAsig)
        n_CdDepartamento = Separa(s_StringAsig)
		s_NmSede = Separa(s_StringAsig)		
		n_NrCorrelativo = Separa(s_StringAsig)
	End If		
	
	Session.TimeOut = 10	
	Set o = getComponent()

n_NrRut_De = n_NrRutProfe
n_TpUser_De = 2
n_CdTpPrograma = 1
Call o.Consulta_Comunicado_Existente_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRut_De, n_TpUser_De, n_CdAsigna, n_NrParale, n_CdTpPrograma, n_NrCorrelativo, d_FcEnvio, s_TpEnvio, s_NmEnvio, s_Asunto, s_Adjunto, l_Detalle) 
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
    <td width="570" valign="top"><table width="570" border="0" cellpadding="0" cellspacing="5">
        <tr> 
          <td valign="top"><div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><img src="img/portaldocente.jpg" width="277" height="16"><span class="txsubtitulo"><br>
                  </span> </td>
                  <td><div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto">Periodo:</span> <span class="respuesta">
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
&nbsp;</span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#0099CC">&nbsp; </font></font>Fecha:</span> <span class="respuesta">
<% call response.write (d_FcSistema) %>
&nbsp;&nbsp; </span><span class="texto">Nombres:<strong class="respuesta">
<% call response.write (s_NmBrsProfe) %>
</strong></span> </td>
        </tr>
        <tr> 
          <td valign="top"><table width="395" border="0">
            <tr>
              <td colspan="2" class="txsubtitulo"><a href="prof_bandeja_salida.asp">Comunicados &gt;</a> Detalle Bandeja Salida </td>
              </tr>
            <tr>
              <td width="88" class="txsubtitulo">Asignatura:</td>
              <td width="297" class="respuesta"><%Response.Write(s_NmAsigna)%></td>
            </tr>
            <tr>
              <td class="txsubtitulo">Paralelo:</td>
              <td class="respuesta"><%Response.Write(n_NrParale)%></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td></td>
            </tr>
          </table>
<form name="form1" method="post" action="">
  <table width="560" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
    <tr bgcolor="#666666">
      <td colspan="2" class="texto"><div align="left"> <a href="eliminar_eje.asp?s_StringAsig=<%=n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede%>" onMouseOver="MM_swapImage('Image1','','../img/eliminar2.gif',1)" onMouseOut="MM_swapImgRestore()">
          <input name="accion" type="submit" class="Submit" id="accion" value="Cancelar">
          </a> <font color="#0099CC" size="2" face="Arial, Helvetica, sans-serif">
          <%If request("accion") = "Cancelar" then
				Response.Redirect("prof_bandeja_salida.asp?s_StringAsig"&"="&n_CdCarrer&"-"&n_NrParale&"-"&s_NrMalla&"-"&n_CdAsigna&"-"&s_NmAsigna)
		    End If%>
      </font> </div></td>
    </tr>
    <tr bgcolor="#666666">
      <td colspan="2" class="texto"><font color="#FFFFFF"><strong>Detalle Comunicado Enviado </strong></font></td>
    </tr>
    <tr class="texto">
      <td width="101"><div align="left">Fecha</div></td>
      <td width="449"><%response.write(d_FcEnvio)%>&nbsp;</td>
    </tr>
    <tr class="texto">
      <td>Enviado por </td>
      <td>
        <% response.write(s_NmEnvio)  'call response.write (s_TpEnvioPor) %>&nbsp;</td>
    </tr>
    <tr class="texto">
      <td>Para</td>
      <td><%response.write(s_TpEnvio)   'response.write(s_NmEnvio)%>&nbsp;</td>
    </tr>
    <tr class="texto">
      <td>Asunto</td>
      <td><%response.write(s_Asunto)%>&nbsp;</td>
    </tr>
    <tr class="texto">
      <td>Detalle</td>
      <td>
        <textarea name="Detalle" cols="38" rows="6" wrap="VIRTUAL" class="input" id="Detalle" value="<% =(l_Detalle)%>"><% call response.Write (l_Detalle) %> 
         </textarea></td>
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
<%set o = nothing%>
</body>
</html>
