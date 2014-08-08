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

<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega2();return false;">
<%  Dim o, doc, xml, ASIGNATURAS, LISTAASIGNATURAS, CURSO, LISTA, BANDEJA, ENTRADA, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer,s_NrMalla, s_NrParale, s_CdAsigna, s_NmCarrer, n_NrError, n_NrCorrelativo, n_Sw, id_campo, s_FcEnvio, s_NrCorrelativo, s_TpUser_De, n_TpUser_De, s_MarcadoLeido, s_NmTpUser_De, s_NmCompleto, s_Asunto, s_NmTpPrograma, n_CdTpPrograma
	Response.CacheControl = "no-cache"
	Function Separa(s)
		dim text
		text = s
		pos = 0
		pos = InStr(text,"-")
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
	n_CdCarrer = 0
	n_NrParale = 0
	n_CdSede = 0
	n_CdAsigna  = 0
	n_CdDepartamento = 0
	s_NmBrsProfe = ""
	d_FcSistema=#12-1-1999#
	s_StringAsig = ""
	s_CdCarrer = ""
	s_NrMalla  = ""
    s_NrParale = ""
	s_CdAsigna = ""
	s_NmCarrer = ""
	s_TpUser_Para=""
	n_NrError = 0
	n_NrCorrelativo = 0
	n_Sw=0
	s_FcEnvio = ""
	s_NrCorrelativo = ""
	s_TpUser_De = ""
	n_TpUser_De = 0
	s_MarcadoLeido = 0
	s_NmTpUser_De = ""
	s_NmCompleto = ""
	s_Asunto = ""
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	s_StringAsig = Request("s_StringAsig")
	s_NmTpPrograma = Session("s_NmTpPrograma")
	n_CdTpPrograma = Session("n_CdTpPrograma")	
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	s_StringAsig = request("s_StringAsig")
	If s_StringAsig <>  "" then
            n_CdCarrer = Separa(s_StringAsig)
			n_NrParale = Separa(s_StringAsig)
            s_NrMalla = Separa(s_StringAsig)
            n_CdAsigna = Separa(s_StringAsig)
			s_NmAsigna = Separa(s_StringAsig)
			s_NmTpAsig = Separa(s_StringAsig)
	End If	
	n_NrRut_De = n_NrRutProfe
	n_TpUser_De = 2
	n_CdTpPrograma = 1
							
	Set o = getComponent() 
	
n_NrCorrelativo = 0
n_NrContador=1

