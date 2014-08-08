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
	s_TpPrioridad = "A"
	s_TpUser_Para = CStr(Request("s_TpUser_Para"))
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	n_TpUser = Session("n_TpUser")
	n_CdAsigna = Session("s_CdAsigna")
	s_NmTpPrograma = Session("s_NmTpPrograma")
	n_CdTpPrograma = Session("n_CdTpPrograma")

	If n_NrRutProfe = 0 Then
	   response.redirect("http://www.uvm.cl")
    End If
	
s_StringEnvia = Request("s_StringEnvia")
	If s_StringEnvia <>  "" then
		n_CdCarrer = Separa(s_StringEnvia)
		's_NmCarrer = Separa(s_StringEnvia)
		n_NrParale = Separa(s_StringEnvia)
        s_NrMalla = Separa(s_StringEnvia)
        n_CdAsigna = Separa(s_StringEnvia)
        s_NmAsigna = Separa(s_StringEnvia)
		s_NmTpAsig = Separa(s_StringEnvia)
	    n_CdSede = Separa(s_StringEnvia)
       ' n_CdDepartamento = Separa(s_StringEnvia)
		's_NmSede = Separa(s_StringEnvia)	
		s_TpUser_Para = Separa(s_StringEnvia)
		s_Adjunto = Separa(s_StringEnvia)
	End If	
	
	If s_TpUser_Para = "G" Then
	   s_TpUser_Para = "P"
	End If


	
	Session.TimeOut = 10	
Set o = getComponent()

n_NrRut_De = n_NrRutProfe
n_TpUser_De = 2
n_CdTpPrograma = 1
n_CdDepartamento = 29
'n_NrParale = 1
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
          <td valign="top"> <div align="left"> 
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
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
&nbsp;&nbsp; </font></font>Fecha:<font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">
<% call response.write (d_FcSistema) %>
&nbsp;&nbsp; </font></font>Nombres:<font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><strong><font color="#0099CC">
<% call response.write (s_NmBrsProfe) %>
</font></strong></font></span> </td>
        </tr>
        <tr> 
          <td valign="top"><table width="395" border="0">
            <tr>
              <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif" class="txtitulo"><strong>Nuevo Mensaje 
              </strong></font></td>
              </tr>
            <tr>
              <td width="88"><span class="txsubtitulo">Asignatura:</span><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><strong></strong></font></font></td>
              <td width="297"><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><strong>
                <% Response.Write(s_NmAsigna) %>
              </strong></font></font></td>
            </tr>
            <tr>
              <td><span class="txsubtitulo">Paralelo:</span><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><strong> </strong></font></font></td>
              <td><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><strong>
                <% Response.Write(n_NrParale) %>
              </strong></font></font></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><strong>
              </strong></font></font></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
            <!--<a href="#"> </a>-->
<form name="form1" method="post" action="">
  <table width="560" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
    <tr bgcolor="#666666">
      <td colspan="2" class="texto"><div align="left">
          <input name="accion" type="submit" class="Submit" id="accion" value="Enviar" >
          <!--<a href="eliminar_eje.asp?s_StringAsig=<%'=n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede%>" onMouseOver="MM_swapImage('Image1','','../img/eliminar2.gif',1)" onMouseOut="MM_swapImgRestore()">          </a>--></div></td>
    </tr>
    <tr bgcolor="#666666">
      <td colspan="2" class="texto"><font color="#FFFFFF"><strong>Mensaje Nuevo </strong></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
       
      </font></td>
    </tr>
    <tr class="texto">
      <td>Asunto</td>
      <td><font color="#003399" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><span class="storytitle">
        <input name="Asunto" type="text" class="input" id="Asunto" value="<% =(s_Asunto) %>" size="51" maxlength="100">
        <input name="s_TpUser_Para" type="hidden" id="s_TpUser_Para" value="<%= (s_TpUser_Para) %>">
        <input name="n_NrParale" type="hidden" id="n_NrParale" value="<%= (n_NrParale) %>">
        <input name="n_CdCarrer" type="hidden" id="n_CdCarrer" value="<%= (n_CdCarrer) %>">
        <input name="n_CdAsigna" type="hidden" id="n_CdAsigna" value="<%= (n_CdAsigna) %>">
        <input name="n_CdSede" type="hidden" id="n_CdSede" value="<%= (n_CdSede) %>">
		<input name="s_NrMalla" type="hidden" id="s_NrMalla" value="<%= (s_NrMalla) %>">
