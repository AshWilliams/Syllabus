<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="Notas_Actas_Profesor.inc"-->
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
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length)   {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
} 

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega4();return false;">
<%  Dim o, xml, doc, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema
    Response.Buffer = True
	Response.CacheControl = "no-cache"

	Function Valor(nodo,etiqueta)
		valor = nodo.selectSingleNode(etiqueta).text
	End function
	
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10	

	Set o = getComponent()
	
%>
<table width="950" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="3"><!--#include file="headerdocente.asp"--></td>
  </tr>
  <tr> 
    <td height="10" colspan="3" bgcolor="#990000" class="fondo4"> <div><img src="../img/rojo.jpg" width="10" height="10"></div></td>
  </tr>
  <tr> 
    <td width="190" height="100%" valign="top" bgcolor="#990000" class="fondo1"> 
      <table width="190" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="160" valign="top"><table width="160" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><!--#include file="menu_docente.asp"--></td>
              </tr>
            </table></td>
          <td width="30" height="100%" valign="top"><img src="../img/arco.jpg" width="30" height="100%"></td>
        </tr>
      </table></td>
    <td width="731" valign="top"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="5">
	  <form action="prof_acta_consulta_asig.asp" method="post" name="form1">
        <tr> 
          <td width="696" height="65" valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><p><img src="img/portaldocente.jpg" width="277" height="16"></p>
                    </td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
			<span class="texto">Periodo:</span>            <span class="respuesta">
			<strong>
			<% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
