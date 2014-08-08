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

function Abrir_ventana (asig, carre, escuela, malla, parale, tipo, s_rutdoc) {
	prueba = asig;
	prueba2 = carre;
	prueba3 = escuela;
	prueba4 = malla;
	prueba5 = parale;
	prueba6 = tipo;
	prueba7 = s_rutdoc;
	var opciones="toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1024, height=768, top=0, left=0";
	window.open("inf_1.asp","",opciones);
}
//-->
</script>

</head>
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega();return false;">
<%  Dim ASIGNATURAS, LISTAASIGNATURAS, ASIGNATURAS2, LISTAASIGNATURAS2,n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer, s_NrMalla, s_NrParale, s_CdAsigna, s_NmCarrer, s_NmAsigna, s_TpPrueba, s_NrPrueba, s_NvPrueba, s_NrSubPru, s_NrSubPar, s_NmPrueba 
   
' Session("n_NrRutProfe") =  9130888					
   
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
		s_NmAsigna = Separa(s_StringAsig, "-")
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

n_ano = 2014
n_anno = n_ano
n_periodo = 1
Session("n_ano") = n_ano
Session("n_periodo") = n_periodo

if Request("accion") = "Cambiar Periodo Evaluación" then  
		n_ano = CInt(Request("nrano"))
		n_periodo = CInt(Request("nrperiodo"))
		Session("n_ano") = n_ano
		Session("n_periodo") = n_periodo
end if
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
            <span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#0099CC">&nbsp; </font></font>Fecha:</span>            <span class="respuesta"><strong>
            <% call response.write (d_FcSistema) %>
