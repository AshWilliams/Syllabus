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
<%  Dim n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer,s_NrMalla, s_NrParale, s_CdAsigna, ASIGNATURAS, LISTAASIGNATURAS, s_NmEvaluacion, s_Eximicion, s_NotaExim, n_PorExamen, s_ObjGenerales, s_ObjEspecificos, s_Glsiseva, s_Glactapr, s_NmModalidad, s_NmFuncion, s_NmRegimen
    Response.Buffer = True
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
	s_NmBrsProfe = ""
	s_StringAsig = ""
	d_FcSistema=#12-1-1999#
	s_CdCarrer = ""
	s_NrMalla  = ""
	s_NrParale = ""
	s_CdAsigna = ""
	s_NmEvaluacion = ""
	s_Eximicion = ""
	s_ObjGenerales = ""
	s_ObjEspecificos = ""
	s_Glsiseva = ""
	s_Glactapr = ""
	s_NmModalidad = ""
	s_NmFuncion = ""
	s_NmRegimen = ""
	s_NotaExim = ""
	n_PorExamen = 0
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = CDate(Session("d_FcSistema"))
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	s_StringAsig = Request("s_StringAsig")	
	If n_NrRutProfe = 0 Then		
	   response.redirect("http://www.uvm.cl")   
    End If	
	Session.TimeOut = 10	
   Set o = getComponent()
   
   s_StringAsig = request("s_StringAsig")
   s_CdCarrer = Separa(s_StringAsig)
   s_NmCarrer = Separa(s_StringAsig)
   s_NrParale = Separa(s_StringAsig)
   s_NrMalla = Separa(s_StringAsig)
   s_CdAsigna = Separa(s_StringAsig)
   s_NmAsigna = s_StringAsig
   
   	If s_StringAsig = ""  Then
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "1_7"
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
                  <td valign="top"><p><img src="img/portaldocente.jpg" width="277" height="16"></p>
                  <p><font color="#003399" size="3" face="Arial, Helvetica, sans-serif"><strong>
                    <%xml = o.Consulta_Lista_Asignaturas_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutProfe)
							Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set ASIGNATURAS = doc.selectNodes("//ASIGNATURAS/LISTAASIGNATURAS")%>
                    <select name="AsigSeleccionada" class="SELECT" id="AsigSeleccionada" onChange="MM_jumpMenu('parent',this,0)" select>
                      <option value="prof_Programa_Asignatura.asp" selected>Mis Asignaturas</option>
                      <% set LISTAASIGNATURAS= ASIGNATURAS.nextNode %>
                      <% while not (LISTAASIGNATURAS is nothing) %>
                      <option value="prof_prog_asig.asp?s_StringAsig=<%=valor(LISTAASIGNATURAS,"s_CdCarrer")&"-"&valor(LISTAASIGNATURAS,"s_NmCarrer")&"-"&valor(LISTAASIGNATURAS,"s_NrParale")&"-"&valor(LISTAASIGNATURAS,"s_NrMalla")&"-"&valor(LISTAASIGNATURAS,"s_CdAsigna")&"-"&valor(LISTAASIGNATURAS,"s_NmAsigna")%>" <%If (Not isNull((s_CdAsigna))) Then If (valor(LISTAASIGNATURAS,"s_CdAsigna") = CStr((s_CdAsigna))) Then Response.Write("SELECTED") : Response.Write("")%>><%= valor(LISTAASIGNATURAS,"s_CdAsigna") %>&nbsp;&nbsp;&nbsp;<%= valor(LISTAASIGNATURAS,"s_NmAsigna") %></option>
                      <% set LISTAASIGNATURAS= ASIGNATURAS.nextnode %>
                      <% wend %>
                    </select>
                  </strong></font></p></td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade> </td>
        </tr>
        <tr> 
          <td valign="top"><table width="560"  border="0" cellspacing="0" cellpadding="2">
            <tr>
              <th colspan="3" scope="col"><div align="left">
                  <span class="texto">Periodo:</span><span class="respuesta">
                  <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
                  </span><span class="texto">Fecha:</span> <span class="respuesta">
                  <% call response.write (d_FcSistema) %>
                  </span>&nbsp;<span class="texto"> Nombres:</span><span class="respuesta">
                  <% call response.write (s_NmBrsProfe) %>
                  </span>                                    
