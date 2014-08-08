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
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu()">
<%  Dim o, doc, xml, ASISTENCIA, CLAVE, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, d_FcAsistencia, s_StringAsig, s_CdCarrer,s_NrMalla, s_NrParale, s_CdAsigna, s_NmCarrer, s_NmAsigna, s_TpAsignatura, s_CdClave1, s_NmClave, s_HrsInicio, s_HrsTermino, n_NrOrigen, n_NrContador, Cadena, n_NrClave1, n_NrClave2, s_CdAsistencia, n_Sw, s_NrRutAluDv, s_NmAlumno, s_NrRutAlu, id_campo, s_NmError, n_NrError, s_NmCarreraAlu
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
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_NrParale = 0
	n_CdAsigna = 0
	n_CdCarrer = 0
	s_NmBrsProfe = ""
	d_FcSistema=#1-12-1999#
	d_FcAsistencia=#1-12-1999#
	s_StringAsig = ""
	s_NrMalla  = ""	
	s_NmCarrer = ""
	s_NmAsigna = ""
	s_NmError = ""
	s_CdClave1 = ""
	s_NmClave = ""
	s_HrsInicio = ""
	s_HrsTermino = ""
	n_NrOrigen = 1
	n_NrContador = 1
	Cadena = ""
	n_NrClave1 = 0
	n_NrClave2 = 0
	n_Sw = 0
	n_NrContador = 1
	s_CdAsistencia = ""
	s_NrRutAluDv = ""
	s_NrRutAlu = ""
	s_NmAlumno = ""
	s_NmError = ""
	n_NrError = 0
	s_NmCarreraAlu = ""
	n_NrAnoActivo = CInt(Session("n_NrAnoActivo"))
	'n_NrPerActivo = CInt(Session("n_NrPerActivo"))
	n_NrProceMapaes = Session("n_NrProceMapaes")
	If n_NrProceMapaes > 0 Then
		n_NrPerActivo = n_NrProceMapaes
	End If
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = CDbl(Session("n_NrRutProfe"))
	s_NmBrsProfe = Session("s_NmBrsProfe")	
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10	
	s_StringAsigIngMasivo = Request("s_StringAsig")
	If s_StringAsigIngMasivo <> "" Then
	    d_FcAsistencia = CDate(Separa(s_StringAsigIngMasivo, "*"))		
		n_CdAsigna = Separa(s_StringAsigIngMasivo, "*")
		s_NmAsigna = Separa(s_StringAsigIngMasivo, "*")
		s_TipoAsig = Separa(s_StringAsigIngMasivo, "*")
		n_NrParalelo = Separa(s_StringAsigIngMasivo, "*")
		n_CdCarrera = Separa(s_StringAsigIngMasivo, "*")
		s_NmCarrera = Separa(s_StringAsigIngMasivo, "*")
		s_CdClave1 = Separa(s_StringAsigIngMasivo, "*")
		s_NmClave = Separa(s_StringAsigIngMasivo, "*")
		s_HrsInicio = Separa(s_StringAsigIngMasivo, "*")
		s_HrsTermino = Separa(s_StringAsigIngMasivo, "*")
		s_CdClaveSepara = s_CdClave1
		n_NrClave1 = Separa(s_CdClaveSepara, "-")
		n_NrClave2 = Separa(s_CdClaveSepara, "-")
	End If
	Set o = getComponent()
	's_NmError = Request("s_NmError")
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
          <td width="160" valign="top"><table width="160" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><!--#include file="menu_docente.asp"--></td>
              </tr>
            </table></td>
          <td width="30" height="100%" valign="top"><img src="../img/arco.jpg" width="30" height="100%"></td>
        </tr>
      </table></td>
    <td width="570" valign="top"> 
      <table width="570" border="0" cellpadding="0" cellspacing="5">
	  <form method="post" enctype="application/x-www-form-urlencoded" name="form_ingreso" id="form_ingreso">
        <tr> 
          <td height="65" colspan="2" valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><img src="img/portaldocente.jpg" width="277" height="16"></td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto">Periodo:            </span>            <span class="respuesta"><strong>
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
&nbsp;&nbsp;</strong></span><span class="texto"> Fecha:</span>            <span class="respuesta"><strong>
<% call response.write (d_FcSistema) %>
&nbsp;</strong></span><span class="Estilo23">&nbsp; </span><span class="texto">Nombres:</span><span class="Estilo23"><strong class="respuesta">
<% call response.write (s_NmBrsProfe) %>
</strong></span> </td>
        </tr>
        <tr> 
          <td colspan="2" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="3" class="txtitulo">Ingreso de Asistencia </td>
              </tr>
            <tr>
              <td colspan="3"><font size="1" face="Verdana, Arial, Helvetica, sans-serif" class="respuesta"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><font size="3"><strong><font color="#0099CC">
                <% xml = o.Consulta_Lista_Asistencia(n_NrAnoActivo, n_NrPerActivo, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_CdCarrera, n_NrClave2, d_FcAsistencia, n_NrRutProfe)
				Set doc = Server.CreateObject ("MSXML.DomDocument")
				Call doc.loadxml (xml)
				set ASISTENCIA = doc.selectNodes("//ASISTENCIA/CLAVE")%>
              </font></strong></font></font></font><font color="#FF0000" size="2" face="Arial, Helvetica, sans-serif" class="respuesta">
              <% call response.write (s_NmError) %>