&nbsp;</strong>&nbsp; </span><span class="texto">Fecha:</span><span class="respuesta Estilo2">
            <% call response.write (d_FcSistema) %>
            &nbsp;</span><span class="texto"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC"></font></font></strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">&nbsp; </font></font>Nombres:</span><span class="respuesta"><strong>
            <% call response.write (s_NmBrsProfe) %>
            </strong></span></td>
        </tr>
        <tr> 
          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="3" class="txtitulo">REGISTRO NOTAS DE ACTA</td>
              </tr>
            <tr>
              <td colspan="3" class="txsubtitulo"><font color="#FF0000" size="2" face="Arial, Helvetica, sans-serif">&nbsp;
              </font></td>
            </tr>
            <tr>
              <td colspan="3" class="respuesta"><strong>Seleccione asignatura </strong></td>
            </tr>
            <tr>
              <td colspan="3">
              <%
			  dim CARGA_DOCENTE, LIST_CARGA_DOCENTE
			  
				xml = o.Act_Consulta_Asignaturas_ListaActas(n_NrRutProfe)
				Set doc = Server.CreateObject ("MSXML.DomDocument")
				Call doc.loadxml (xml)
				set CARGA_DOCENTE = doc.selectNodes("//CARGA_DOCENTE/LIST_CARGA_DOCENTE")
				%>
                            <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr  bgcolor="#E4E4E4" class="texto" align="center">
                  <td width="27%" height="17">Carrera</td>
                  <td width="8%">Malla</td>
                  <td width="35%">Nombre Asignatura</td>
                  <td width="5%">Par.</td>
                  <td width="7%">Tp.Nota</td>
				  <td width="9%">Nota.Exim.</td>
				  <td width="9%">Por.Exam.</td>
                </tr>
                <% set LIST_CARGA_DOCENTE = CARGA_DOCENTE.nextNode %>
                  <% while not (LIST_CARGA_DOCENTE is nothing) %>
                <tr class="texto">
                  <td align="left"><%= valor(LIST_CARGA_DOCENTE,"s_NmCarrera") %></td>
                  <td align="left"><%= valor(LIST_CARGA_DOCENTE,"s_NrMalla") %></td>
                  				 
				  <td align="left"><%If (valor(LIST_CARGA_DOCENTE,"s_TpNota")="C" ) Then%><a href="prof_Acta_Registra_Notas.asp?s_CdPrb=<%=CStr(valor(LIST_CARGA_DOCENTE,"s_CdCarrera"))&"*"&valor(LIST_CARGA_DOCENTE,"s_NmCarrera")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrAnoPrueba")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrPerPrueba")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrMalla")&"*"&valor(LIST_CARGA_DOCENTE,"s_TipoAsig")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrParalelo")&"*"&valor(LIST_CARGA_DOCENTE,"s_TpRegimen")&"*"&valor(LIST_CARGA_DOCENTE,"s_CdAsigna")&"*"&valor(LIST_CARGA_DOCENTE,"s_NmAsigna")&"*"&valor(LIST_CARGA_DOCENTE,"s_TpNota")&"*"&valor(LIST_CARGA_DOCENTE,"s_SwEx_4")&"*"&valor(LIST_CARGA_DOCENTE,"s_NotaExim")&"*"&valor(LIST_CARGA_DOCENTE,"s_PorExamen")&"*"&valor(LIST_CARGA_DOCENTE,"s_CdDepende")%>"><%Elseif (valor(LIST_CARGA_DOCENTE,"s_TpNota")="V" ) Then%><a href="prof_Acta_Registra_Notas_val.asp?s_CdPrb=<%=CStr(valor(LIST_CARGA_DOCENTE,"s_CdCarrera"))&"*"&valor(LIST_CARGA_DOCENTE,"s_NmCarrera")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrAnoPrueba")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrPerPrueba")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrMalla")&"*"&valor(LIST_CARGA_DOCENTE,"s_TipoAsig")&"*"&valor(LIST_CARGA_DOCENTE,"s_NrParalelo")&"*"&valor(LIST_CARGA_DOCENTE,"s_TpRegimen")&"*"&valor(LIST_CARGA_DOCENTE,"s_CdAsigna")&"*"&valor(LIST_CARGA_DOCENTE,"s_NmAsigna")&"*"&valor(LIST_CARGA_DOCENTE,"s_TpNota")&"*"&valor(LIST_CARGA_DOCENTE,"s_SwEx_4")&"*"&valor(LIST_CARGA_DOCENTE,"s_NotaExim")&"*"&valor(LIST_CARGA_DOCENTE,"s_PorExamen")&"*"&valor(LIST_CARGA_DOCENTE,"s_CdDepende")%>"><%End If%><%= valor(LIST_CARGA_DOCENTE,"s_NmAsigna") %></a></td>
                   
				  <td align="center"><%= valor(LIST_CARGA_DOCENTE,"s_NrParalelo")%></td>
                  <td align="center"><%= valor(LIST_CARGA_DOCENTE,"s_TpNota")%></td>
                  <td align="center"><%= valor(LIST_CARGA_DOCENTE,"s_NotaExim")%>&nbsp;</td>
                  <td align="center"><%= valor(LIST_CARGA_DOCENTE,"s_PorExamen")%></td>
                </tr>
                <% set LIST_CARGA_DOCENTE = CARGA_DOCENTE.nextNode
				   wend %>
              </table></td>
            </tr>
            <tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3" class="txsubtitulo"><div align="left"><span class="respuesta">Si falta alguna asignatura es por qu&eacute; no est&aacute; incluido como profesor en la programaci&oacute;n  o no est&aacute; activada</span></div></td>
            </tr>
             <tr>
              <td colspan="3" class="txsubtitulo"><div align="left"><span class="respuesta">Si no existen asignaturas en la lista, es porque esta fuera de proceso</span></div></td>
            </tr>
			 <tr>
              <td colspan="3" class="txsubtitulo"><div align="left"><span class="respuesta">Ante alguna duda comun&iacute;quese con su Jefe de Carrera </span></div></td>
            </tr>
            <tr>
              <td colspan="2" class="respuesta">&nbsp; </td>
              <td class="respuesta">&nbsp;</td>
            </tr>
          </table>
           </td>
        </tr>
        <tr>
          <td valign="top"><hr size="1" noshade></td>
        </tr>
		</form>
      </table></td>
    <td width="29" valign="top"></td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table>
<%set o = nothing 
set xml = nothing
set doc = nothing
set CARGA_DOCENTE = nothing
set LIST_CARGA_DOCENTE = nothing%>
</body>
</html>
