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
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length)   {
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
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega4();return false;">
<script language="JavaScript"> 
    <!-- 
	   
	   function MostrarInfo(nomPrb, PorPrb, Glosa, FecPrb, NrPrb) 
       { 
          document.form1.Nombre_Prueba.value = nomPrb;
		  document.form1.Por_Prueba.value = PorPrb;
		  document.form1.Glosa.value = Glosa;
		  document.form1.Fecha_dia_prueba.value = FecPrb;
		  document.form1.n_NrPrueba.value = NrPrb;
       } 
	  
	  function ValidaForm() 
       { 
         if ((document.form1.Seleccionar.value == "Eliminar") || (document.form1.Seleccionar.value == "Modificar")) {
			 if ((document.form1.Nombre_Prueba.value != "") &  (document.form1.Por_Prueba.value > 0) & (document.form1.Fecha_dia_prueba.value != "")){
			 	return true;
			 }else{
               	alert ("Para ELIMINAR o MODIFICAR, debe seleccionar una prueba de la lista!");
                return false;
              }
		 }else {
			 if ((document.form1.Nombre_Prueba.value != "") &  (document.form1.Por_Prueba.value > 0) & (document.form1.Fecha_dia_prueba.value != "")){
				 if ((parseInt(document.form1.Por_Prueba.value) + parseInt(document.form1.TotalPrb.value))>n_PrPruebas){
					 alert ("La suma de los porcentajes de las pruebas no puede ser mayor al declarado ");
					 return false;
				 }else{
				 	return true;
				 }
			 }else{
               alert ("Debe ingresar todos los parametros solicitados!");
                return false;
              }
		 }
       } 
    //--> 
    </script> 
<%  Dim o, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_CdPrb
    Response.Buffer = True
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
	End function
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	''d_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10	

	Set o = getComponent()
	
	'separacion de cadena enviada desde prof_prb_consulta_asig.asp+
	Dim n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera
	
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
		s_Activo = separa(s_CdPrb)
		s_CdRegimen = separa(s_CdPrb)
		n_CdAsigna = CDbl(separa(s_CdPrb))
		n_NrPruebasMin = CInt(separa(s_CdPrb))
		n_PrPruebas = CInt(separa(s_CdPrb))
		s_NmAsigna = CStr(separa(s_CdPrb))
	End If
	
	if request("accion") = "Realizar" and request("Seleccionar") = "Eliminar" then
		n_Cod_Mensaje = 0
		'If CInt(request("RbEliminar")) = n_CdReg Then
		n_NrAnoPrueba = CInt(request("n_NrAnoPrueba"))
		n_NrPerPrueba = CInt(request("n_NrPerPrueba"))
		n_CdCarrera = CInt(request("n_CdCarrera"))
		s_NrMalla = CStr(request("s_NrMalla"))
		n_CdAsigna = CDbl(request("n_CdAsigna"))
		s_TipoAsig = CStr(request("s_TipoAsig"))
		'-----------------------------------------
		n_NrParalelo = CInt(request("n_NrParalelo"))		
		n_NrPrueba = CInt(request("n_NrPrueba"))
		n_NrPruebasMin = CInt(request("n_NrPruebasMin"))
		s_NrRutProfe = CStr(Session("n_NrRutProfe"))
		s_Activo = CStr(request("s_Activo"))
		s_NmAsigna = CStr(request("s_NmAsigna"))
		
		Call o.Prb_Elimina_Prueba(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_NrPrueba, n_NrPruebasMin, s_NrRutProfe, s_Activo, n_Cod_Mensaje)			
	End If
	
	if request("accion") = "Realizar" and request("Seleccionar") = "Nuevo" then
		n_Cod_Mensaje = 0
		n_NrAnoPrueba = CInt(request("n_NrAnoPrueba")) '*******
		n_NrPerPrueba = CInt(request("n_NrPerPrueba"))'*******
		n_CdCarrera = CInt(request("n_CdCarrera"))'*******
		s_NrMalla = CStr(request("s_NrMalla"))'*******
		n_CdAsigna = CDbl(request("n_CdAsigna"))'*******
		s_TipoAsig = CStr(request("s_TipoAsig"))'*******
		n_NrParalelo = CInt(request("n_NrParalelo"))'*******
		s_Nm_Prueba = CStr(request("Nombre_Prueba"))
		n_Por_Prueba = CInt(request("Por_Prueba"))
		d_Fc_dia_prueba = CDate(request("Fecha_dia_prueba"))
		s_Glosa = CStr(request("Glosa"))
		s_NrRutProfe = CStr(Session("n_NrRutProfe"))
		n_PrPruebas = CInt(request("n_PrPruebas"))
		s_Activo = CStr(request("s_Activo"))
		s_NmAsigna = CStr(request("s_NmAsigna"))

		Call o.Prb_Ingresa_Prueba_Profesor(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, n_CdAsigna, s_TipoAsig, n_NrParalelo, s_Nm_Prueba, n_Por_Prueba, d_Fc_dia_prueba, s_Glosa, s_NrRutProfe, n_PrPruebas, s_Activo, n_Cod_Mensaje)			
	End If
	
	if request("accion") = "Realizar" and request("Seleccionar") = "Modificar" then
		n_NrAnoPrueba = CInt(request("n_NrAnoPrueba"))
		n_NrPerPrueba = CInt(request("n_NrPerPrueba"))
		n_CdCarrera = CInt(request("n_CdCarrera"))
		s_NrMalla = CStr(request("s_NrMalla"))
		n_CdAsigna = CDbl(request("n_CdAsigna"))
		s_TipoAsig = CStr(request("s_TipoAsig"))
		'-----------------------------------------
		n_NrParalelo = CInt(request("n_NrParalelo"))
		n_NrPrueba = CInt(request("n_NrPrueba"))
		s_Nm_Prueba = ""
		n_Por_Prueba = 0
		s_Glosa = ""
		s_Nm_Prueba = CStr(request("Nombre_Prueba"))
		'If s_Nm_Prueba = "" Then
		'	s_Nm_Prueba = CStr(valor(LIST_ASIGNATURA_DOCENTE,"s_NmPruebaC"))
		'End If
		
		n_Por_Prueba = request("Por_Prueba")
		'If n_Por_Prueba = "" Then
		'	n_Por_Prueba = CInt(valor(LIST_ASIGNATURA_DOCENTE,"s_PcPrueba"))
		'Else
		'	n_Por_Prueba = CInt(n_Por_Prueba)
		'End If
		s_Glosa = CStr(request("Glosa"))
		'If s_Glosa = "" Then
		'	s_Glosa = CStr(valor(LIST_ASIGNATURA_DOCENTE,"s_GlPrueba"))
		'End If
		d_Fc_dia_prueba = Cdate(request("Fecha_dia_prueba"))
		'If d_Fc_dia_prueba = "" Then
		'	d_Fc_dia_prueba = Cdate(valor(LIST_ASIGNATURA_DOCENTE,"s_FcDiaPrueba"))
		'Else
		'	d_Fc_dia_prueba = Cdate(request("Fecha_dia_prueba"))
		'End If
		s_NrRutProfe = CStr(Session("n_NrRutProfe"))
		n_PrPruebas = CInt(request("n_PrPruebas"))
		s_Activo = CStr(request("s_Activo"))
		s_NmAsigna = CStr(request("s_NmAsigna"))
		
		Call o.Prb_Modifica_Prueba(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, n_CdAsigna, s_TipoAsig, n_NrParalelo, n_NrPrueba, s_Nm_Prueba, n_Por_Prueba, n_PrPruebas, s_Glosa, d_Fc_dia_prueba, s_NrRutProfe, s_Activo, n_Cod_Mensaje )			
	End If
	
%>
<table width="950" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="3"><!--#include file="headerdocente.asp"--></td>
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
    <td width="731" valign="top"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="5">
	  <form action="prof_prb_crea.asp" method="post" name="form1">
        <tr> 
          <td width="696" height="65" valign="top">
          <%
		  If request("accion") = "<--Volver" Then
		  	response.redirect("prof_prb_consulta_asig.asp")
		  End If
		  
		  If request("accion") = "Crear Plantilla Pruebas" Then
		  	dim s_NrRutProfe, n_NrPruebasMin, n_PrPruebas
		  	s_NrRutProfe = ""
			n_NrAnoPrueba = 0
			n_NrPerPrueba = 0
			n_CdCarrera = 0
			s_NrMalla = ""
			n_CdAsigna = 0
			s_TipoAsig = ""
			n_NrParalelo = 0
			n_NrPruebasMin = 0
			n_PrPruebas = 0		
		  	s_NrRutProfe = CStr(Session("n_NrRutProfe"))
			n_NrAnoPrueba = CInt(request("n_NrAnoPrueba"))
			n_NrPerPrueba = CInt(request("n_NrPerPrueba"))
			n_CdCarrera = CInt(request("n_CdCarrera"))
			s_NrMalla = CStr(request("s_NrMalla"))
			n_CdAsigna = CDbl(request("n_CdAsigna"))
			s_TipoAsig = CStr(request("s_TipoAsig"))
			n_NrParalelo = CInt(request("n_NrParalelo"))
			n_NrPruebasMin = CInt(request("n_NrPruebasMin"))
			n_PrPruebas = CInt(request("n_PrPruebas"))
			s_Activo = CStr(request("s_Activo"))
			s_NmAsigna = CStr(request("s_NmAsigna"))
			
		  	Call o.Prb_Genera_Multiples_Prueba_Actividad(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, n_CdAsigna, s_TipoAsig, n_NrParalelo, s_NrRutProfe, n_PrPruebas, n_NrPruebasMin, s_Activo, n_Cod_Mensaje)			
		  End If
		  
		  %>
          <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><p><img src="img/portaldocente.jpg" width="277" height="16"></p>
                    </td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
			<span class="texto">Periodo:</span>            <span class="respuesta">
			<strong>
			<% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
&nbsp;</strong>&nbsp; </span><span class="texto">Fecha:</span><span class="respuesta Estilo2">
            <% call response.write (d_FcSistema) %>
            &nbsp;</span><span class="texto"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC"></font></font></strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><font color="#3399CC">&nbsp; </font></font>Nombres:</span><span class="respuesta"><strong>
            <% call response.write (s_NmBrsProfe) %>
            </strong></span></td>
        </tr>
        <tr> 
          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="3" class="txtitulo">Creaci&oacute;n de pruebas </td>
              </tr>
            <tr>
              <td colspan="3" class="texto">Asignatura:&nbsp;<%=s_NmAsigna%></td>
            </tr>
            <tr>
              <td colspan="2" class="texto">Actividad:&nbsp;<%=s_TipoAsig%></td>
              <td width="76%" align="right" class="texto"><a href="documentos/MANUAL_DE_USUARIO_CREACION_DE_PRUEBAS.pdf" target="_blank">Ver Manual de Usuario de creaci&oacute;n de pruebas</a></td>
            </tr>
            <tr>
              <td colspan="3" class="texto">Paralelo:&nbsp;<%=n_NrParalelo%></td>
              </tr>
            <tr>
              <td colspan="3"></td>
            </tr>
			
            <tr>
              <td colspan="3">
        </td>
            </tr>
            <tr>
              <td colspan="3">
              <%
			'  If n_Cod_Mensaje = 104 Then
			  		'response.write("Error: CONTACTESE CON DGP PARA QUE INGRESEN  NUMERO DE PRUEBAS O %")
			'  ElseIf n_Cod_Mensaje = 106 Then	
			'  		response.write("Error: PARA ELIMINAR UNA PRUEBA DEBE TENER MAS QUE EL MINIMO, CONTACTAR A DGP PARA MODIFICAR EL NUMERO MINIMO DE PRUEBAS")		
			'  End If
		  %>
              </td>
            </tr>
            <tr>
              <td colspan="3">
              <%
			  dim ASIGNATURA_DOCENTE, LIST_ASIGNATURA_DOCENTE
			  
				xml = o.Prb_Consulta_Pruebas_Asignatura_Profesor(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, n_CdAsigna, s_TipoAsig, n_NrParalelo)
				Set doc = Server.CreateObject ("MSXML.DomDocument")
				Call doc.loadxml (xml)
				set ASIGNATURA_DOCENTE = doc.selectNodes("//ASIGNATURA_DOCENTE/LIST_ASIGNATURA_DOCENTE")
				%>
                <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr  bgcolor="#E4E4E4" class="texto" align="center">
                  <td width="2%">&nbsp;</td>
                  <td width="2%">N&deg;</td>
                  <td width="6%">Tp</td>
                  <td width="32%">Nombre Prueba</td>
                  <td width="5%">%</td>
                  <td width="32%" bgcolor="#E4E4E4">Glosa</td>
                  <td width="10%">Fec d&iacute;a Prb</td>
                  <td width="11%">Fec Reg Prb</td>
                  </tr>
                <% TotalPrb = 0
				 set LIST_ASIGNATURA_DOCENTE = ASIGNATURA_DOCENTE.nextNode 
                   while not (LIST_ASIGNATURA_DOCENTE is nothing)
				  		TotalPrb = TotalPrb + CInt(valor(LIST_ASIGNATURA_DOCENTE,"s_PcPrueba"))%>
                <tr class="texto">
                  <td align="center"><input type="radio" name="RbEliminar" id="radio" value="<%=n_CdReg%>" onClick="MostrarInfo('<%=valor(LIST_ASIGNATURA_DOCENTE,"s_NmPruebaC")%>', '<%=valor(LIST_ASIGNATURA_DOCENTE,"s_PcPrueba")%>', '<%=valor(LIST_ASIGNATURA_DOCENTE,"s_GlPrueba")%>', '<%=valor(LIST_ASIGNATURA_DOCENTE,"s_FcDiaPrueba")%>', '<%=valor(LIST_ASIGNATURA_DOCENTE,"s_NrPruebasC")%>')"></td>
                  <td align="center"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_NrPruebasC") %></td>
                  <td align="center"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_TpPrueba") %></td>
                  <td align="left"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_NmPruebaC") %>&nbsp;</td>
                  <td align="center"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_PcPrueba") %></td>
                  <td align="left"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_GlPrueba") %>&nbsp;</td>
                  <td align="right"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_FcDiaPrueba") %>&nbsp;</td>
                  <td align="right"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_FcPrueba") %>&nbsp;</td>
                  </tr>
                <% set LIST_ASIGNATURA_DOCENTE = ASIGNATURA_DOCENTE.nextNode
				   wend %>
              </table></td>
            </tr>
            <tr><td width="5%">&nbsp;</td></tr>
            <tr class="texto">
              <td colspan="3">&nbsp;
<input name="TotalPrb" type="hidden" id="TotalPrb" value="<%=TotalPrb%>">
% de pruebas creadas: <%=TotalPrb%> %</td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
              <td colspan="3"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr class="texto">
                  <td width="29%" align="center"><input type="submit" name="accion" class="Submit" id="accion" value="Crear Plantilla Pruebas"></td>
                  <td width="28%">M&iacute;nimo de pruebas ha crear: <strong><%=n_NrPruebasMin%></strong></td>
                  <td width="40%">Porcentaje de pruebas Total: <strong><%=n_PrPruebas%> %</strong></td>
                  <td width="3%">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3"><input name="n_NrAnoPrueba" type="hidden" id="n_NrAnoPrueba" value="<%=n_NrAnoPrueba%>">
                <input name="n_NrPerPrueba" type="hidden" id="n_NrPerPrueba" value="<%=n_NrPerPrueba%>">
                <input name="n_CdCarrera" type="hidden" id="n_CdCarrera" value="<%=n_CdCarrera%>">
                <input name="s_NrMalla" type="hidden" id="s_NrMalla" value="<%=s_NrMalla%>">
                <input name="n_CdAsigna" type="hidden" id="n_CdAsigna" value="<%=n_CdAsigna%>">
                <input name="s_TipoAsig" type="hidden" id="s_TipoAsig" value="<%=s_TipoAsig%>">
                <input name="n_NrParalelo" type="hidden" id="n_NrParalelo" value="<%=n_NrParalelo%>">
                <input name="n_NrPruebasMin" type="hidden" id="n_NrPruebasMin" value="<%=n_NrPruebasMin%>">
				<input name="s_Activo" type="hidden" id="s_Activo" value="<%=s_Activo%>">
                <input name="n_PrPruebas" type="hidden" id="n_PrPruebas" value="<%=n_PrPruebas%>">
                <%s_CdPrb = s_CdPrb2%>
                <input name="s_CdPrb" type="hidden" id="s_CdPrb" value="<%=s_CdPrb%>">
                <input name="s_NmAsigna" type="hidden" id="s_NmAsigna" value="<%=s_NmAsigna%>"></td>
            </tr>
            <tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3">
              <table width="100%" border="1" cellpadding="0" cellspacing="0"><tr><td>
              <table width="100%" border="0" cellpadding="0" cellspacing="2"><tr><td class="txsubtitulo">Cuadro para crear, modificar o eliminar pruebas.&nbsp;</td></tr>
              <tr>
              <td colspan="3"><table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr align="center" bgcolor="#E4E4E4" class="texto">
                  <td width="12%">&nbsp;</td>
                  <td width="31%">Nombre Prueba</td>
                  <td width="10%">% Prueba</td>
                  <td width="31%">Glosa</td>
                  <td width="16%">Fecha d&iacute;a Prueba</td>
                </tr>
                <tr class="texto">
                  <td><select name="Seleccionar" class="SELECT" id="Seleccionar">
                    <option value="Eliminar" selected="selected">Eliminar</option>
                    <option value="Modificar">Modificar</option>
                    <option value="Nuevo">Nuevo</option>
                  </select></td>
                  <td align="left"><input name="Nombre_Prueba" type="text" id="Nombre_Prueba" size="30" maxlength="90"></td>
                  <td align="center"><input name="Por_Prueba" type="text" id="Por_Prueba" size="5" maxlength="3"></td>
                  <td align="left"><input name="Glosa" type="text" id="Glosa" size="30" maxlength="90"></td>
                  <td align="center"><input name="Fecha_dia_prueba" type="text" id="Fecha_dia_prueba" size="10" maxlength="10">
                    <input name="n_NrPrueba" type="hidden" id="n_NrPrueba" value="<%=n_NrPrueba%>"></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="3"><input name="accion" type="submit" class="Submit" id="accion" value="Realizar" onClick="return ValidaForm();"></td>
            </tr>
            </table>
            </td></tr></table>
            </td>
            </tr>
            
            
            <tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            
            <tr>
              <td colspan="3" class="txsubtitulo"><div align="right">
                <input name="accion" type="submit" class="Submit" id="accion" value="&lt;--Volver">
              </div></td>
            </tr>

            <tr>
              <td colspan="2" class="texto">&nbsp;</td>
              <td class="respuesta">&nbsp;</td>
            </tr>
          </table>
           </td>
        </tr>
        <tr>
          <td valign="top">
		  <%
		  If (request("accion") = "Crear Plantilla Pruebas") then
			  If n_Cod_Mensaje = 100 Then%>
						<script type='Text/javascript'>alert('ATENCION: FECHA DE CREACION DE PRUEBAS EXPIRO!');</script>
			  <% 
			  ElseIf n_Cod_Mensaje = 104 Then%>
						<script type='Text/javascript'>alert('ATENCION: CONTACTESE CON JEFE DE CARRERA PARA QUE INGRESEN  NUMERO DE PRUEBAS O %');</script>
			  <% 
			  ElseIf n_Cod_Mensaje = 105 Then%>
						<script type='Text/javascript'>alert('ATENCION: TIENE PRUEBAS CREADAS, NO ES POSIBLE GENERAR PLANTILLA');</script>
			  <%
			  End If
		  End If
          
		  if request("accion") = "Realizar" and (request("Seleccionar") = "Eliminar" or request("Seleccionar") = "Modificar" or request("Seleccionar") = "Nuevo") then
		  		If n_Cod_Mensaje = 104 Then%>
                    <script type='Text/javascript'>alert('ATENCION: CONTACTESE CON SU JEFE DE CARRERA PARA QUE INGRESEN  NUMERO DE PRUEBAS O %!');</script>
			  <%ElseIf n_Cod_Mensaje = 100 Then%>
                    <script type='Text/javascript'>alert('ATENCION: FECHA DE CREACION DE PRUEBAS EXPIRO!');</script>
              <%ElseIf n_Cod_Mensaje = 106 Then%>
                    <script type='Text/javascript'>alert('ATENCION: PARA ELIMINAR UNA PRUEBA DEBE TENER MAS QUE EL MINIMO, CONTACTAR A JEFE DE CARRERA PARA MODIFICAR EL NUMERO MINIMO DE PRUEBAS!');</script>
              <%ElseIf n_Cod_Mensaje = 200 Then%>
                    <script type='Text/javascript'>alert('ATENCION: ');</script>
			  <%ElseIf n_Cod_Mensaje = 107 Then%>
                    <script type='Text/javascript'>alert('ATENCION: LA SUMA DEL % DE PRUEBAS NO PUEDE SER MAYOR AL % DECLARADO!');</script>
              <%Else
		  			Response.Redirect("prof_prb_crea.asp?s_CdPrb"&"="&n_CdCarrera&"*"&s_NmCarrera&"*"&n_NrAnoPrueba&"*"&n_NrPerPrueba&"*"&s_NrMalla&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&s_Activo&"*"&s_CdRegimen&"*"&n_CdAsigna&"*"&n_NrPruebasMin&"*"&n_PrPruebas&"*"&s_NmAsigna)
				End If 
		  End If%></td>
        </tr>
		</form>
      </table></td>
    <td width="29" valign="top"></td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table>
<%set o = nothing %>
</body>
</html>
