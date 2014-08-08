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
<%  Dim PRUEBA, LISTAPRUEBA, ASIGNATURAS, LISTAASIGNATURAS, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer, s_NrMalla, s_NrParale, s_CdAsigna, s_NmCarrer, s_NmAsigna, s_TpPrueba, s_NrPrueba, s_NvPrueba, s_NrSubPru, s_NrSubPar, s_NmPrueba 
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
	n_CdCarrer = 0
	n_NrParalelo = 0
	n_CdAsigna = 0
	s_NmBrsProfe = ""
	d_FcSistema=#12-1-1999#
	s_StringAsig = ""
	s_CdCarrer = ""
	s_NrMalla  = ""
	s_NrParale = ""
	s_CdAsigna = ""
	s_NmCarrer = ""
	s_NmAsigna = ""
	s_NrPrueba = ""
	s_NvPrueba = ""
	s_NrSubPru = ""
	s_NrSubPar = ""
	s_NmPrueba = ""
	s_TipoAsig = ""
	s_StringAsig = ""
	s_StringAsigTipo = ""
	s_StringAsigParalelo = ""
	s_StringAsigCarrera = ""
	s_StringAsigIngMasivo = ""
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	If n_NrRutProfe = 0 Then
	   response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10
	s_StringAsig = Request("s_StringAsig")	
	s_StringAsigTipo = Request("s_StringAsigTipo")
	s_StringAsigParalelo = Request("s_StringAsigParalelo")
	s_StringAsigCarrera = Request("s_StringAsigCarrera")
	s_StringAsigIngMasivo = Request("s_StringAsigIngMasivo")
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
		n_CdCarrer = Separa(s_StringAsigCarrera, "*")
	End If
	
	s_Strvolver = Request("s_Strvolver")
	If s_Strvolver <> "" Then
		n_CdAsigna = Separa(s_Strvolver, "*")
		s_TipoAsig = CStr(Separa(s_Strvolver, "*"))
		n_NrParalelo = Separa(s_Strvolver, "*")
		n_CdCarrer = Separa(s_Strvolver, "*")
		s_NmPrueba = CStr(Separa(s_Strvolver, "*"))
		s_NmAsigna = CStr(Separa(s_Strvolver, "*"))
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
		n_modulo = "1_6"
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
            <span class="texto">Periodo:</span>            <span class="respuesta">
            <strong>
            <%n_NrProceMapaes = Session("n_NrProceMapaes")
			  If n_NrProceMapaes > 0 Then
			  		n_NrPerActivo = n_NrProceMapaes
				End If%>
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
            </strong>&nbsp;</span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#0099CC">&nbsp; </font></font>Fecha:</span>            <span class="respuesta"><strong>
<% call response.write (d_FcSistema) %>
&nbsp;</strong></span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">&nbsp; </font></font>Nombres:</span><span class="respuesta"><strong>
<% call response.write (s_NmBrsProfe) %>
</strong></span> </td>
        </tr>
        <tr> 
          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
		  <form action="prof_notas_parciales.asp" method="post"  name="form_ingreso" id="form_ingreso" >
            <tr>
              <th colspan="2" class="txtitulo" scope="col"><div align="left">Notas Parciales </div></th>
              <th width="11%" scope="col">&nbsp;</th>
            </tr>
            <tr>
              <td width="30%" class="texto"><div align="right">Asignaturas:</div></td>
              <td width="59%"><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <%
				'n_NrPerActivo_S = 1
				'n_NrPerActivo_T = 2
				xml = o.Consulta_Asignaturas_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_NrPerActivo_S, n_NrPerActivo_T)
				'xml = o.Consulta_Asignaturas_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set ASIGNATURAS = doc.selectNodes("//ASIGNATURAS/LISTAASIGNATURAS")%>
                <select name="Asignaturas" class="SELECT" id="Asignaturas" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_notas_parciales.asp" selected>Elija una Asignatura:</option>
                  <% set LISTAASIGNATURAS= ASIGNATURAS.nextNode %>
                  <% while not (LISTAASIGNATURAS is nothing) %>
                  <option value="prof_notas_parciales.asp?s_StringAsig=<%=valor(LISTAASIGNATURAS,"s_CdAsigna")&"-"&valor(LISTAASIGNATURAS,"s_NrProceMapaes")&"-"&valor(LISTAASIGNATURAS,"s_NmAsigna")%>" <%If (Not isNull((n_CdAsigna))) Then If (valor(LISTAASIGNATURAS,"s_CdAsigna") = CStr((n_CdAsigna))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(LISTAASIGNATURAS,"s_CdAsigna")&":"&valor(LISTAASIGNATURAS,"s_NmAsigna") %></option>
                  <% set LISTAASIGNATURAS= ASIGNATURAS.nextNode
							     wend %>
                </select>
              </font></span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="texto"><div align="right">Tipo:</div></td>
              <td><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <%If s_NmAsigna <> "" Then
					'n_NrPerActivo = n_NrProceMapaes  '30-08-2011  carreras trimestrales
										xml = o.Consulta_Tipo_Asignatura_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set LISTA = doc.selectNodes("//LISTA/TIPOASIG")
							End If%>
                <select name="TipoAsignatura" class="SELECT" id="TipoAsignatura" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_notas_parciales.asp" selected>Elija Tipo Asignatura:</option>
                  <% If s_NmAsigna <> "" Then
										        set TIPOASIG= LISTA.nextNode
                                                while not (TIPOASIG is nothing) %>
                  <option value="prof_notas_parciales.asp?s_StringAsigTipo=<%=CStr(n_CdAsigna)&"-"&s_NmAsigna&"-"&valor(TIPOASIG,"s_TipoAsig")%>" <%If (s_TipoAsig<>"") Then If (valor(TIPOASIG,"s_TipoAsig") = s_TipoAsig) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(TIPOASIG,"s_TipoAsig") %></option>
                  <%    set TIPOASIG= LISTA.nextNode
							                    wend
										     End If %>
                </select>
              </font></span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="texto"><div align="right">Paralelo:</div></td>
              <td><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <% If s_TipoAsig <> "" Then
					'n_NrPerActivo = n_NrProceMapaes '30-08-2011  carreras trimestrales
										xml = o.Consulta_Paralelo_Asignatura_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna, s_TipoAsig)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set LISTA = doc.selectNodes("//LISTA/PARALELO")
							End If
							%>
                <font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <select name="ParaleloAsignatura" class="SELECT" id="ParaleloAsignatura" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_notas_parciales.asp" selected>Elija el Paralelo:</option>
                  <% If s_TipoAsig <> "" Then
										        set PARALELO= LISTA.nextNode 
                                                while not (PARALELO is nothing)%>
                  <option value="prof_notas_parciales.asp?s_StringAsigParalelo=<%=n_CdAsigna&"-"&s_NmAsigna&"-"&s_TipoAsig&"-"&valor(PARALELO,"s_NrParalelo")%>" <%If (Not isNull((n_NrParalelo))) Then If (valor(PARALELO,"s_NrParalelo") = CStr((n_NrParalelo))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(PARALELO,"s_NrParalelo")%></option>
                  <%     set PARALELO= LISTA.nextNode
							                     wend
								             End If%>
                </select>
                </font></font></span></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="texto"><div align="right">Filtre por: </div></td>
              <td><span class="Estilo14"><font color="#FF0000" face="Arial, Helvetica, sans-serif"><span class="Estilo13"><font color="#FF0000" face="Arial, Helvetica, sans-serif">
                <% If n_NrParalelo > 0 Then
					'n_NrPerActivo = n_NrProceMapaes '30-08-2011  carreras trimestrales
							xml = o.Consulta_Carrera_Asignatura_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_NrEstado)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set LISTA = doc.selectNodes("//LISTA/CARRERA")