If s_StringAsig = ""  Then
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "2_1"
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
	<form name="form1" method="post" action="">
        <tr> 
          <td valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><img src="img/portaldocente.jpg" width="277" height="16"><span class="txsubtitulo"><br>
                    </span> 
				  </td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto"><span class="respuesta"><strong>Selecciona una Asignatura</strong></span><br>
            <%xml = o.Consulta_Lista_Asignaturas_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set ASIGNATURAS = doc.selectNodes("//ASIGNATURAS/LISTAASIGNATURAS")%>

            <select name="AsigSeleccionada" class="SELECT" id="AsigSeleccionada" onChange="MM_jumpMenu('parent',this,0)" select>
              <option value="prof_bandeja_salida.asp" selected>Mis Asignaturas</option>
              <% set LISTAASIGNATURAS= ASIGNATURAS.nextNode %>
              <% while not (LISTAASIGNATURAS is nothing) %>
              <option value="prof_bandeja_salida.asp?s_StringAsig=<%=valor(LISTAASIGNATURAS,"s_CdCarrer")&"-"&valor(LISTAASIGNATURAS,"s_NrParale")&"-"&valor(LISTAASIGNATURAS,"s_NrMalla")&"-"&valor(LISTAASIGNATURAS,"s_CdAsigna")&"-"&valor(LISTAASIGNATURAS,"s_NmAsigna")&"-"&valor(LISTAASIGNATURAS,"s_NmTpAsig")%>" <%If (Not isNull((n_CdAsigna))) Then If (valor(LISTAASIGNATURAS,"s_CdAsigna") = CStr((n_CdAsigna))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(LISTAASIGNATURAS,"s_CdAsigna") %>&nbsp;&nbsp;&nbsp;<%= valor(LISTAASIGNATURAS,"s_NmAsigna") %></option>
              <% set LISTAASIGNATURAS= ASIGNATURAS.nextnode %>
              <% wend %>
            </select>
            <br>
            Periodo:</span>            <span class="respuesta">
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
            &nbsp;</span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#0099CC">&nbsp; </font></font>Fecha:</span>
            <span class="respuesta">
            <% call response.write (d_FcSistema) %>
&nbsp;&nbsp; </span><span class="texto">Nombres:<strong class="respuesta">
<% call response.write (s_NmBrsProfe) %>
</strong></span> </td>
        </tr>
        <tr> 
          <td valign="top">
                        <table width="395" border="0">
                          <tr>
                            <td colspan="2" class="texto"><strong class="txtitulo">Comunicados
                            </strong></td>
                          </tr>
                          <tr>
                            <td width="88" class="texto"><strong>Asignatura:</strong></td>
                            <td width="297" class="respuesta"><strong>
                              <% Response.Write(s_NmAsigna) %>
                            </strong></td>
                          </tr>
                          <tr>
                            <td class="texto"><strong>Paralelo: </strong></td>
                            <td class="respuesta"><strong>
                            <% Response.Write(n_NrParale) %>
                            </strong></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
            </table>
                        
              <table width="560" border="1" cellpadding="2" cellspacing="0" bordercolor="#999999">
                <tr bgcolor="#666666">
                  <td colspan="5" class="texto"><div align="left">
                      <input name="accion" type="submit" class="Submit" id="accion" value="Nuevo Mensaje" >
                      <!--<a href="eliminar_eje.asp?s_StringAsig=<%'=n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede%>" onMouseOver="MM_swapImage('Image1','','../img/eliminar2.gif',1)" onMouseOut="MM_swapImgRestore()">-->
                      <input name="accion" type="submit" class="Submit" id="accion" value="Eliminar Mensaje">
                      </a>
                      
                     
                  </div></td>
                </tr>
                <tr bgcolor="#666666">
                  <td colspan="5" class="texto"><font color="#FFFFFF"><strong>Comunicados Enviados </strong></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                    <%				
					xml = o.Consulta_Bandeja_Salida(n_NrAnoActivo, n_NrPerActivo, n_NrRut_De, n_TpUser_De, n_CdAsigna, n_NrParale, n_CdTpPrograma, s_NrMalla)
					Set doc = Server.CreateObject ("MSXML.DomDocument")
					Call doc.loadxml (xml)
					set BANDEJA = doc.selectNodes("//BANDEJA/SALIDA")
						%>
                  </font></td>
                </tr>
                <tr bgcolor="#CCCCCC" class="texto">
                  <td width="27"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif"><img src="img/check.gif" width="12" height="12"></font></div></td>
                  <td width="23"><div align="center"><strong>N&ordm;</strong></div></td>
                  <td width="186"><div align="center"></div><div align="center"><strong>Nombre</strong></div></td>
                  <td width="221"><div align="center"><strong>Comunicado</strong></div></td>
                  <td width="81"><div align="center"><strong>Fecha</strong></div></td>
                </tr>
				 <%set SALIDA= BANDEJA.nextNode
						while not (SALIDA is nothing)%>
						
                      <%id_campo = valor(SALIDA,"s_FcEnvio")&(valor(SALIDA,"s_NrCorrelativo"))
						
						if Request.Form("accion") = "Eliminar Mensaje" then					
							if request.Form(id_campo) = "ELIMINAR" then
								n_NrCorrelativo = CInt(valor(SALIDA,"s_NrCorrelativo"))
								d_FcSistema = date()
								xml = o.Eliminar_Bandeja_Salida(n_NrAnoActivo, n_NrPerActivo, n_NrRut_De, n_CdAsigna, n_NrParale, n_NrCorrelativo, n_CdTpPrograma, s_NrMalla, d_FcSistema)
							End If
						End if%>
                <tr class="texto">
                  <td><div align="center">
                      <input type="checkbox" name="<%= id_campo%>" id="<%= id_campo%>" value="ELIMINAR">
                  </div></td>
                  <td><div align="center">
                      <%response.write (n_NrContador&".- ")%>
                  </div></td>
                  <td><div align="left">
                  </div>                    <div align="left">
                      <%= valor(SALIDA,"s_NmCompleto")%>
                  </div></td>
                  <td><div align="center"><a href="prof_detalle_bandeja_salida.asp?s_StringAsig=<%=n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede&"*"&CInt(valor(SALIDA,"s_NrCorrelativo"))%>"><strong>
                      <%= valor(SALIDA,"s_Asunto")%>
                  </strong></a></div></td>
                  <td>
                    <div align="center"><%= valor(SALIDA,"s_FcEnvio")%>
                    </div></td>
                </tr>
				     <%set SALIDA= BANDEJA.nextnode
						    n_NrContador = n_NrContador + 1
                            wend 
							If request("accion") = "Eliminar Mensaje" then
								Response.Redirect("prof_bandeja_salida.asp?s_StringAsig"&"="&n_CdCarrer&"-"&n_NrParale&"-"&s_NrMalla&"-"&n_CdAsigna&"-"&s_NmAsigna)
							End If %>  
<%If request("accion") = "Nuevo Mensaje" then
	Response.Redirect("prof_nuevo_mensaje.asp?s_StringAsig"&"="&n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParale&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&n_CdSede&"*"&n_CdDepartamento&"*"&s_NmSede&"*"&s_NmTpAsig)
End If%>

              </table>
			  <%'End If%>
              <br>            
          </td>
        </tr>
        <tr>
          <td valign="top"><hr size="1" noshade></td>
        </tr>
		</form>
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
   Set ASIGNATURAS = Nothing
   Set LISTAASIGNATURAS = Nothing
   Set CURSO = Nothing
   Set LISTA = Nothing
   Set SALIDA = Nothing
   Set BANDEJA = Nothing%>
</body>
</html>