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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
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
	d_FcSistema=#12-1-1999#
	s_StringAsig = ""
	n_TpUser = 0
	s_CdCarrer = ""
	s_NrMalla  = ""
	s_NrParale = ""
	s_CdAsigna = ""
	s_NmCarrer = ""
	s_TpUser_Para = ""
	s_Prioridad_Alta = ""
	s_Asunto = ""
	l_Detalle = ""
	s_NrRutAlu = ""
	n_NrRut_Para = 0
	s_NmAlumno = ""
	l_Detalle = ""
	s_Adjunto=""
	s_Direccion=""
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	n_TpUser = Session("n_TpUser")
	s_CdAsigna = Session("s_CdAsigna")
	s_NmTpPrograma = Session("s_NmTpPrograma")
	n_CdTpPrograma = Session("n_CdTpPrograma")
	
	If n_NrRutProfe = 0 Then
	   response.redirect("http://www.uvm.cl")
    End If
	
	s_StringAsig = Request("s_StringAsig")
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
		s_NmTpAsig = Separa(s_StringAsig)
	End If	
	
	s_StringEnvia = Request("s_StringEnvia")
	If s_StringEnvia <>  "" then
		n_CdCarrera = Separa(s_StringEnvia)
		n_NrParalelo = Separa(s_StringEnvia)
        s_NrMalla = Separa(s_StringEnvia)
        n_CdAsigna = Separa(s_StringEnvia)
        s_NmAsigna = Separa(s_StringEnvia)
		s_TipoAsig = Separa(s_StringEnvia)
	    n_CdSede = Separa(s_StringEnvia)
		s_TpUser_Para = Separa(s_StringEnvia)
		s_Adjunto = Separa(s_StringEnvia)
		n_NrParale = n_NrParalelo
		n_CdCarrer = n_CdCarrera
	End If	

	Session.TimeOut = 10	
	Set o = getComponent()

n_NrRut_De = n_NrRutProfe
n_TpUser_De = 2
n_CdTpPrograma = 1
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
    <td width="570" valign="top"> <table width="570" border="0" cellpadding="0" cellspacing="5">
        <tr> 
          <td valign="top"><div align="left">
            <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><img src="img/portaldocente.jpg" width="277" height="16"><span class="txsubtitulo"><br>
                  </span> </td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto">Periodo:<font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#0099CC">
            </font></font></span><span class="respuesta">
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
            </span><span class="Estilo3"><font color="#000000" size="2"><font color="#0099CC">            </font></font> </span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#0099CC">&nbsp;&nbsp; </font></font>Fecha:<font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">
</font></font></span><span class="respuesta">
<% call response.write (d_FcSistema) %>
</span><span class="Estilo3"><font color="#000000" size="2"><font color="#3399CC"></font></font></span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">&nbsp;&nbsp; </font></font>Nombres:</span><span class="respuesta"><strong>
<% call response.write (s_NmBrsProfe) %>
</strong></span><span class="texto"></span> </td>
        </tr>
        <tr> 
          <td valign="top"><table width="395" border="0">
            <tr>
              <td colspan="2"><strong><a href="prof_bandeja_salida.asp">Comunicados</a> <span class="txtitulo">&gt; Nuevo Mensaje </span></strong></td>
              </tr>
            <tr>
              <td width="88"><span class="texto"><strong>Asignatura:</strong></span></td>
              <td width="297" class="respuesta"><strong>
                <% Response.Write(s_NmAsigna) %>
              </strong></td>
            </tr>
            <tr>
              <td><span class="texto"><strong>Paralelo:</strong></span> </td>
              <td class="respuesta"><strong>
                <% Response.Write(n_NrParale) %>
              </strong></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
            <form action="prof_Nuevo_Mensaje_eje.asp" method="post" name="form1">
              <table width="560" border="1" cellpadding="2" cellspacing="0" bordercolor="#999999">
    <tr bgcolor="#666666">
      <td colspan="2" class="texto"><div align="left">
          <input name="accion" type="submit" class="Submit" id="accion" value="Enviar" >
          <a href="eliminar_eje.asp?s_StringAsig=<%=n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede%>" onMouseOver="MM_swapImage('Image1','','../img/eliminar2.gif',1)" onMouseOut="MM_swapImgRestore()"></a>
          <input name="accion" type="submit" class="Submit" id="accion" value="Cancelar">          
          <input name="accion" type="submit" class="Submit" id="accion" value="Limpiar">
      </div></td>
    </tr>
    <tr bgcolor="#666666">
      <td colspan="2" class="texto"><font color="#FFFFFF"><strong>Mensaje Nuevo </strong></font></td>
    </tr>
    <tr class="texto">
      <td width="101"><div align="left">Fecha</div></td>
      <td width="449"><div align="left"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%Response.Write(d_Fecha_Envio)%><%=(n_CdCarrer)%></font></div></td>
    </tr>
    <tr class="texto">
      <td>Enviado a </td>
      <td><font color="#003399" size="2" face="Arial, Helvetica, sans-serif">
        <select name="select" class="Submit" id="select" onChange="MM_jumpMenu('parent',this,0)">
          		<option value="prof_nuevo_mensaje.asp?s_StringEnvia=<%=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&s_TpUser_Para&"*"&s_Adjunto%>" selected>Elija Enviado a</option>