</span></strong></font></td>
    </tr>
    <tr class="texto">
      <td>Detalle</td>
      <td><font color="#003399" size="2" face="Verdana, Arial, Helvetica, sans-serif">
        <textarea name="Detalle" cols="38" rows="6" wrap="VIRTUAL" class="input" id="Detalle" value="<% =(l_Detalle)%>"></textarea>
      </font></td>
    </tr>
    <tr class="texto">
      <td width="101"><div align="left">Fecha</div></td>
      <td width="449"><div align="left"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%Response.Write(d_Fecha_Envio)%></font></div></td>
    </tr>
    <tr class="texto">
      <td>Para</td>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><strong><font color="#003399">
                        <%	xml = o.Consulta_Lista_Curso_Grupo_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna, n_NrParale, n_CdTpPrograma, s_NrMalla, n_CdCarrer)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set LISTA = doc.selectNodes("//LISTA/CURSO")%>
        </font></strong></font><font color="#003399" size="1" face="Arial, Helvetica, sans-serif">
        	
        </strong></font><font size="1" face="Arial, Helvetica, sans-serif"><font color="#003399" size="1" face="Arial, Helvetica, sans-serif"><strong>
        	
        </strong></font></font><font color="#003399" size="1" face="Arial, Helvetica, sans-serif"><strong> </strong></font><font size="1" face="Arial, Helvetica, sans-serif"><font color="#003399" size="1" face="Arial, Helvetica, sans-serif"><strong>
        	
</strong></font></font></font>
        <table width="200" border="0">
          <tr>
            <td width="28" bordercolor="#999999" bgcolor="#FFFFFF" class="texto"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><img src="img/check.gif" width="12" height="12"></font></div></td>
            <td width="162" bordercolor="#999999" bgcolor="#FFFFFF" class="texto"><strong><font size="2" face="Arial, Helvetica, sans-serif">Alumno</font></strong></td>
          </tr>
		  <%set CURSO= LISTA.nextNode
		    while not (CURSO is nothing)%>
          <tr>
            <td bordercolor="#999999" class="texto"><div align="center">
                
				<% 
				 	's_CdAsistencia = valor(CLAVE,"s_CdAsistencia")
					id_campo = valor(CURSO,"s_NrRutAlu")																				
					if request("accion") = "Enviar" then					
						if request.Form(id_campo) = "enviar" then
							n_NrRutAlu = CDbl(valor(CURSO,"s_NrRutAlu"))
							n_NrRut_Para = n_NrRutAlu
							s_Asunto = Request.Form("Asunto")
							l_Detalle = Request.Form("Detalle")

							xml = o.Ingreso_Comunicado(n_NrAnoActivo, n_NrPerActivo, n_NrRut_De, n_TpUser_De, n_CdAsigna, n_NrParale, d_Fecha_Envio, s_Asunto, l_Detalle, s_TpUser_Para, n_NrRut_Para, s_TpPrioridad, n_CdTpPrograma, s_NrMalla, n_CdCarrer)
						end if									
					end if					
				%>
				<input type="checkbox" name="<%= id_campo%>" id="<%= id_campo%>" value= "enviar" >
				<!--<input name="alumno" type="checkbox" id="alumno" value="1">-->
				<!--<input <%'If (CStr(s_CdAsistencia) = CStr("PRESENTE")) Then Response.Write("checked") : Response.Write("")%>  name="<%'= id_campo%>" type="checkbox" id="<%'=id_campo%>" value="PRESENTE" >-->
            </div></td>
            <td bordercolor="#999999" class="texto"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">
			<%= valor(CURSO,"s_NmAlumno") %></font></td>
          </tr>
		  <%set CURSO= LISTA.nextnode
   			 wend
			 If request("accion") = "Enviar" then
				Response.Redirect("prof_bandeja_salida.asp?s_StringAsig"&"="&n_CdCarrer&"-"&n_NrParale&"-"&s_NrMalla&"-"&n_CdAsigna&"-"&s_NmAsigna)
			 End If %>
        </table>
	
		<font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color="#003399" size="1" face="Arial, Helvetica, sans-serif"><strong>        </strong></font></font></font></td>
    </tr>
  </table>
          <font color="#003399" size="2" face="Verdana, Arial, Helvetica, sans-serif">          </font>
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
<%Set o = Nothing
   Set doc = Nothing
   Set xml = Nothing   
   Set CURSO = Nothing
   Set LISTA = Nothing
  %>
</body>
</html>