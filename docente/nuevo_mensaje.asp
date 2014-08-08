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

<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();MM_preloadImages('file:///C|/Inetpub/wwwroot/Intranet/cartapormail/img/home2.jpg')">
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
	
	'If n_NrRutProfe = 0 Then
	'   response.redirect("http://www.uvm.cl")
    'End If
	
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
		s_TpUser_Para = Separa(s_StringEnvia)
		s_NmCarrera = Separa(s_StringEnvia)
	End If	
	
	s_StringCarrera = Request("s_StringCarrera")
	If s_StringCarrera <>  "" then
		n_CdCarrera = Separa(s_StringCarrera)
		s_NmCarrera = Separa(s_StringCarrera)
	End If	

	Session.TimeOut = 10	
	Set o = getComponent()

n_NrRut_De = n_NrRutProfe
n_TpUser_De = 2
n_CdTpPrograma = 1
d_Fecha_Envio = date()

	If s_CdCarrera = ""  Then
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "5_2"
		idsession = Session.SessionID 'obtiene el número único de la session que entrega el servidor, no es modificable.
		var = INSTR (1, d_fecha, "/") 'busca el caracter especificado en la cadena
		var2 = INSTR (1, d_fecha, "-") 
		If var > 0 and var2 = 0 then
			fecha = REPLACE (d_fecha, "/", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena 
		End If
		If var2 > 0 and var = 0 then
			fecha = REPLACE (d_fecha, "-", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena
		End If
		'fin funcion de escaneo de fecha		
		'archivo= request.serverVariables("APPL_PHYSICAL_PATH") &"Portal_uvm\log\"&n_NrRutProfe&"_"&fecha&".txt" 'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
		'***** ESTE PATH ES PARA EL SERVER, EL DE ARRIBA ES PARA EL EQUIPO LOCAL ********
		archivo= request.serverVariables("APPL_PHYSICAL_PATH")&"log\"&n_NrAnoActivo&"_"&n_NrPerActivo&".txt"  'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
		set confile = createObject("scripting.filesystemobject") 
		set fich = confile.OpenTextFile(archivo,8,1) 'el 8 quiere decir va a ingresar otro registro y no modifica el existente y el 1 es por si no existe el archivo txt lo crea
		fich.WriteBlankLines(1)  'da un salto de linea (1)... puede ser (1), (2), etc.
		fich.write(s_opcion&"	"&n_modulo&"	"&n_NrRutProfe&"	"&fecha&"	"&h_hora&"	"&idsession)'escribe el archivo según parametros entregados
		fich.close() 'se cierra el archivo
		'********  FIN FUNCION  *****************
	End If

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
                  <td><p><img src="img/portaldocente.jpg" width="277" height="16"></p>
                  </td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','file:///C|/Inetpub/wwwroot/Intranet/cartapormail/img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto">Periodo:</span> <span class="respuesta"> <strong>
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
&nbsp;</strong>&nbsp; </span><span class="texto">Fecha:</span><span class="respuesta Estilo2">
<% call response.write (d_FcSistema) %>
&nbsp;</span><span class="texto"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC"></font></font></strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">&nbsp; </font></font>Nombres:</span><span class="respuesta"><strong>
<% call response.write (s_NmBrsProfe) %>
</strong></span>          </td>
        </tr>
        <tr> 
          <td valign="top"><form name="form2" method="post" action="carta_egresados.asp">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#999999">
                <tr> 
                  <td colspan="2" class="texto"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td colspan="2"><strong class="txtitulo"><font size="2" face="Arial, Helvetica, sans-serif">Carta Alumnos Egresados  
                          </font></strong></td>
                      </tr>
                      <tr>
                        <td colspan="2"><strong><font size="2" face="Arial, Helvetica, sans-serif">
                          <%
						   xml = o.Consulta_Carrera()
						   Set doc = Server.CreateObject ("MSXML.DomDocument")
						   Call doc.loadxml (xml)
						   set CARRERA = doc.selectNodes("//CARRERA/LIST_CARRERA")%>
                          <select name="carrera" class="SELECT" id="carrera" onChange="MM_jumpMenu('parent',this,0)">
                            <option value="0" selected>Elija Carrera</option>
                            <%set LIST_CARRERA = CARRERA.nextNode
							while not (LIST_CARRERA is nothing)%>
                            <option value="nuevo_mensaje.asp?s_StringCarrera=<%= CInt(valor(LIST_CARRERA,"s_CdCarrera"))&"*"&valor(LIST_CARRERA,"s_NmCarrera")%>"<%If (Not isNull((n_CdCarrera))) Then If (valor(LIST_CARRERA,"s_CdCarrera") = CStr((n_CdCarrera))) Then Response.Write("SELECTED") : Response.Write("")%>> <%= valor(LIST_CARRERA,"s_NmCarrera")%> </option>
                            <% set LIST_CARRERA = CARRERA.nextnode
                             wend %>
                          </select>
                        </font><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></strong></td>
                      </tr>
                      <tr> 
                        <td width="88"><span class="texto"></span></td>
                        <td width="297" class="respuesta"><strong> 
                          </strong></td>
                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                        <td class="respuesta"><strong> 
                          </strong></td>
                      </tr>
                    </table></td>
                </tr>
                <tr bgcolor="#666666"> 
                  <td colspan="2" class="texto"><font color="#FFFFFF"><strong>Nueva 
                    Carta </strong></font></td>
                </tr>
                <tr class="texto"> 
                  <td width="101"><div align="left">Fecha</div></td>
                  <td width="449" class="respuesta"><div align="left"> 
                      <%Response.Write(d_Fecha_Envio)%>
                      <%=(n_CdCarrer)%></div></td>
                </tr>
                <tr class="texto"> 
                  <td>Enviado a </td>
                  <td><font color="#003399" size="2" face="Arial, Helvetica, sans-serif"> 
                    <!--<select name="select" class="Submit" id="select" onChange="MM_jumpMenu('parent',this,0)">
                      <option value="nuevo_mensaje.asp?s_StringEnvia=<%'=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&s_TpUser_Para&"*"&s_Adjunto%>" selected>Elija 
                      Enviado a</option>
                      <!--X CURSO
                      <option value="nuevo_mensaje.asp?s_StringEnvia=<%'=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&"A"&"*"&s_Adjunto%>">Asignatura</option>
                      X ALUM-->
                      <!--<option value="nuevo_mensaje.asp?s_StringEnvia=<%'=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&"P"&"*"&s_Adjunto%>">Por 
                      Alumno</option>-->
                      <!--X GRUPO
                      <option value="nuevo_mensaje_grupo.asp?s_StringEnvia=<%'=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&"G"&"*"&s_Adjunto%>">Por 
                      Grupo</option>
                    </select>-->
					<select name="select" class="SELECT" id="select" onChange="MM_jumpMenu('parent',this,0)">
                      <option value="nuevo_mensaje.asp?s_StringEnvia=<%=n_CdCarrera&"*"&s_TpUser_Para&"*"&s_NmCarrera%>" selected>Elija 
                      Enviado a</option>
                      <!--X CURSO-->
                      <option value="nuevo_mensaje.asp?s_StringEnvia=<%=n_CdCarrera&"*"&"A"&"*"&s_NmCarrera%>">Asignatura</option>
                      <!--X ALUM-->
                      <option value="nuevo_mensaje.asp?s_StringEnvia=<%=n_CdCarrera&"*"&"P"&"*"&s_NmCarrera%>">Por Alumno</option>
                      <!--X GRUPO-->
                      <!--<option value="nuevo_mensaje_grupo.asp?s_StringEnvia=<%'=n_CdCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_NmTpAsig&"*"&n_CdSede&"*"&"G"&"*"&s_Adjunto%>">Por 
                      Grupo</option>-->
                    </select>
</font><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size="2" face="Arial, Helvetica, sans-serif">
<input name="s_TpUser_Para" type="hidden" id="s_TpUser_Para" value="<%=s_TpUser_Para%>">
</font></font></font><font color="#003399" size="2" face="Arial, Helvetica, sans-serif">&nbsp;                    </font></td>
                </tr>
                <tr class="texto"> 
                  <td>Para</td>
                  <td class="respuesta">
                    <% 'COMUNICADO POR ASIGANTURA, A TODOS LOS ALUMNOS 
		   If s_TpUser_Para = "A" then
			   Response.Write(s_NmCarrera)
		   Else
		   'COMUNICADO POR ALUMNO, SE SELECCIONA UN ALUMNO
		      If s_TpUser_Para = "P" then
				   xml = o.Consulta_Curso(n_CdCarrera)								   
				   Set doc = Server.CreateObject ("MSXML.DomDocument")
				   Call doc.loadxml (xml)							   
				   set LISTA = doc.selectNodes("//LISTA/CURSO")%>
                    <select name="AluSelec" size="12" class="input" id="AluSelec" select>
                      <% set CURSO= LISTA.nextNode
					   while not (CURSO is nothing)%>
                      <option value="<%= valor(CURSO,"s_NrRutAlu")%>" <%If (Not isNull(n_NrRut_Para)) Then If (valor(CURSO,"s_NrRutAlu") = CStr(n_NrRut_Para)) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(CURSO,"s_NmAlumno") %></option>
                      <%set CURSO= LISTA.nextnode
   					   wend%>
                    </select>
                    <%End If%>
                    <%End If%>
<input name="s_NmCarrera" type="hidden" id="s_NmCarrera" value="<%=s_NmCarrera%>">
</td>
                </tr>
                <tr class="texto"> 
                  <td colspan="2"><p><font size="2" face="Arial, Helvetica, sans-serif"><strong>Estimado(a) 
                      <br>
                      <%response.write (s_NmNombrs&" "&s_NmApePat&" "&s_NmApeMat)%>
                      </strong> </font></p>
                    <p align="justify"> 
                      <textarea name="parr1" cols="70" rows="4" class="input" id="parr1"></textarea>
                    </p>
                    <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"> 
                      <textarea name="parr2" cols="70" rows="4" class="input" id="parr2"></textarea>
                      </font></p>
                    <p align="justify"> 
                      <textarea name="parr3" cols="70" rows="4" class="input" id="parr3"></textarea>
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
                <tr class="texto">
                  <td colspan="2"><div align="center">
                      <input name="accion" type="submit" class="Submit" id="accion" value="Mostrar" >
                    </div></td>
                </tr>
              </table>
            </form></td>
        </tr>
        <tr>
          <td valign="top"> <div align="center"> </tr>
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