End If%>
                <select name="CarreraAsignatura" class="SELECT" id="CarreraAsignatura" onChange="MM_jumpMenu('parent',this,0)" select>
                  <option value="prof_notas_parciales.asp?s_StringAsigCarrera=<%=n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&"0"%>" selected>Todas las Carrera:</option>
                  <% If n_NrParalelo > 0 Then
										        set CARRERA= LISTA.nextNode 
                                                while not (CARRERA is nothing)%>
                  <option value="prof_notas_parciales.asp?s_StringAsigCarrera=<%=n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&valor(CARRERA,"s_CdCarrera")%>" <%If (Not isNull((n_CdCarrer))) Then If (valor(CARRERA,"s_CdCarrera") = CStr((n_CdCarrer))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(CARRERA,"s_NmCarrera")%></option>
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
              <td>&nbsp;</td>
              <td class="txsubtitulo">Alternativas de Notas Parciales </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="titular"><div align="right">Ingresar Notas Parciales por Pruebas:</div></td>
              <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                <% If n_NrParalelo > 0 Then
					'n_NrPerActivo = n_NrProceMapaes  '30-08-2011  carreras trimestrales
									xml = o.Consulta_Lista_Pruebas_Profesor(n_NrAnoActivo, n_NrPerActivo, n_CdCarrer, n_CdAsigna, n_NrParalelo, s_TipoAsig)
									Set doc = Server.CreateObject ("MSXML.DomDocument")
									Call doc.loadxml (xml)
									set LISTAPRUEBA = doc.selectNodes("//LISTAPRUEBA/PRUEBA")
									End If%>
                </font><font size="1" face="Arial, Helvetica, sans-serif">
                <select name="listaprueba" class="SELECT" id="listaprueba"onChange="MM_jumpMenu('parent',this,0)" >
                    <option value="prof_notas_parciales.asp" selected>Elija una Prueba</option>
                    <% If n_NrParalelo > 0 Then
				       Set PRUEBA = LISTAPRUEBA.nextNode
								  while not (PRUEBA is nothing)%>
                    <option value="prof_notas_parciales_eje.asp?s_StringAsig=<%= n_CdCarrer&"*"&s_NmCarrer&"*"&n_NrParalelo&"*"&s_NrMalla&"*"&n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&valor(PRUEBA,"s_NrPrueba")&"*"&valor(PRUEBA, "s_NvPrueba")&"*"&valor(PRUEBA, "s_NrSubPru")&"*"&valor(PRUEBA, "s_NrSubPar")&"*"&valor(PRUEBA, "s_NmPrueba")&"*"&valor(PRUEBA, "s_FcPrueba")%>&"><%= "Prueba:"&valor(PRUEBA, "s_NmPrueba")%></option>
                    <%set PRUEBA= LISTAPRUEBA.nextnode
								  wend
											End If%>
                    </select>
                </font></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
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
  set xml = nothing
  set ASIGNATURAS = nothing
  set LISTAASIGNATURAS = nothing
  set LISTA  = nothing
  set TIPOASIG = nothing
  set PARALELO = nothing
  set CARRERA = nothing
  set LISTAPRUEBA = nothing
  set PRUEBA = nothing%>
</body>
</html>