&nbsp;</strong></span><span class="texto"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">&nbsp; </font></font>Nombres:</span><span class="respuesta"><strong>
<% call response.write (s_NmBrsProfe) %>
</strong></span> </td>
        </tr>
        <tr>
              	<td colspan="4">
            			<form name="form1" method="post" action="">
                        <span class="texto">Periodo:</span>            <span class="respuesta">
            		<strong>
                            <select name="nrano" id="nrano" class="SELECT">
                            <% 
							anno_inicio = 2011
							while (anno_inicio <= n_anno)
								%> <option value="<%= anno_inicio %>" <% If anno_inicio = n_ano then%> selected<% End If %>><%= anno_inicio %></option> <%
								anno_inicio = anno_inicio + 1
							wend %>
                            </select> - <input name="nrperiodo" type="text" class="input" id="nrperiodo" size="1" maxlength="1" value="<%=(n_periodo)%>" onKeypress="if (event.keyCode < 49 || event.keyCode > 51) event.returnValue = false;">
                    <input name="accion" type="submit" class="Submit" id="accion" value="Cambiar Periodo Evaluación">
                    </strong></span>
            </form>
            	<span class="homeintrod">* Para otros resultados de evaluaci&oacute;n, modificar el per&iacute;odo </span>     
                </td>
              </tr>
         <!-- tr>
         	<td>
            	<%'= Session("n_ano")%> - <%'= Session("n_periodo")%> 
            </td>
         </tr !-->
        <tr> 
          <td valign="top">
		  <%
		  		dim s_Existe, n_ano, s_STExiste
			  	xml = o.Consulta_Listado_Evaluacion(n_ano, n_periodo, n_NrRutProfe, s_STExiste)
				if s_STExiste = "S" then
		  %>
		  <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr> 
                <td colspan="4" class="txtitulo">Listado de MIS Asignaturas Evaluadas</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td width="40%" class="txsubtitulo">Asignatura</td>
                <td width="40%" class="txsubtitulo">Carrera</td>
                <td width="10%" class="txsubtitulo">Tipo</td>
                <td width="10%" class="txsubtitulo">Paralelo</td>
              </tr>
              <tr> 
                <td colspan="4" ><hr></td>
              </tr>
              <% 
			 				Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set ASIGNATURAS = doc.selectNodes("//ASIGNATURAS/LIST_ASIGNATURAS")
							set LISTA_ASIGNATURAS= ASIGNATURAS.nextNode 
							while not (LISTA_ASIGNATURAS is nothing) %>
              <tr bgcolor="#E4E4E4"> 
                <td class="texto2"><a href="javascript:Abrir_ventana('<%response.Write(valor(LISTA_ASIGNATURAS,"s_cdasigna")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS,"s_cdcarrer")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS,"s_cdunidadacad")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS,"s_nrmalla")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS,"s_nrparale")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS,"s_tipoasig")) %>');"><%=valor(LISTA_ASIGNATURAS,"s_nmasigna") %></a></td>
                <td class="texto"><%=valor(LISTA_ASIGNATURAS,"s_nmcarrer") %></td>
                <td align="center" class="texto"><%=valor(LISTA_ASIGNATURAS,"s_tipoasig") %></td>
                <td align="center" class="texto"><%=valor(LISTA_ASIGNATURAS,"s_nrparale") %></td>
              </tr>
              <% 
			  	set LISTA_ASIGNATURAS= ASIGNATURAS.nextNode
				wend %>
				 <tr>
                <td width="40%" class="txsubtitulo">&nbsp;</td>
                <td width="40%" class="txsubtitulo">&nbsp;</td>
                <td width="10%" class="txsubtitulo">&nbsp;</td>
                <td width="10%" class="txsubtitulo">&nbsp;</td>
              </tr>
			   <tr>
                <td width="40%" class="txsubtitulo">&nbsp;</td>
                <td width="40%" class="txsubtitulo">&nbsp;</td>
                <td width="10%" class="txsubtitulo">&nbsp;</td>
                <td width="10%" class="txsubtitulo">&nbsp;</td>
              </tr>
            </table>
		<%
				end if
			 	call o.Busca_JefeCarrera(n_NrRutProfe, s_Existe)
				if  s_Existe = "S"  then
		%>
		<hr>
		
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr> 
                <td colspan="4" class="txtitulo">Listado de Asignaturas Evaluadas 
                  de la carrera</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td width="40%" class="txsubtitulo">Asignatura</td>
                <td width="40%" class="txsubtitulo">Carrera</td>
                <td width="10%" class="txsubtitulo">Tipo</td>
                <td width="10%" class="txsubtitulo">Paralelo</td>
              </tr>
              <tr> 
                <td colspan="4" ><hr></td>
              </tr>
              <% 
			
			   			xml = o.Consulta_Listado_Evaluacion_Jefe(n_ano, n_periodo, n_NrRutProfe)  
						Set doc = Server.CreateObject ("MSXML.DomDocument")
							Call doc.loadxml (xml)
							set ASIGNATURAS2 = doc.selectNodes("//ASIGNATURAS2/LIST_ASIGNATURAS2")
							set LISTA_ASIGNATURAS2 = ASIGNATURAS2.nextNode 
							while not (LISTA_ASIGNATURAS2 is nothing) %>
              <tr bgcolor="#E4E4E4"> 
                <td class="texto2"><a href="javascript:Abrir_ventana('<%response.Write(valor(LISTA_ASIGNATURAS2,"s_cdasigna")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS2,"s_cdcarrer")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS2,"s_cdunidadacad")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS2,"s_nrmalla")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS2,"s_nrparale")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS2,"s_tipoasig")) %>', '<%response.Write(valor(LISTA_ASIGNATURAS2,"s_rutdoc")) %>');"><%=valor(LISTA_ASIGNATURAS2,"s_nmasigna") %></a></td>
                <td class="texto"><%=valor(LISTA_ASIGNATURAS2,"s_nmcarrer") %></td>
                <td align="center" class="texto"><%=valor(LISTA_ASIGNATURAS2,"s_tipoasig") %></td>
                <td align="center" class="texto"><%=valor(LISTA_ASIGNATURAS2,"s_nrparale") %></td>
              </tr>
              <% 
			  	set LISTA_ASIGNATURAS2= ASIGNATURAS2.nextNode
				wend %>
            </table>
			<%
				end if
			%>
			</td>
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
