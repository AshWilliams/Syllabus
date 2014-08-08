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
<%  Dim n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo,  s_NmBrsProfe, d_FcSistema

    'Response.Buffer = True
	Response.CacheControl = "no-cache"
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	s_NmBrsProfe = ""
	s_StringAsig = ""
	d_FcSistema=#12-1-1999#
	'////////////////////////////////////////////////////////////
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = CDate(Session("d_FcSistema"))
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	s_StringAsig=Request("s_StringAsig")
	
	'////////////////////////////////////////////////////////////7	
	If n_NrRutProfe = 0 Then		
		response.redirect("http://www.uvm.cl")
    End If	
	Session.TimeOut = 10	
	
	Set o = getComponent()

%>
<table width="950" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="3"> <!--#include file="headerdocente.asp"--></td>
  </tr>
  <tr> 
    <td height="10" colspan="3" bgcolor="#990000" class="fondo4"> <div><img src="../img/rojo.jpg" width="10" height="10"></div></td>
  </tr>
  <tr> 
    <td width="190" height="100%" valign="top" bgcolor="#990000" class="fondo1"> 
      <table width="190" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="160" valign="top"> <table width="160" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><!--#include file="menu_docente.asp"--></td>
              </tr>
            </table></td>
          <td width="30" height="100%" valign="top"><img src="../img/arco.jpg" width="30" height="100%"></td>
        </tr>
      </table></td>
    <td width="570" valign="top"><table width="570" border="0" cellspacing="7" cellpadding="0">
        <tr> 
          <td><p><img src="img/portaldocente.jpg" width="277" height="16" align="top"></p>
            <p><span class="homeintrod"><strong>Bienvenido</strong> <%=(s_NmBrsProfe)%></span> 
            </p></td>
          <td align="right"><a href="http://www.uvm.cl"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></td>
        </tr>
        <tr> 
          <td colspan="2"><hr size="1" noshade></td>
        </tr>
        <tr bgcolor="#990000" background="img/aula_h2.png"> 
          <td colspan="2" class="textblanco2">&nbsp; <strong>Informe 
            de Evaluaci&oacute;n</strong></td>
        </tr>
        <tr align="center"> 
          <td colspan="2"> <table width="90%" border="0" cellspacing="5" cellpadding="0">
              <tr> 
                <td class="texto2"><p>Estimado Docente:</p></td>
              </tr>
              <tr> 
                <td><p class="texto2">Por favor hacer  clic en el siguiente link para visualizar los resultados de la &nbsp;Encuesta  Docente 2011 &ndash; Segundo Semestre.</p></td>
              </tr>
            </table>
            <p>&nbsp;</p></td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr align="center"> 
          <td colspan="2"><a href="Prof_lista_evaluacion.asp">Ver Informe Evaluaci&oacute;n</a></td>
        </tr>
        <tr>
          <td colspan="2" class="texto2">Ante cualquier duda o consulta favor contactar al correo mesa.servicios@uvm.cl, indicando en el asunto del correo “Evaluaci&oacute;n Encuesta UVM”, o al fono (32)2462400. </td></tr>
        <tr align="center">
          <td colspan="2"><hr size="1" noshade></td>
        </tr>
      </table> </td>
    <td width="190" valign="top">&nbsp;</td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4"><table width="570" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td class="textblanco"><strong>Secretar&iacute;a Acad&eacute;mica UVM</strong> / Fono 2462500 / <a href="mailto:sec.academica@uvm.cl" target="_blank" class="estilo2">sec.academica@uvm.cl</a></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
