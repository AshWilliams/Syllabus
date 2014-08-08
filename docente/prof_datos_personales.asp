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

<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega();return false;">
<table width="950" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<%  Dim o, doc, xml, ASIGNATURAS, LISTAASIGNATURA, CLAVE, HORARIA, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, d_FcAsistencia, n_CdCarrera,s_NrMalla, n_NrParalelo, n_CdAsigna, s_NmCarrera, s_NmAsigna, s_CdClave, s_CdClave1, s_NmClave, s_HrsInicio, s_HrsTermino, s_StringAsigIngMasivo, s_StringAsig, s_StringAsigTipo, s_StringAsigParalelo, s_StringAsigCarrera
    Response.CacheControl = "no-cache"
	Function Separa(s, cadena)
		dim text
		text = s
		pos = 0
		pos = InStr(text,cadena)
		if pos > 0 then
	  		salida=left(text,pos-1)
		else
			salida=text
		end if
		s = Right(text,len(text)-pos)
		separa = salida
	End function
	Function Valor(nodo,etiqueta)
		valor = nodo.selectSingleNode(etiqueta).text
	End function
	Function ObtenerFechaActual
		ObtenerFechaActual = FormatDateTime(Date, 2) 
	End Function
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_CdCarrera = 0
	n_NrParalelo = 0
	n_CdAsigna = 0
	s_NmBrsProfe = ""
	d_FcSistema=#1/12/1999#
	d_FcAsistencia=#1/12/1999#
	s_StringAsig = ""	
    s_NrMalla  = ""	
	s_NmCarrer = " "
	s_NmAsigna = ""
	s_CdClave ="02"
	s_CdClave1 = ""
	s_NmClave = ""
	s_HrsInicio = " "
	s_HrsTermino = " "
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")

	d_Fecha = date()
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10	
	Set o = getComponent()
	Call o.Consulta_Datos_Profesor(n_NrRutProfe, s_DirFun, s_NrTelFun, d_FcNacimiento, s_CdSexo, s_CdEstCivil, s_NmMail)
	n_error = CInt(Request("s_error"))
%>
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
    <td width="570" valign="top"> <table width="570" border="0" cellpadding="0" cellspacing="5">
        <tr> 
          <td valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><img src="img/portaldocente.jpg" width="277" height="16"><span class="txsubtitulo"><br>
                    </span> 
				  <span class="imput"></span></td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade> </td>
        </tr>
        <tr> 
          <td valign="top"><span class="txsubtitulo">Ficha  docente/ <%=(s_NmBrsProfe)%>          </span>            <br>
          <table width="570" border="0" cellspacing="0" cellpadding="2">
			<form action="prof_datos_personales_eje.asp" method="post" name="form1">
              <tr>
                <td colspan="2" class="texto"><div align="right"></div>  
				<%If n_error = 100 then
				s_mensaje = "Los datos fueron actualizados en forma correcta"%>                
                  <table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FF0000">
                    <tr>
                      <td><span class="respuesta">
                        <%response.write(s_mensaje)%>
                      </span></td>
                    </tr>
                  </table>
				  <%End If%><font size="2" face="Arial, Helvetica, sans-serif">
                  <!--<input name="DirDocente" type="text" class="input" id="DirDocente" value="<%' =(s_DirFun) %>" size="50" maxlength="45" readonly="true">-->
                  </font></td>
                </tr>
              <tr>
                <td class="texto"><div align="right">* Direcci&oacute;n Docente</div></td>
                <td width="371"><font size="2" face="Arial, Helvetica, sans-serif">
                  <input name="DirDocente" type="text" class="input" id="DirDocente" value="<% =(s_DirFun) %>" size="50" maxlength="45">
                </font></td>
              </tr>
              <tr>
                <td class="texto"><div align="right">* Tel&eacute;fono </div></td>
                <td><font size="2" face="Arial, Helvetica, sans-serif">
                  <!--<input name="NrTelefono" type="text" class="input" id="NrTelefono" value="<%' =(s_NrTelFun) %>" size="50" maxlength="35" readonly="true">-->
				  <input name="NrTelefono" type="text" class="input" id="NrTelefono" value="<% =(s_NrTelFun) %>" size="50" maxlength="45">
                </font></td>
              </tr>
              <tr>
                <td class="texto"><div align="right">Nacimiento</div></td>
                <td><font size="2" face="Arial, Helvetica, sans-serif">
                  <!--<input name="FcNaciMi" type="text" class="input" id="Nacimiento2" value="<%' =(d_FcNacimiento) %>" size="15" maxlength="12" readonly="true">-->
				  <input name="FcNaciMi" type="text" class="input" disabled="disabled" id="FcNaciMi" value="<% =(d_FcNacimiento) %>" size="10" maxlength="10">
				   <span class="texto">(dd/mm/aaaa)
                   </span></font></td>
              </tr>
              <tr>
                <td class="texto"><div align="right">Sexo </div></td>
                <td><font size="2" face="Arial, Helvetica, sans-serif">
                  <select name="sexo" disabled="disabled" class="SELECT" id="select2">
                    <option value="M" <%If (Not isNull((s_CdSexo))) Then If ("M" = CStr((s_CdSexo))) Then Response.Write("SELECTED") : Response.Write("")%>>Masculino</option>
                    <option value="F" <%If (Not isNull((s_CdSexo))) Then If ("F" = CStr((s_CdSexo))) Then Response.Write("SELECTED") : Response.Write("")%>>Femenino</option>
                  </select>
</font></td>
              </tr>
              <tr>
                <td class="texto"><div align="right">* Correo Electr&oacute;nico</div></td>
                <td><font size="2" face="Arial, Helvetica, sans-serif">
                 <!-- <input name="CorreoElec" type="text" class="input" id="CorreoElec" value="<%' =(s_NmMail) %>" size="40" maxlength="70" readonly="true">-->
                  <input name="CorreoElec" type="text" class="input" id="CorreoElec" value="<% =(s_NmMail) %>" size="50" maxlength="45">
</font></td>
              </tr>
              <tr>
                <td class="texto"><div align="right">Estado Civil </div></td>
                <td><font size="2"><font size="2" face="Arial, Helvetica, sans-serif">
				    <select name="EstadoCiv" class="SELECT" disabled="disabled" id="select2">
                    <option value="S" <%If (Not isNull((s_CdEstCivil))) Then If ("S" = CStr((s_CdEstCivil))) Then Response.Write("SELECTED") : Response.Write("")%>>Soltero</option>
                    <option value="C" <%If (Not isNull((s_CdEstCivil))) Then If ("C" = CStr((s_CdEstCivil))) Then Response.Write("SELECTED") : Response.Write("")%>>Casado</option>
					<option value="V" <%If (Not isNull((s_CdEstCivil))) Then If ("V" = CStr((s_CdEstCivil))) Then Response.Write("SELECTED") : Response.Write("")%>>Viudo</option>
                  </select>
</font></font><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;
                </font></td>
              </tr>
              <tr>
                <td class="texto">
                  <div align="right">
                    <input name="accion" type="submit" class="input" id="accion" value="Cancelar">
                  </div></td>
                <td class="texto">
                  <input name="accion" type="submit" class="input" id="accion" value="Actualizar"></td>
              </tr>
              <tr>
                <td colspan="2" class="texto"><div align="right"></div>                  
                  <span class="texto"><font face="Arial, Helvetica, sans-serif">* Campo Obligatorio </font></span></td>
                </tr>
			  </form>
            </table>
          </td>
        </tr>
        <tr>
          <td valign="top"><hr size="1" noshade></td>
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