</div></th>
              </tr>
            <tr>
              <td class="txtitulo">Programa</td>
            </tr>
            <tr>
              <th colspan="3" scope="col"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif"><span class="titular">
                  <%Call o.Consulta_Programa_Asignatura(s_CdAsigna, s_NmEvaluacion, s_Eximicion, s_NotaExim, n_PorExamen, s_ObjGenerales, s_ObjEspecificos, s_Glsiseva, s_Glactapr, s_NmModalidad, s_NmFuncion, s_NmRegimen)%>
  Seleccionada:</span></font><span class="respuesta"><strong><strong>
  <% Response.Write(s_NmAsigna) %>
  </strong></strong></span><font size="1" face="Arial, Helvetica, sans-serif"><span class="titular">Carrera:</span></font><span class="respuesta"><strong> 
  <%Response.write(s_NmCarrer)%>
  </strong></span><span class="titular"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><font size="1" face="Arial, Helvetica, sans-serif">Malla:</font></font></font></span><span class="respuesta"><strong>
  <% Response.Write(s_NrMalla)%>
  </strong></span><span class="titular"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><font size="1" face="Arial, Helvetica, sans-serif">Paralelo:</font></font></font> </font></font></font></span><span class="respuesta"><strong>
  <% Response.Write(s_NrParale)%>
  </strong></span></div></th>
            </tr>
            <tr>
              <td colspan="3"><hr size="1" noshade></td>
              </tr>
            <tr>
              <td width="94" class="texto"><div align="right">C&oacute;digo:</div></td>
              <td width="154" class="respuesta">                <%Response.Write (s_CdAsigna)%>              </td>
              <td width="300" rowspan="9" class="respuesta"><table width="250" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td><span class="texto">Evaluaci&oacute;n: </span><strong><br>
                      <textarea name="Glsiseva" cols="45" class="input" id="textarea"> <% call response.Write (s_Glsiseva) %> 
                                  </textarea>
                  </strong></td>
                </tr>
                <tr>
                  <td><span class="texto">Aprendizaje:</span> <strong><br>
                        <textarea name="Glactaprs" cols="45" class="input" id="textarea"> <% call response.Write (s_Glactaprs) %> 
                                  </textarea>
                  </strong></td>
                </tr>
                <tr>
                  <td><span class="texto">Objetivo General:</span><strong><br>
                        <textarea name="Obj_General" cols="45" class="input" id="textarea"> <% call response.Write (s_ObjGenerales) %> 
                                  </textarea>
                  </strong></td>
                </tr>
                <tr>
                  <td><span class="texto">Objetivo Especifico:</span><br>                    
                    <textarea name="Obj_Especifico" cols="45" class="input" id="textarea"> <% call response.Write (s_ObjEspecificos) %> 
                                  </textarea></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td class="texto"><div align="right">Asignatura:</div></td>
              <td class="respuesta">                <%Response.Write (s_NmAsigna)%>              </td>
              </tr>
            <tr>
              <td class="texto"><div align="right">Evaluaci&oacute;n:</div></td>
              <td class="respuesta">                <% Response.Write (s_NmEvaluacion)%>              </td>
              </tr>
            <tr>
              <td class="texto"><div align="right">Posee Eximici&oacute;n:</div></td>
              <td class="respuesta">                <% Response.Write(s_Eximicion)%>              </td>
              </tr>
            <tr>
              <td class="texto"><div align="right">Nota de Eximici&oacute;n:</div></td>
              <td class="respuesta">                <% Response.Write(s_NotaExim)%>              </td>
              </tr>
            <tr>
              <td class="texto"><div align="right">% de examen:</div></td>
              <td class="respuesta">                <% Response.Write(n_PorExamen)%>              </td>
              </tr>
            <tr>
              <td class="texto"><div align="right">Modalidad:</div></td>
              <td class="respuesta">                <% Response.Write(s_NmModalidad)%>              </td>
              </tr>
            <tr>
              <td class="texto"><div align="right">Funci&oacute;n:</div></td>
              <td class="respuesta">                <% Response.Write(s_NmFuncion)%>              </td>
              </tr>
            <tr>
              <td class="texto"><div align="right">Regimen:</div></td>
              <td class="respuesta">                <% Response.Write(s_NmRegimen)%>              </td>
              </tr>
            <tr>
              <td colspan="3"><hr size="1" noshade></td>
              </tr>
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
<%Set o = Nothing
   Set doc = Nothing
   Set xml = Nothing  
   set ASIGNATURAS = Nothing  
   set LISTAASIGNATURAS = Nothing%>
</body>
</html>
