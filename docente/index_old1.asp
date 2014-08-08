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

<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();MM_preloadImages('../img/vermas1.jpg','img/ir.jpg','../img/home2.jpg','../img/tarjeta2.jpg')">
<%  Dim n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, ASIGNATURAS, LISTAASIGNATURAS,  n_PorExamen
	dim s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer,s_NrMalla, s_NrParale, s_CdAsigna, s_NmEvaluacion, s_Eximicion, s_NotaExim, s_ObjGenerales, s_ObjEspecificos, s_Glsiseva, s_Glactapr, s_NmModalidad, s_NmFuncion, s_NmRegimen
    'Response.Buffer = True
	Response.CacheControl = "no-cache"
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	s_NmBrsProfe = ""
	s_StringAsig = ""
	d_FcSistema=#12-1-1999#
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = CDate(Session("d_FcSistema"))
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	s_StringAsig=Request("s_StringAsig")	
	If n_NrRutProfe = 0 Then		
		response.redirect("http://www.uvm.cl")
    End If	
	Session.TimeOut = 10	
	
	Set o = getComponent()
	call o.Busca_Comunicado_Glob(s_Existe)
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
    <td width="570" valign="top"> <table width="570" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td valign="top"><div align="center">
            <table width="570" height="100%" border="0" cellpadding="0" cellspacing="5">
                <tr> 
                  <td colspan="2" valign="top"> <div align="left"><img src="img/portaldocente.jpg" width="277" height="16"><span class="txsubtitulo"><br>
                      </span><span class="homeintrod"><strong><br>
                      Bienvenido</strong> <%=(s_NmBrsProfe)%></span> </div></td>
                  <td width="185" valign="top"><div align="right"><a href="http://www.uvm.cl"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a> 
                    </div></td>
                </tr>
                <tr> 
                  <td colspan="3" valign="top"><hr size="1" noshade>
				  <%If s_Existe = "S" Then%>
				  <!--<iframe src="comunicado.asp" width="560" height="100" scrolling="yes" frameborder="no"></iframe>-->
				  <!--#include file="comunicado.asp"-->
				  <%End If%> </td>
                </tr>
                <tr> 
                  <td width="186" valign="top"><table width="185" border="0" cellspacing="2" cellpadding="0">
                    <tr>
                      <td width="60"><span class="homearea"><a href="prof_lista_curso.asp"><img src="img/btasignaturas.jpg" name="asignaturas" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('asignaturas','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                      <td><span class="homearea">Asignaturas</span><strong><br>
                        </strong><span class="homeintrod">Lista de Cursos/Carpeta de Control Docente </span></td>
                    </tr>
                  </table></td>
                  <td width="187" valign="top"><table width="185" border="0" cellspacing="2" cellpadding="0">
                      <tr> 
                        <td width="60"><span class="homearea"><a href="historico_boletas.asp"><img src="img/bt_reglab.jpg" name="circulo5" width="59" height="59" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo5','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                        <td><span class="homearea">Registro Laboral</span><br> 
                          <span class="homeintrod">Servicios de Informaci&oacute;n 
                          y Solicitudes</span></td>
                      </tr>
                    </table></td>
                  <td width="185" valign="top"><table width="185" border="0" cellspacing="2" cellpadding="0">
                    <tr>
                      <td width="60"><span class="homearea"><a href="reglamentos.asp"><img src="img/bt_reglamentos.jpg" name="circulo3" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo3','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                      <td><span class="homearea">Reglamentos Oficiales</span><strong><br>
                      </strong><span class="homeintrod">Reglamentos de la UVM y la Carrera</span><span class="homearea"></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr> 
                  <td valign="top"><table width="185" border="0" cellspacing="2" cellpadding="0">
                    <tr>
                      <td width="60"><span class="homearea"><a href="prof_notas_parciales.asp"><img src="img/bt_notas.jpg" name="circulo2" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo2','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                      <td><span class="homearea">Evaluaciones</span><strong><br>
                      </strong><span class="homeintrod"> Registro de Notas por Asignaturas </span></td>
                    </tr>
                  </table> </td>
                  <td valign="top"> <div align="right"> 
                      <table width="185" border="0" cellspacing="2" cellpadding="0">
                        <tr> 
                          <td width="60"><span class="homearea"><a href="aula_intranet_docente.asp" target="_blank"><img src="img/bt_aula.jpg" name="circulo6" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo6','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                          <td><span class="homearea">Aula Virtual</span><br>
                            <span class="homeintrod">Tus Asignaturas en L&iacute;nea</span></td>
                        </tr>
                      </table>
                    </div></td>
                  <td><table width="185" border="0" cellspacing="2" cellpadding="0">
                      <tr> 
                        <td width="60"><span class="homearea"><a href="http://biblioteca.uvm.cl/biblioteca.asp" target="_blank"><img src="img/bt_biblioteca.jpg" name="circulo71" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo71','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                        <td><span class="homearea">Biblioteca</span><br> <span class="homeintrod">Cat&aacute;logo 
                          en L&iacute;nea, Biblioteca Digital, Publicaciones</span></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td><table width="185" border="0" cellspacing="2" cellpadding="0">
                    <tr>
                      <td width="60"><span class="homearea"><a href="prof_asistencia_asig.asp"><img src="img/bt_asistencia.jpg" name="circulo21" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo21','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                      <td><span class="homearea">Asistencia</span><strong><br>
                      </strong><span class="homeintrod"> Registro de Asistencia por Asignaturas </span></td>
                    </tr>
                  </table></td>
                  <td> 
                    <div align="right"> 
                      <table width="185" border="0" cellspacing="2" cellpadding="0">
                        <tr> 
                          <td width="60"><span class="homearea"><a href="prof_com_globales.asp"><img src="img/bt_comunicados.jpg" name="circulo7" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo7','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                          <td><span class="homearea">Comunicados</span><br> <span class="homeintrod">Todo 
                            lo que Necesitas Conocer, Histórico</span></td>
                        </tr>
                      </table>
                      <span class="homearea"> </span></div></td>
                  <td><a href="http://www.uvm.cl/credencial.shtml" target="_blank"><img src="../img/tarjeta1.jpg" name="tarjeta" width="183" height="70" border="0" id="tarjeta" onMouseOver="MM_swapImage('tarjeta','','../img/tarjeta2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                </tr>
                <tr> 
                  <td><table width="185" border="0" cellspacing="2" cellpadding="0">
                    <tr>
                      <td width="60"><span class="homearea"><a href="../calendario.asp" target="_blank"><img src="img/bt_calendario.jpg" name="circulo4" width="60" height="60" border="0" align="left" id="f1" onMouseOver="MM_swapImage('circulo4','','img/ir.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></span></td>
                      <td><span class="homearea">Calendario de Actividades 2009 </span><br>
                          <span class="homeintrod">Fechas y Plazos</span></td>
                    </tr>
                  </table></td>
                  <td rowspan="2"><div align="right"></div></td>
                  <td rowspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3"> <hr size="1" noshade></td>
                </tr>
              </table>
          </div></td>
        </tr>
      </table></td>
    <td width="190" valign="top"> <div align="center"> 
        <div align="center"> 
          <table width="190" border="0" cellspacing="5" cellpadding="0">
            <tr> 
              <td><img src="../img/titnoticias.jpg" width="91" height="19"> <span class="homeintrod">Docente</span></td>
            </tr>
          </table>
          <iframe src="https://www.uvm.cl/portal2007/docente/noticiashome.shtml" width="190" height="240" frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
          <div align="left"><a href="https://www.uvm.cl/portal2007/docente/masnoticias.shtml" target="_blank"><img src="../img/vermas2.jpg" name="Image6111" width="180" height="15" border="0" id="Image6" onMouseOver="MM_swapImage('Image6111','','../img/vermas1.jpg',1)" onMouseOut="MM_swapImgRestore()"></a> 
          </div>
          <table width="190" border="0" cellspacing="5" cellpadding="0">
            <tr> 
              <td><img src="../img/titagenda.jpg" width="86" height="22"></td>
            </tr>
          </table>
          <iframe src="https://www.uvm.cl/portal2007/docente/agendahome.shtml" width="190" height="120" frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
          <div align="left"><a href="https://www.uvm.cl/portal2007/docente/masagenda.shtml" target="_blank"><img src="../img/vermas2.jpg" name="Image61" width="180" height="15" border="0" id="Image6" onMouseOver="MM_swapImage('Image61','','../img/vermas1.jpg',1)" onMouseOut="MM_swapImgRestore()"></a> 
          </div>
        </div>
      </div></td>
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
