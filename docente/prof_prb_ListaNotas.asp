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
			 return true;
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
	  <form action="prof_prb_ListaNotas.asp" method="post" name="form1">
        <tr> 
          <td width="696" height="65" valign="top">
          <%
		  If request("accion") = "<--Volver" Then
		  	response.redirect("prof_prb_consulta_asig_np.asp")
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
              <td colspan="3" class="txtitulo">CONSULTA DE NOTAS PARCIALES<%=n_Cod_Mensaje%></td>
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
              <td colspan="3"></td>
            </tr>
			
            <tr>
              <td colspan="3">
        </td>
            </tr>
            <tr>
              <td colspan="3">
              
              </td>
            </tr>
            <tr>
              <td colspan="3">
              <%
			  dim ASIGNATURA_DOCENTE, LIST_ASIGNATURA_DOCENTE
			  
				xml = o.Prb_Consulta_Asignaturas_ListaNotas_Profesor(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, s_NrMalla, n_CdAsigna, s_TipoAsig, n_NrParalelo)
				Set doc = Server.CreateObject ("MSXML.DomDocument")
				Call doc.loadxml (xml)
				set ASIGNATURA_DOCENTE = doc.selectNodes("//ASIGNATURA_DOCENTE/LIST_ASIGNATURA_DOCENTE")
				%>
                <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr  bgcolor="#E4E4E4" class="texto" align="center">
                  <td width="9%">.</td>
                  <td width="30%">.</td>
                  <td width="6%">.</td>
                  <td width="6%">.</td>
                  <td width="6%">.</td>                  
                  <td width="6%">.</td>
                  <td width="6%">.</td>
				  <td width="6%">.</td>
                  <td width="6%">.</td> 
				  <td width="6%">.</td>
                  <td width="6%">.</td>
				  <td width="7%">.</td>
                  </tr>
                <% set LIST_ASIGNATURA_DOCENTE = ASIGNATURA_DOCENTE.nextNode 
                   while not (LIST_ASIGNATURA_DOCENTE is nothing)  TotalPrb = TotalPrb + 1 %>
                <tr class="texto">                  
                  <td align="right" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_NrRut") %>&nbsp;&nbsp;</td>
                  <td align="left" class="titular">&nbsp;&nbsp;<%= valor(LIST_ASIGNATURA_DOCENTE,"s_NmAlumno") %></td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb01") %>&nbsp;</td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb02") %>&nbsp;</td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb03") %>&nbsp;</td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb04") %>&nbsp;</td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb05") %>&nbsp;</td>
				   <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb06") %>&nbsp;</td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb07") %>&nbsp;</td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb08") %>&nbsp;</td>
				   <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb09") %>&nbsp;</td>
                  <td align="center" class="titular"><%= valor(LIST_ASIGNATURA_DOCENTE,"s_Prb10") %>&nbsp;</td>
               </tr>
                <% set LIST_ASIGNATURA_DOCENTE = ASIGNATURA_DOCENTE.nextNode
				   wend %>
              </table></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr class="texto">
              <td colspan="3">&nbsp;
<input name="TotalPrb" type="hidden" id="TotalPrb" value="<%=TotalPrb%>">
<span class="homearea">Total alumnos : <%=(TotalPrb - 1)%> </span></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
              
            </tr>
            <tr>
              <td colspan="3">
             
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
              
            </tr>
          </table>
           </td>
        </tr>
        <tr>
          <td valign="top">
		  <%	          
		  if request("accion") = "<-Volver" then
		  	  Response.Redirect("prof_prb_consulta_asig_np.asp?s_CdPrb"&"="&n_CdCarrera&"*"&s_NmCarrera&"*"&n_NrAnoPrueba&"*"&n_NrPerPrueba&"*"&s_NrMalla&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&s_Activo&"*"&s_CdRegimen&"*"&n_CdAsigna&"*"&n_NrPruebasMin&"*"&n_PrPruebas&"*"&s_NmAsigna)				
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