&nbsp;</font></td>
              </tr>
            <tr>
              <td colspan="3"><span class="texto">Asignatura</span><span class="Estilo9">:<span class="respuesta">
              <% Response.Write(s_NmAsigna)%>
                            </span></span><span class="texto">Tipo</span><span class="Estilo9">:<span class="respuesta">
              <% Response.Write(s_TipoAsig)%>
                                                                      </span></span><span class="texto">Paralelo</span><span class="Estilo9">:<span class="respuesta">
              <% Response.Write(n_NrParalelo)%>
                  </span></span></td>
              </tr>
            <tr>
              <td width="42%">&nbsp;</td>
              <td><span class="respuesta">
              </span></td>
              <td><span class="respuesta">
                <%Response.Write(d_FcAsistencia&" Clave: "&s_NmClave&" ("&s_HrsInicio&" hrs./"&s_HrsTermino&" hrs.)")%>
              </span></td>
            </tr>
            <tr>
              <td><input name="accion" type="submit" class="input" id="accion" value="Guardar"></td>
              <td width="22%"><input name="accion" type="submit" class="input" id="accion" value="Volver"></td>
              <td width="36%">
			  <%if request("accion") = "Volver" then
			  		'response.redirect("prof_asistencia_asig.asp")
					Response.Redirect("prof_asistencia_asig.asp?s_StringAsigCarrera"&"="&(n_CdAsigna)&"*"&(s_NmAsigna)&"*"&(s_TipoAsig)&"*"&(n_NrParalelo)&"*"&(n_CdCarrera)&"*"&(s_CdClave1)&"*"&(d_FcAsistencia))	
			    End If%></td>
            </tr>
          </table>
            <table width="560" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
              <tr bgcolor="#666666">
                <td colspan="5" class="texto"><font color="#FFFFFF"><strong>Asistencia</strong></font></td>
              </tr>
              <tr bgcolor="#CCCCCC" class="texto">
                <td width="27"><div align="center"><strong>N&ordm;</strong></div></td>
                <td width="88"><div align="center"><strong>Rut</strong></div></td>
                <td width="300"><div align="center"><strong>Nombre Alumno </strong></div></td>
                <td width="41">&nbsp;</td>
                <td width="82"><strong>Asistencia</strong></td>
                </tr>
				<% 
					set CLAVE= ASISTENCIA.nextNode
					while not (CLAVE is nothing)%>
              <tr class="texto">
                <td><div align="center" class="Estilo26">
                  <%response.write (n_NrContador&".- ")%>
                </div></td>
                <td><div align="left"><span class="Estilo23"><%= valor(CLAVE,"s_NrRutAluDv")%></span></div></td>
                <td><div align="center" class="Estilo26">
                  <div align="left"><strong><%= valor(CLAVE,"s_NmAlumno")&"  "%> </strong><%="("&valor(CLAVE,"s_NmCarreraAlu")&")"%></div>
                </div></td>
                <td><div align="center" class="Estilo26">
                  <% s_CdAsistencia = valor(CLAVE,"s_CdAsistencia")
					id_campo = valor(CLAVE,"s_NrRutAlu")																				
					if request("accion") = "Guardar" then					
						if request.Form(id_campo) = "PRESENTE" then
							s_CdAsistencia = "PRESENTE"
							n_NrRutAlu = CDbl(valor(CLAVE,"s_NrRutAlu"))
							n_CdCarrerAlu = CInt(valor(CLAVE,"s_CdCarrerAlu"))
							s_NrMallaAlu = valor(CLAVE,"s_NrMallaAlu")
							xml = o.Ingresa_Asistencia_Profesor(n_NrAnoActivo, n_NrPerActivo, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_CdCarrera, n_NrRutAlu, s_CdAsistencia, s_CdClave1, n_NrClave2, d_FcAsistencia, d_FcSistema, n_CdCarrerAlu, s_NrMallaAlu, n_NrRutProfe)
						Else
							s_CdAsistencia = "AUSENTE"
							n_NrRutAlu = CDbl(valor(CLAVE,"s_NrRutAlu"))
							n_CdCarrerAlu = CInt(valor(CLAVE,"s_CdCarrerAlu"))
							s_NrMallaAlu = valor(CLAVE,"s_NrMallaAlu")
							xml = o.Ingresa_Asistencia_Profesor(n_NrAnoActivo, n_NrPerActivo, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_CdCarrera, n_NrRutAlu, s_CdAsistencia, s_CdClave1, n_NrClave2, d_FcAsistencia, d_FcSistema, n_CdCarrerAlu, s_NrMallaAlu, n_NrRutProfe)
						end if									
					end if					
				%>
                  <input  name="<%= id_campo%>" type="checkbox" class="Estilo25" id="<%=id_campo%>" value="PRESENTE" <%If (CStr(s_CdAsistencia) = CStr("PRESENTE")) Then Response.Write("checked") : Response.Write("")%> >
                </div></td>
                <td><font class="Estilo27"><strong><%=Response.Write("("&n_NrContador&")")%></strong>
                    <%Response.Write(s_CdAsistencia)%>
                </font></td>
                </tr>
				<% set CLAVE= ASISTENCIA.nextnode
			  	 n_NrContador = n_NrContador + 1 %>
                 <% wend %>
            </table>
           </td>
        </tr>
        <tr>
          <td width="228" valign="top"><input name="accion" type="submit" class="input" id="accion" value="Guardar">
            <%
		  ' if request("accion") = "Guardar" then		
		  ' 		s_NmError = "Atención: Las notas se ingresarón en forma correcta"
				'response.redirect("prof_asistencia_ingreso_masivo.asp?s_StrError"&"="&s_NmError)
		   'End If%></td>
          <td width="327" valign="top"><input name="accion" type="submit" class="input" id="accion" value="Volver"></td>
        </tr>
        <tr>
          <td colspan="2" valign="top"><hr size="1" noshade></td>
        </tr>
		</form>
      </table></td>
    <td width="190" valign="top"></td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table>
<%set o = nothing
  set ASISTENCIA = nothing
  set CLAVE = nothing%>
</body>
</html>
