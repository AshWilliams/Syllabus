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
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length){
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
<%  Dim o, doc, n_NrSw, n_Nrcontador, n_CdNivelEmpresa, n_NvNivelEmpresa, s_StringMaestro
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
		separa = salida
	End function
	function Valor(nodo,etiqueta)
       valor = nodo.selectSingleNode(etiqueta).text
    end function
	n_CdNivelEmpresa=0
	n_NvNivelEmpresa=0
	n_NrSw=0
	s_StringMaestro=""
	s_NvNmNivelEmpresa=""
	Session.TimeOut = 30
	'n_NrRutCoor = Request("n_NrRutCoor")
	'n_NrRutCoor = Session("n_NrRut")
	'If n_NrRutCoor = 0 Then 
    '   Response.Redirect("index.htm") 
    'End If 
	
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	
	s_StringMaestro=Request("s_StringMaestro")
	If s_StringMaestro <> "" Then
		n_NrRutCoor = Separa(s_StringMaestro)
		n_NvNivelEmpresa = Separa(s_StringMaestro)
		s_NvNmNivelEmpresa = Separa(s_StringMaestro)
	End If
	
	Set o = getComponent()
	
	s_CdCarrera = CStr(request("s_CdCarrera"))
	If s_CdCarrera <> "" Then
	    n_CdCarrera = 0
		s_NmCarrera = ""
		n_CdCarrera = CInt(Separa(s_CdCarrera))
		s_NmCarrera = CStr(Separa(s_CdCarrera))
	End If
	
	If s_CdCarrera = ""  Then
		n_NrRutProfe = Session("n_NrRutProfe")
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "5_1"
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
  <tr> 
    <td colspan="2"><!--#include file="headerdocente.asp"--></td>
  </tr>
  <tr> 
    <td height="10" colspan="2" bgcolor="#990000" class="fondo4"> <div><img src="../img/rojo.jpg" width="10" height="10"></div></td>
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
    <td width="760" valign="top"> 
      <table width="760" border="0" cellpadding="0" cellspacing="5">
        <tr> 
          <td valign="top"> <div align="left"> </div>
            <table width="560" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td valign="top"><img src="img/portaldocente.jpg" width="277" height="16"></td>
                <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image51" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image51','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
              </tr>
            </table>
            <hr size="1" noshade> </td>
        </tr>
        <tr> 
          <td valign="top"><span class="txtitulo">Titulados por carreras </span><br> 
            <span class="txsubtitulo">Consulta</span><br> <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                  <%
						   xml = o.Consulta_Carrera()
						   Set doc = Server.CreateObject ("MSXML.DomDocument")
						   Call doc.loadxml (xml)
						   set CARRERA = doc.selectNodes("//CARRERA/LIST_CARRERA")%>
                </font>
                  <select name="carrera" class="SELECT" id="carrera" onChange="MM_jumpMenu('parent',this,0)">
                    <option value=0 selected>Elija Carrera</option>
                    <%set LIST_CARRERA = CARRERA.nextNode
							while not (LIST_CARRERA is nothing)%>
                    <option value="titulado_carrera.asp?s_CdCarrera=<%= CStr(valor(LIST_CARRERA,"s_CdCarrera"))&"*"&(valor(LIST_CARRERA,"s_NmCarrera"))%>"<%If (Not isNull((n_CdCarrera))) Then If (valor(LIST_CARRERA,"s_CdCarrera") = CStr((n_CdCarrera))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(LIST_CARRERA,"s_NmCarrera")%></option>
                    <% set LIST_CARRERA = CARRERA.nextnode
                             wend %>
                  </select>                </td>
              </tr>
            </table>
            <strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
            </font></strong>            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                  <% 
                          xml = o.Consulta_Alumno(n_CdCarrera, n_NrCont, n_NrContActualizados) 
                          Set doc = Server.CreateObject ("MSXML.DomDocument")
                          Call doc.loadxml (xml)
                          set ALUMNO = doc.selectNodes("//ALUMNO/LIST_ALUMNO") 
                          %>
                </font></strong></td>
              </tr>
              <tr>
                <td><span class="homearea"><strong>N° de Titulados:</strong></span><strong>&nbsp;&nbsp;</strong><span class="respuesta"><%=(n_NrCont)%> </span></td>
              </tr>
              <tr>
                <td><span class="homearea">N° de Actualizados:&nbsp;</span><span class="respuesta">&nbsp;<%=(n_NrContActualizados)%></span></td>
              </tr>
            </table>
            <table width="750" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
              <tr bgcolor="#666666"> 
                <td colspan="9" class="texto"><font color="#FFFFFF"><strong>Titulados por Carreras </strong></font></td>
              </tr>
              <tr bgcolor="#CCCCCC" class="texto"> 
                <td> <div align="center"><strong>N&deg;<font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                </font></strong></div></td>
                <td><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">                </font>Nombre</strong></td>
                <td> <div align="center"><strong>Rut</strong></div></td>
                <td> <div align="center"><strong>Correo</strong></div></td>
                <td> <div align="center"><strong>Fono</strong></div></td>
                <td><strong>Direcci&oacute;n</strong></td>
                <td><strong>Empresa</strong></td>
                <td><strong>Fc Act. </strong></td>
                <td><strong>Post-Grado</strong></td>
              </tr>
			  <%n_NrSw=0
					    n_NrContador=1
						set LIST_ALUMNO= ALUMNO.nextNode
						while not (LIST_ALUMNO is nothing)
%>
              <tr class="texto"> 
                <td><div align="center"><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                  <%response.write (n_NrContador)%>
                </font></span></div></td>
                <td><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                 <%response.write(valor(LIST_ALUMNO,"s_NmNombres"))%>
                </font></span></td>
                <td><div align="right"></div>
                  <div align="right"><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                    <%response.write (valor(LIST_ALUMNO,"s_NrRutAlu"))%>
                  </font></span></div></td>
                <td><div align="center"><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_ALUMNO,"s_NmEmail"))%>
                </font></span></div></td>
                <td><div align="center"><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_ALUMNO,"s_NrFono"))%>
                </font></span></div></td>
                <td><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_ALUMNO,"s_DrEstudi"))%>&nbsp;
                </font></span></td>
                <td><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_ALUMNO,"s_NmEmpresa"))%>&nbsp;
                </font></span></td>
                <td><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_ALUMNO,"s_FecRegistro"))%>&nbsp;
                </font></span></td>
                <td><span class="Estilo4"><font size="1" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_ALUMNO,"s_NmPostgrado"))%>&nbsp;
                </font></span></td>
              </tr>
			  <% set LIST_ALUMNO= ALUMNO.nextNode
						   n_NrContador = n_NrContador + 1
                           wend %>
		    </table>
          </td>
        </tr>
      </table> </td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table>
</body>
</html>
