<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="Notas_Actas_Profesor.inc"-->
<html>
<head>
<title>PortalUVM - Docente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../estilos.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js/conn_ajax.js"></script>
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
<script>
	function CheckResolucion(s_NrRutAlu,n_CdCarrera,n_NrAnoPrueba,n_NrPerPrueba,n_CdAsigna,n_CdDepende,s_CierraActa) {
		if (document.getElementById(s_NrRutAlu).value == 6) {
			clicka_val(s_NrRutAlu,n_CdCarrera,n_NrAnoPrueba,n_NrPerPrueba,n_CdAsigna,n_CdDepende,s_CierraActa);
		}
		/*else {
			document.getElementById(s_NrRutAlu).value = 7;
		}*/
		
	}
</script>


<style type="text/css">
<!--
.Estilo2 {font-size: 10}
.Estilo3 {color: #000000}
-->
</style>
</head>
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega();return false;">
<%  Dim o, ASIGNATURAS, LISTAASIGNATURAS, CURSO, LISTA, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_NrParale, s_CdAsigna, s_NmAsigna, s_CdSede, s_NmSede, s_Reg_Fecha, n_NrContador, s_StringAsig, n_NrAprobados, n_NrReprobados, n_NrSinRegistro
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
	Function Valor(nodo,etiqueta)
		valor = nodo.selectSingleNode(etiqueta).text
	end function
		
	
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_CdAsigna = 0
	n_CdCarrera = 0
	n_NrParalelo = 0
	n_NrAprobados = 0
	n_NrReprobados = 0
	n_NrSinRegistro = 0
	s_NmBrsProfe = ""
	d_FcSistema=#12-1-1999#
	s_TipoAsig = ""
	s_CdCarrer = ""
	s_NrMalla  = ""
    s_NrParale = ""
	s_CdAsigna = ""
	s_NmAsigna = ""
	s_NmCarrer = ""
	n_NrContador = 1
	s_Reg_Fecha = ""
	s_CierraActa = "N"
	Session("s_CierraActa") = s_CierraActa
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivoDoc")
	'd_FcSistema = CDate(Session("d_FcSistema"))
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	
	
	Set o = getComponent()
	
	
	If n_NrRutProfe = 0 Then
	   response.redirect("http://www.uvm.cl")
    End If	
	If request("accion") =  "Cerrar Acta" Then
		s_CierraActa = "S"		
	End If
	Session.TimeOut = 10	
	s_CdPrb = ""
	s_CdPrb = request("s_CdPrb")
	s_CdPrb2 = s_CdPrb
	If s_CdPrb <> "" Then
		n_NrAnoPrueba = 0
		n_NrPerPrueba = 0
		n_CdCarrera = 0
		n_CdCarrera = CInt(separa(s_CdPrb))
		s_NmCarrera = separa(s_CdPrb)
		n_NrAnoPrueba = CInt(separa(s_CdPrb))
		n_NrPerPrueba = CInt(separa(s_CdPrb))
		s_NrMalla = separa(s_CdPrb)
		s_TipoAsig = separa(s_CdPrb)
		n_NrParalelo = CInt(separa(s_CdPrb))
		s_TpRegimen = separa(s_CdPrb)
	    n_CdAsigna = CDbl(separa(s_CdPrb))
	    s_NmAsigna = separa(s_CdPrb)
	    s_TpNota = separa(s_CdPrb)
	    s_SwEx_4 = separa(s_CdPrb)
	    n_NotaExim = CInt(separa(s_CdPrb))
	    n_PorExamen = CInt(separa(s_CdPrb))
	    n_CdDepende = CInt(separa(s_CdPrb))
		 
		Session("n_CdCarrera") = n_CdCarrera
		Session("s_NmCarrera") = s_NmCarrera
		Session("n_NrAnoPrueba") = n_NrAnoPrueba
		Session("n_NrPerPrueba") = n_NrPerPrueba
		Session("s_NrMalla") = s_NrMalla
		Session("s_TipoAsig") = s_TipoAsig
		Session("n_NrParalelo") = n_NrParalelo
		Session("s_TpRegimen") = s_TpRegimen
		Session("n_CdAsigna") = n_CdAsigna
		Session("s_NmAsigna") = s_NmAsigna
		Session("s_TpNota") = s_TpNota
		Session("s_SwEx_4") = s_SwEx_4
		Session("n_NotaExim") = n_NotaExim
		Session("n_PorExamen") = n_PorExamen
		Session("n_CdDepende") = n_CdDepende
	Else 
		n_CdCarrera = Session("n_CdCarrera")
		s_NmCarrera = Session("s_NmCarrera")
		n_NrAnoPrueba = Session("n_NrAnoPrueba")
		n_NrPerPrueba = Session("n_NrPerPrueba")
		s_NrMalla = Session("s_NrMalla")
		s_TipoAsig = Session("s_TipoAsig")
		n_NrParalelo = Session("n_NrParalelo")
		s_TpRegimen = Session("s_TpRegimen")
		n_CdAsigna = Session("n_CdAsigna")
		s_NmAsigna = Session("s_NmAsigna")
		s_TpNota = Session("s_TpNota")
		s_SwEx_4 = Session("s_SwEx_4")
		n_NotaExim = Session("n_NotaExim")
		n_PorExamen = Session("n_PorExamen")
		n_CdDepende = Session("n_CdDepende")
	End If
	
	  xml = o.Act_ConsultaCierreActa(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, s_TipoAsig, s_TpRegimen, n_CdDepende, n_CdAsigna, n_NrParalelo, n_NrRutProfe, s_CierraActa )	
	
	
	''If s_StringAsig <> "" Then
	''	s_CdAsigna = Separa(s_StringAsig)
	''	n_NrSemestMaasac = Separa(s_StringAsig)
	''	s_NmAsigna = Separa(s_StringAsig)
	''	s_NrParale = Separa(s_StringAsig)
	''	s_CdSede = Separa(s_StringAsig)
	''	Session("s_CdAsigna") = s_CdAsigna
	''	Session("n_NrSemestMaasac") = n_NrSemestMaasac
   	''    Session("s_NmAsigna") = s_NmAsigna
	''    Session("s_NrParale") = s_NrParale
	''    Session("s_CdSede") = s_CdSede
	''End If
	
	''xml = o.Consulta_Acceso_FG_Actas(s_Reg_Fecha)
	
	''n_NrSemestMaasac = Session("n_NrSemestMaasac")
	''If n_NrSemestMaasac > 0 Then
	''	n_NrPerActivo = n_NrSemestMaasac
	''End If
			
	'If s_StringAsig = ""  Then
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		''var = 0
		''var2 = 0
		''s_opcion = "D"	
		''n_modulo = "1_10"
		''idsession = Session.SessionID 'obtiene el número único de la session que entrega el servidor, no es modificable.
		''var = INSTR (1, d_fecha, "/") 'busca el caracter especificado en la cadena
		''var2 = INSTR (1, d_fecha, "-") 
		''If var > 0 and var2 = 0 then
			''fecha = REPLACE (d_fecha, "/", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena 
		''End If
		''If var2 > 0 and var = 0 then
			''fecha = REPLACE (d_fecha, "-", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena
		''End If
		'fin funcion de escaneo de fecha		
		'archivo= request.serverVariables("APPL_PHYSICAL_PATH") &"Portal_uvm\log\"&n_NrRutProfe&"_"&fecha&".txt" 'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
		'***** ESTE PATH ES PARA EL SERVER, EL DE ARRIBA ES PARA EL EQUIPO LOCAL ********
		''archivo= request.serverVariables("APPL_PHYSICAL_PATH")&"log\"&n_NrAnoActivo&"_"&n_NrPerActivo&".txt"  'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
		''set confile = createObject("scripting.filesystemobject") 
		''set fich = confile.OpenTextFile(archivo,8,1) 'el 8 quiere decir va a ingresar otro registro y no modifica el existente y el 1 es por si no existe el archivo txt lo crea
		''fich.WriteBlankLines(1)  'da un salto de linea (1)... puede ser (1), (2), etc.
		''fich.write(s_opcion&"	"&n_modulo&"	"&n_NrRutProfe&"	"&fecha&"	"&h_hora&"	"&idsession)'escribe el archivo según parametros entregados
		''fich.close() 'se cierra el archivo
		'********  FIN FUNCION  *****************
	'End If
	
	''n_NrPerActivo_S = Session("n_NrPerActivo_S")
	''n_NrPerActivo_T = Session("n_NrPerActivo_T")
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
	  <form action="prof_Acta_Registra_Notas.asp" method="post" name="form1">
        <tr> 
          <td height="77" valign="top"> <div align="left"> 
          <%
		  If request("accion") = "Volver" Then
		  		response.Redirect("prof_acta_consulta_asig.asp")
		  End If%>
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><img src="img/portaldocente.jpg" width="277" height="16"></td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto">Periodo:            </span><span class="respuesta"><strong>
            <% 
								
			call response.write (n_NrAnoPrueba&"/"&n_NrPerPrueba) %>
&nbsp;</strong></span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#0099CC">&nbsp; </font></font>Fecha:
</span><span class="respuesta"><strong>
<% call response.write (d_FcSistema) %>
&nbsp;</strong></span><span class="Estilo20"><font color="#000000" face="Arial, Helvetica, sans-serif"><font color="#3399CC">&nbsp; </font></font></span><span class="texto">Nombres:</span><span class="respuesta"><strong>
<% call response.write (s_NmBrsProfe) %>
</strong></span> </td>
        </tr>
        <tr> 
          <td valign="top"><table width="560"  border="0" cellspacing="0" cellpadding="2">
            <tr>
              <th height="33" colspan="4" scope="col" class="txtitulo" align="left">Registro de notas en acta</th>
              </tr>
            <tr>
              
            </tr>
			<tr>
              <td colspan="3" class="texto">Carrera:&nbsp;<%=s_NmCarrera%></td>
            </tr>
			<tr>
              <td colspan="3" class="texto">Malla:&nbsp;<%=s_NrMalla%></td>
            </tr>
			<tr>
              <td colspan="3" class="texto">Asignatura:&nbsp;<%=s_NmAsigna%></td>
            </tr>
            <tr>
              <td colspan="3" class="texto">Actividad:&nbsp;<%=s_TipoAsig%></td>
            </tr>
            <tr>
              <td colspan="3" class="texto">Paralelo:&nbsp;<%=n_NrParalelo%></td>
            </tr>
			<tr>
              <td colspan="3" class="txsubtitulo">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4">
                <%
				   n_CdCarrera = Session("n_CdCarrera")
		           ''s_NmCarrera = Session("s_NmCarrera")
		           n_NrAnoPrueba = Session("n_NrAnoPrueba")
		           n_NrPerPrueba = Session("n_NrPerPrueba") 
		           s_NrMalla = Session("s_NrMalla")
		           s_TipoAsig = Session("s_TipoAsig") 
		           n_NrParalelo = Session("n_NrParalelo") 
		           s_TpRegimen = Session("s_TpRegimen") 
		           n_CdAsigna = Session("n_CdAsigna") 
		           ''s_NmAsigna = Session("s_NmAsigna")
		           s_TpNota = Session("s_TpNota") 
		           ''s_SwEx_4 = Session("s_SwEx_4")
		           ''n_NotaExim = Session("n_NotaExim")
		           ''n_PorExamen = Session("n_PorExamen")
		           n_CdDepende = Session("n_CdDepende")
				   xml = o.Act_Consulta_Alumnos_ListaActasConceptual(n_CdCarrera, n_NrAnoPrueba, n_NrPerPrueba, s_NrMalla, s_TipoAsig, n_NrParalelo,  s_TpRegimen, n_CdAsigna, s_TpNota, n_CdDepende, n_NrAprobados, n_NrReprobados, n_NrSinRegistro)								   
				   Set doc = Server.CreateObject ("MSXML.DomDocument")
				   Call doc.loadxml (xml)							   
				   set LISTA = doc.selectNodes("//LISTA/CURSO")
				  %>
              </td>
              </tr>
            <tr>
              <td colspan="4"><table width="573" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
                <tr bgcolor="#666666">
                  <td colspan="3" class="textblanco"><strong>Lista de Acta</strong></td>
				  <td colspan="3" class="texto">&nbsp;</td>
                </tr>
                <tr bgcolor="#CCCCCC" class="texto">
                  <td width="30"><strong>N&ordm;</strong></td>
                  <td width="90"><strong>Rut Alumno </strong></td>
                  <td width="293"><strong>Nombre del Alumno </strong></td>
                  <td width="137"><strong>Concepto </strong></td>
                </tr>
                <% Set CURSO= LISTA.nextNode
					while not (CURSO is nothing) %>
                <tr class="texto">
                  <td align="center"><% call response.write (n_NrContador&".-") %></td>
                  <td align="left"><%= valor(CURSO,"s_NrRutAlu")%></td>
				  <%IdCampo = CDbl(valor(CURSO,"s_NrRutAlu"))%>
                  <td><%= valor(CURSO,"s_NmAlumno")%></td>
				  <td>
                    <select name="<%=IdCampo%>" class="texto" id="<%=IdCampo%>" idclass="texto" onChange="CheckResolucion(<%=IdCampo%>,<%= n_CdCarrera%>,<%= n_NrAnoPrueba%>,<%=n_NrPerPrueba%>,<%= n_CdAsigna%>,<%= n_CdDepende%>,'<%= s_CierraActa%>');">
                      <option value="1" <%if valor(CURSO,"s_CdEstado") = "1" Then%>selected<%End if%>>Distinguido</option>
                      <option value="2" <%if valor(CURSO,"s_CdEstado") = "2" Then%>selected<%End if%>>Aprobado con merito</option>
					  <option value="3" <%if valor(CURSO,"s_CdEstado") = "3" Then%>selected<%End if%>>Aprobado mínimo</option>
					  <option value="4" <%if valor(CURSO,"s_CdEstado") = "4" Then%>selected<%End if%>>Aprobado</option>
					  <option value="5" <%if valor(CURSO,"s_CdEstado") = "5" Then%>selected<%End if%>>Reprobado</option>
                      <option value="6" <%if valor(CURSO,"s_CdEstado") = "6" Then%>selected<%End if%> >Pendiente</option>
					  <option value="7" <%if valor(CURSO,"s_CdEstado") = "7" Then%>selected<%End if%>>Sin Registro</option>
                    </select>
                    <input type="hidden" id="resolucion<%= valor(CURSO,"s_NrRutAlu")%>" name="resolucion<%= valor(CURSO,"s_NrRutAlu")%>">
				</td>
					<%  s_Val_CdEstado = valor(CURSO,"s_CdEstado")
					    s_Val_IdCampo = request( IdCampo)
						if request("accion") = "Guardar" then
						   If s_Val_CdEstado <> s_Val_IdCampo then
 					          s_NrRutAlu = valor(CURSO,"s_NrRutAlu")
							 		                      
							  s_CdEstado = s_Val_IdCampo
							  's_CdEstado = valor(CURSO,"s_CdEstado")
							  n_CdCarrera =  Session("n_CdCarrera")		
                      		  n_NrAnoPrueba = Session("n_NrAnoPrueba")
		                      n_NrPerPrueba = Session("n_NrPerPrueba")
		                      s_NrMalla = Session("s_NrMalla")
		                      s_TipoAsig = Session("s_TipoAsig")
		                      n_NrParalelo = Session("n_NrParalelo")
		                      s_TpRegimen = Session("s_TpRegimen")
		                      n_CdAsigna = Session("n_CdAsigna")
 		                      n_CdDepende = Session("n_CdDepende")
		                      
 				              xml = o.Act_IngresaNota_Alumnos_ListaActasConceptual(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, s_TipoAsig, s_TpRegimen, n_CdDepende, n_CdAsigna, n_NrParalelo, s_NrRutAlu, s_CdEstado, n_NrRutProfe )	
							  
					       End If	
						End If	
					 %>
					
                  </tr>
                <% set CURSO= LISTA.nextnode
				     n_NrContador = n_Nrcontador + 1
					 wend %>
              </table></td>
              </tr>
            <tr>
              <td colspan="4">&nbsp;</td>
            </tr><tr>
              <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="texto">
                  <td width="16%" align="right"><strong>Aprobados :&nbsp;&nbsp;</strong></td>
                  <td width="16%" align="left"><strong><% call response.write (n_NrAprobados) %></strong></td>
                  <td width="16%" align="right"><strong>Reprobados :&nbsp;&nbsp;</strong></td>
                  <td width="16%" align="left"><strong><% call response.write (n_NrReprobados) %></strong></td>
                  <td width="16%" align="right"><strong>Sin registro :&nbsp;&nbsp;</strong></td>
                  <td width="16%"><strong><% call response.write (n_NrSinRegistro) %></strong></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="4"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <% if s_CierraActa <> "S"  Then%><td width="35%" align="center"><input type="submit" name="accion" id="accion" value="Guardar"></td><% End If %>
                  <% if s_CierraActa <> "S"  Then%><td width="35%" align="center"><input type="submit" name="accion" id="accion" value="Cerrar Acta"></td><% End If %>
                  <td width="30%" align="center"><input type="submit" name="accion" id="accion" value="Volver"></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="4">
			   <% If request("accion") = "Cerrar Acta" then		
					     n_CdCarrera =  Session("n_CdCarrera")		
                      	 n_NrAnoPrueba = Session("n_NrAnoPrueba")
		                 n_NrPerPrueba = Session("n_NrPerPrueba")
		                 s_NrMalla = Session("s_NrMalla")
		                 s_TipoAsig = Session("s_TipoAsig")
		                 n_NrParalelo = Session("n_NrParalelo")
		                 s_TpRegimen = Session("s_TpRegimen")
		                 n_CdAsigna = Session("n_CdAsigna")
 		                 n_CdDepende = Session("n_CdDepende")
						 s_CierraActa = Session("s_CierraActa") 
		                      
 				         xml = o.Act_CerrarActa(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, s_TipoAsig, s_TpRegimen, n_CdDepende, n_CdAsigna, n_NrParalelo, n_NrRutProfe, s_CierraActa )	
						
	  			     End If	
					 If  request("accion") = "Guardar" OR request("accion") = "Cerrar Acta" then		
					    												
						 Response.Redirect("prof_Acta_Registra_Notas.asp?")
						 
	  			     End If										
                 %>
			      </td>
            </tr>
            <tr>
             
            </tr>
            <tr>
              <td colspan="4"><hr size="1" noshade></td>
            </tr>
          </table></td>
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
  set xml = nothing
  set LISTA = nothing  
  set CURSO = nothing%>
</body>
</html>
