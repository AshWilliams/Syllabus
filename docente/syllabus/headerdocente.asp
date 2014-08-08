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
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<link href="../../estilos.css" rel="stylesheet" type="text/css">
<body onLoad="MM_preloadImages('../../img/bt_apoderadoov.gif','../../img/bt_egresadoov.gif','../../img/bt_funcionarioov.gif','../../img/bt_alumnoov.gif','../../img/cerrarov.gif')">
<table width="950" height="100" border="0" cellpadding="0" cellspacing="0" class="fondotop2">
  <tr>
    <td><table width="950" height="100" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="2" valign="top">
<table width="570" height="35" border="0" align="right" cellpadding="0" cellspacing="0" background="../../img/top2.jpg">
              <tr> 
                <td width="190">&nbsp;</td>
                <td width="190"><select name="select3" class="SELECT" onChange="MM_jumpMenu('parent',this,0)">
                  <option>GESTI&Oacute;N ACAD&Eacute;MICA</option>
                  <option value="../prof_notas_parciales.asp">Notas Parciales</option>
                  <option value="../prof_asistencia_asig.asp">Asistencia</option>
                  <option value="../prof_lista_curso.asp">Lista de Curso</option>
                  </select> </td>
                <td><select name="select3" class="SELECT">
                  <option>SERVICIOS DOCENTE</option>
                  <option value="../prof_bandeja_salida.asp">Mensaje a Alumnos</option>
                  <option value="../boleta.asp">Generar Boleta</option>
                  <option value="../historico_boletas.asp">Hist&oacute;rico de Boletas</option>
                  </select></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr><%
		  s_UserAlum = Session("s_UserAlum")			
			s_UserProf = Session("s_UserProf")
			s_UserEgre = Session("s_UserEgre")
			s_UserFun = Session("s_UserFun")
			s_UserApo = Session("s_UserApo") %>
          <td width="760" valign="bottom"><%If s_UserAlum = "S" Then%> <a href="../../alumno/index.asp"><img src="../../img/bt_alumno.gif" name="Image10" width="88" height="23" border="0" id="Image10" onMouseOver="MM_swapImage('Image10','','../img/bt_alumnoov.gif',1)" onMouseOut="MM_swapImgRestore()"></a><%End If%><%If s_UserProf = "S" Then%><img src="../../img/bt_docenteov.gif" name="Image311" width="88" height="23" border="0" id="Image3"><%End If%><%If s_UserEgre = "S" Then%><a href="../../egresado/index.asp"><img src="../../img/bt_egresado.gif" name="Image21" width="88" height="23" border="0" id="Image2" onMouseOver="MM_swapImage('Image21','','../../img/bt_egresadoov.gif',1)" onMouseOut="MM_swapImgRestore()"></a><%End If%><%If s_UserFun = "S" Then%><a href="../../funcionario/index.asp" onMouseOver="MM_swapImage('Image31','','../../img/bt_funcionarioov.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="../../img/bt_funcionario.gif" name="Image31" width="88" height="23" border="0" id="Image3"></a><%End If%><%If s_UserApo = "S" Then%><a href="../../apoderado/index.asp" onMouseOver="MM_swapImage('Image81','','../../img/bt_apoderadoov.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="../../img/bt_apoderado.gif" name="Image81" width="88" height="23" border="0" id="Image8"></a><%End If%></td>
          <td width="190" valign="bottom"><div align="right"><a href="../../logout.asp" onMouseOver="MM_swapImage('Image1','','../../img/cerrarov.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="../../img/cerrar.gif" name="Image1" width="185" height="23" border="0" id="Image1"></a></div></td>
        </tr>
      </table></td>
  </tr>
</table>