<!--X CURSO-->  <option value="prof_nuevo_mensaje.asp?s_StringEnvia=<%=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&"A"&"*"&s_Adjunto%>">Asignatura</option>
<!--X ALUM-->   <option value="prof_nuevo_mensaje.asp?s_StringEnvia=<%=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&"P"&"*"&s_Adjunto%>">Por Alumno</option>
<!--X GRUPO-->	<option value="prof_nuevo_mensaje_grupo.asp?s_StringEnvia=<%=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&"G"&"*"&s_Adjunto%>">Por Grupo</option>
        </select>
      </font></td>
    </tr>
    <tr class="texto">
      <td>Para</td>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><strong><font color="#003399">
        <% 'COMUNICADO POR ASIGANTURA, A TODOS LOS ALUMNOS 
		   If s_TpUser_Para = "A" then
			   Response.Write(s_NmAsigna)
		   Else
		   'COMUNICADO POR ALUMNO, SE SELECCIONA UN ALUMNO
		      If s_TpUser_Para = "P" then
				   xml = o.Consulta_Curso_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_CdCarrera)								   
				   Set doc = Server.CreateObject ("MSXML.DomDocument")
				   Call doc.loadxml (xml)							   
				   set LISTA = doc.selectNodes("//LISTA/CURSO")%>
        </font></strong></font><font color="#003399" size="1" face="Arial, Helvetica, sans-serif">
        
		<select name="AluSelec" size="12" class="Submit" id="AluSelec" select>
          			<% set CURSO= LISTA.nextNode
					   while not (CURSO is nothing)%>
        <option value="<%= valor(CURSO,"s_NrRutAlu")%>" <%If (Not isNull(n_NrRut_Para)) Then If (valor(CURSO,"s_NrRutAlu") = CStr(n_NrRut_Para)) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(CURSO,"s_NmAlumno") %></option>
          			<%set CURSO= LISTA.nextnode
   					   wend%>
        </select>
		
        </strong></font><font size="1" face="Arial, Helvetica, sans-serif"><font color="#003399" size="1" face="Arial, Helvetica, sans-serif"><strong>
        	<%End If%>
        </strong></font></font><font color="#003399" size="1" face="Arial, Helvetica, sans-serif"><strong> </strong></font><font size="1" face="Arial, Helvetica, sans-serif"><font color="#003399" size="1" face="Arial, Helvetica, sans-serif"><strong>
        	<%End If%>
			
      </strong></font></font></font></td>
    </tr>
    <tr class="texto">
      <td>Asunto</td>
      <td><font color="#003399" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><span class="storytitle">
        <input name="Asunto" type="text" class="input" id="Asunto" value="<% =(s_Asunto) %>" size="80" maxlength="100">
      </span></strong></font></td>
    </tr>
    <tr class="texto">
      <td height="122">Detalle</td>
      <td><font color="#003399" size="2" face="Verdana, Arial, Helvetica, sans-serif">
        <textarea name="Detalle" cols="80" rows="6" wrap="VIRTUAL" class="input" id="Detalle" value="<% =(l_Detalle)%>"></textarea>
      </font></td>
	  <input name="n_CdCarrer" type="hidden" id="n_CdCarrer" value="<%= (n_CdCarrer) %>">
      <input name="s_NmCarrer" type="hidden" id="s_NmCarrer" value="<%= (s_NmCarrer) %>">
      <input name="s_NrMalla" type="hidden" id="s_NrMalla" value="<%= (s_NrMalla) %>">
      <input name="n_NrParale" type="hidden" id="s_NrParale" value="<%= (n_NrParale) %>">
      <input name="n_CdAsigna" type="hidden" id="n_CdAsigna" value="<%= (n_CdAsigna) %>">
      <input name="s_NmAsigna" type="hidden" id="s_NmAsigna" value="<%= (s_NmAsigna) %>">
      <input name="s_TpUser_Para" type="hidden" id="s_TpUser_Para" value="<%= (s_TpUser_Para) %>">
	  <input name="n_CdSede" type="hidden" id="n_CdSede" value="<%= (n_CdSede) %>">
	  <input name="n_CdDepartamento" type="hidden" id="n_CdDepartemento" value="<%= (n_CdDepartamento) %>">
	  <input name="s_NmSede" type="hidden" id="s_NmSede" value="<%= (s_NmSede) %>">
	  <input name="Adjunto" type="hidden" id="Adjunto" value="<%= (s_Adjunto) %>">
								  
    </tr>
  </table>
            <br>
            </form></td>
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
<%Set o = Nothing
   Set doc = Nothing
   Set xml = Nothing   
   Set CURSO = Nothing
   Set LISTA = Nothing
  %>
</body>
</html>

