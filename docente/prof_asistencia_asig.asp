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
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega();return false;">
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
	s_StringAsig = ""
	s_StringAsigTipo = ""
	s_StringAsigParalelo = ""
	s_StringAsigCarrera = ""
	s_StringAsigIngMasivo = ""
	s_StringAsig = Request("s_StringAsig")	
	s_StringAsigTipo = Request("s_StringAsigTipo")
	s_StringAsigParalelo = Request("s_StringAsigParalelo")
	s_StringAsigCarrera = Request("s_StringAsigCarrera")
	s_StringAsigIngMasivo = Request("s_StringAsigIngMasivo")
	d_Fecha = date()
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10	
	'd_FcAsistencia = d_FcSistema
	d_FcAsistencia = Date()
	If s_StringAsig <> "" Then
		n_CdAsigna = Separa(s_StringAsig, "-")
		n_NrProceMapaes = Separa(s_StringAsig, "-")
		s_NmAsigna = Separa(s_StringAsig, "-")
		If n_NrProceMapaes > 0 Then
			Session("n_NrProceMapaes") = n_NrProceMapaes
		End If
	End If
	If s_StringAsigTipo <> "" Then
		n_CdAsigna = Separa(s_StringAsigTipo, "-")
		s_NmAsigna = Separa(s_StringAsigTipo, "-")
		s_TipoAsig = Separa(s_StringAsigTipo, "-")
	End If
	If s_StringAsigParalelo <> "" Then
		n_CdAsigna = Separa(s_StringAsigParalelo, "-")
		s_NmAsigna = Separa(s_StringAsigParalelo, "-")
		s_TipoAsig = Separa(s_StringAsigParalelo, "-")
		n_NrParalelo = Separa(s_StringAsigParalelo, "-")
	End If
	If s_StringAsigCarrera <> "" Then
		n_CdAsigna = Separa(s_StringAsigCarrera, "*")
		s_NmAsigna = Separa(s_StringAsigCarrera, "*")
		s_TipoAsig = Separa(s_StringAsigCarrera, "*")
		n_NrParalelo = Separa(s_StringAsigCarrera, "*")
		n_CdCarrera = Separa(s_StringAsigCarrera, "*")
		s_CdClave1 = Separa(s_StringAsigCarrera, "*")
		d_FcAsistencia = CDate(Separa(s_StringAsigCarrera, "*"))	
	End If
	If s_StringAsigIngMasivo <> "" Then
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
		d_FcAsistencia = CDate(Separa(s_StringAsigIngMasivo, "*"))		
		d_FcAsistencia = Date()
	End If
	Set o = getComponent()
	If s_StringAsig = "" and s_StringAsigTipo = "" and s_StringAsigParalelo = "" and s_StringAsigCarrera = "" Then
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "1_3"
		idsession = Session.SessionID 'obtiene el n�mero �nico de la session que entrega el servidor, no es modificable.
		var = INSTR (1, d_fecha, "/") 'busca el caracter especificado en la cadena
		var2 = INSTR (1, d_fecha, "-") 
		If var > 0 and var2 = 0 then
			fecha = REPLACE (d_fecha, "/", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena 
		End If
		If var2 > 0 and var = 0 then
			fecha = REPLACE (d_fecha, "-", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena
		End If
		'fin funcion de escaneo de fecha		
		'archivo= request.serverVariables("APPL_PHYSICAL_PATH") &"Portal_uvm\log\"&n_NrRutProfe&"_"&fecha&".txt" 'se da path, raiz donde se encuentra el sitio y se modifica seg�n parametros donde se quiera
		'***** ESTE PATH ES PARA EL SERVER, EL DE ARRIBA ES PARA EL EQUIPO LOCAL ********
		archivo= request.serverVariables("APPL_PHYSICAL_PATH")&"log\"&n_NrAnoActivo&"_"&n_NrPerActivo&".txt"  'se da path, raiz donde se encuentra el sitio y se modifica seg�n parametros donde se quiera
		set confile = createObject("scripting.filesystemobject") 
		set fich = confile.OpenTextFile(archivo,8,1) 'el 8 quiere decir va a ingresar otro registro y no modifica el existente y el 1 es por si no existe el archivo txt lo crea
		fich.WriteBlankLines(1)  'da un salto de linea (1)... puede ser (1), (2), etc.
		fich.write(s_opcion&"	"&n_modulo&"	"&n_NrRutProfe&"	"&fecha&"	"&h_hora&"	"&idsession)'escribe el archivo seg�n parametros entregados
		fich.close() 'se cierra el archivo
		'********  FIN FUNCION  *****************
	End If
	
	n_NrPerActivo_S = Session("n_NrPerActivo_S")
	n_NrPerActivo_T = Session("n_NrPerActivo_T")
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
        <tr> 
          <td height="65" valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><img src="img/portaldocente.jpg" width="277" height="16"></td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto">Periodo:</span> <span class="respuesta"><strong>
            <%n_NrProceMapaes = Session("n_NrProceMapaes")
			  If n_NrProceMapaes > 0 Then
			  		n_NrPerActivo = n_NrProceMapaes
				End If%>
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
            </strong></span>&nbsp;&nbsp;<span class="texto">Fecha:
            </span>
            <span class="respuesta"><strong>
            <% call response.write (d_FcSistema) %>
&nbsp;</strong></span>&nbsp;<span class="texto">Nombres:</span>
<span class="respuesta"><strong>
<% call response.write (s_NmBrsProfe) %>
</strong></span></td>
        </tr>
        <tr> 
          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
		  <form action="prof_asistencia_asignatura_eje.asp" method="post" name="form1" id="form1">
            <tr>
              <td colspan="3"><span class="txtitulo">Asistencia Asignatura</span></td>
              </tr>
            <tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td width="24%" class="texto"><div align="right">Asignatura:</div></td>
              <td width="64%" class="texto"><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <%xml = o.Consulta_Asignaturas_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_NrPerActivo_S, n_NrPerActivo_T)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set ASIGNATURAS = doc.selectNodes("//ASIGNATURAS/LISTAASIGNATURAS")%>
                <select name="Asignaturas" class="SELECT" id="Asignaturas" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_asistencia_asig.asp" selected>Elija una Asignatura:</option>
                  <% set LISTAASIGNATURAS= ASIGNATURAS.nextNode %>
                  <% while not (LISTAASIGNATURAS is nothing) %>
                  <option value="prof_asistencia_asig.asp?s_StringAsig=<%=valor(LISTAASIGNATURAS,"s_CdAsigna")&"-"&valor(LISTAASIGNATURAS,"s_NrProceMapaes")&"-"&valor(LISTAASIGNATURAS,"s_NmAsigna")%>" <%If (Not isNull((n_CdAsigna))) Then If (valor(LISTAASIGNATURAS,"s_CdAsigna") = CStr((n_CdAsigna))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(LISTAASIGNATURAS,"s_CdAsigna")&":"&valor(LISTAASIGNATURAS,"s_NmAsigna") %></option>
                  <% set LISTAASIGNATURAS= ASIGNATURAS.nextNode
							     wend %>
                </select>
              </font></span></td>
              <td width="12%">&nbsp;</td>
            </tr>
            <tr>
              <td class="texto"><div align="right">Tipo:</div></td>
              <td class="texto"><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <%If s_NmAsigna <> "" Then
										xml = o.Consulta_Tipo_Asignatura_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set LISTA = doc.selectNodes("//LISTA/TIPOASIG")
							End If%>
                <select name="TipoAsignatura" class="SELECT" id="TipoAsignatura" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_asistencia_asig.asp" selected>Elija Tipo Asignatura:</option>
                  <% If s_NmAsigna <> "" Then
										        set TIPOASIG= LISTA.nextNode
                                                while not (TIPOASIG is nothing) %>
                  <option value="prof_asistencia_asig.asp?s_StringAsigTipo=<%=CStr(n_CdAsigna)&"-"&s_NmAsigna&"-"&valor(TIPOASIG,"s_TipoAsig")%>" <%If (s_TipoAsig<>"") Then If (valor(TIPOASIG,"s_TipoAsig") = s_TipoAsig) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(TIPOASIG,"s_TipoAsig") %></option>
                  <%    set TIPOASIG= LISTA.nextNode
							                    wend
										     End If %>
                </select>
              </font></span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="texto"><div align="right">Paralelo:</div></td>
              <td class="texto"><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <% If s_TipoAsig <> "" Then
										xml = o.Consulta_Paralelo_Asignatura_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna, s_TipoAsig)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set LISTA = doc.selectNodes("//LISTA/PARALELO")
							End If
							%>
                <font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <select name="ParaleloAsignatura" class="SELECT" id="ParaleloAsignatura" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_asistencia_asig.asp" selected>Elija el Paralelo:</option>
                  <% If s_TipoAsig <> "" Then
										        set PARALELO= LISTA.nextNode 
                                                while not (PARALELO is nothing)%>
                  <option value="prof_asistencia_asig.asp?s_StringAsigParalelo=<%=n_CdAsigna&"-"&s_NmAsigna&"-"&s_TipoAsig&"-"&valor(PARALELO,"s_NrParalelo")%>" <%If (Not isNull((n_NrParalelo))) Then If (valor(PARALELO,"s_NrParalelo") = CStr((n_NrParalelo))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(PARALELO,"s_NrParalelo")%></option>
                  <%     set PARALELO= LISTA.nextNode
							                     wend
								             End If%>
                </select>
                </font></font></span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="texto"><div align="right">Filtre por: </div></td>
              <td class="texto"><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif"><span class="Estilo13"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <% If n_NrParalelo > 0 Then
							xml = o.Consulta_Carrera_Asignatura_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_NrEstado)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set LISTA = doc.selectNodes("//LISTA/CARRERA")
End If%>
                <select name="CarreraAsignatura" class="SELECT" id="CarreraAsignatura" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_asistencia_asig.asp?s_StringAsigCarrera=<%=n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&"0"&"*"&s_CdClave1&"*"&d_FcAsistencia%>" selected>Todas las Carrera:</option>
                  <% If n_NrParalelo > 0 Then
										        set CARRERA= LISTA.nextNode 
                                                while not (CARRERA is nothing)%>
                  <option value="prof_asistencia_asig.asp?s_StringAsigCarrera=<%=n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&valor(CARRERA,"s_CdCarrera")&"*"&s_CdClave1&"*"&d_FcAsistencia%>" <%If (Not isNull((n_CdCarrera))) Then If (valor(CARRERA,"s_CdCarrera") = CStr((n_CdCarrera))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(CARRERA,"s_NmCarrera")%></option>
                  <%     set CARRERA= LISTA.nextNode
							                     wend
								             End If%>
                </select>
              </font></span></font></span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="24%" class="texto"><div align="right">Fecha(dd-mm-aaaa)</div></td>
                  <td width="20%"><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><font color="#000000">
                    <input name="Fecha" type="text" class="input" id="Fecha" value="<%=d_FcAsistencia%>" size="10" maxlength="10">
                  </font><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><font color="#000000">
                  <input name="d_FcSistema" type="hidden" id="d_FcSistema" value="<% =d_FcSistema%>" >
                  </font></font></font></font></font></td>
                  <td width="37%"><font size="1" face="Arial, Helvetica, sans-serif"><font color="#006699"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                    <%  If n_NrParalelo > 0 Then
									xml = o.Consulta_Asistencia_Clave_Horario(s_CdClave)
									Set doc = Server.CreateObject ("MSXML.DomDocument")
									Call doc.loadxml (xml)
									set CLAVE = doc.selectNodes("//CLAVE/HORARIO")									
								     End If%>
&nbsp; </font></font>
                      <select name="clavehoraria" class="SELECT" id="clavehoraria">
                        <option value="Elija una Clave Horaria" selected>Elija una Clave Horaria</option>
                        <%If n_NrParalelo > 0 Then
				  If s_NmCarrera = "" then
											    s_NmCarrera = " "
											End If
				  Set HORARIO = CLAVE.nextNode
											while not (HORARIO is nothing)
											%>
                        <option value="<%=n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&n_CdCarrera&"*"&s_NmCarrera&"*"&valor(HORARIO,"s_CdClave1")&"*"&valor(HORARIO, "s_NmClave")&"*"&valor(HORARIO, "s_HrsInicio")&"*"&valor(HORARIO, "s_HrsTermino")%>"<%If (s_CdClave1<>"") Then If (valor(HORARIO,"s_CdClave1") = s_CdClave1) Then Response.Write("SELECTED") : Response.Write("")%> ><%= valor(HORARIO,"s_CdClave1")&":"&valor(HORARIO, "s_NmClave")&" Desde: "&valor(HORARIO, "s_HrsInicio")&" Hasta: "&valor(HORARIO, "s_HrsTermino")%></option>
                        <%set HORARIO= CLAVE.nextnode
											wend
					End If%>
                      </select>
                  </font></td>
                  <td width="19%"><font size="1" face="Arial, Helvetica, sans-serif">
                    <input name="accion" type="submit" class="Submit" id="accion" value="-->">
                  </font></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
              </tr>
            <tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3"><hr size="1" noshade></td>
            </tr>
			  </form>
          </table></td>
        </tr>
      </table></td>
    <td width="190" valign="top"></td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table>
<%set o = nothing
  set ASIGNATURAS = nothing
  set LISTAASIGNATURAS = nothing
  set LISTA = nothing
  set TIPOASIG = nothing
  set PARALELO = nothing
  set CARRERA = nothing
  set CLAVE = nothing
  set HORARIO = nothing %>
</body>
</html>
