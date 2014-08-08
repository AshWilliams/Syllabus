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

//-->
</script>

<style type="text/css">
<!--
.Estilo2 {font-size: 9px; }
.Estilo4 {	font-size: 10px;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega();return false;MM_preloadImages('../img/home2.jpg')">
<%  Dim o, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema
    
	function Valor(nodo,etiqueta)
       valor = nodo.selectSingleNode(etiqueta).text
    end function
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
	
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	s_NmBrsProfe = ""
	d_FcSistema=#12-1-1999#
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
	Set o = getComponent()
	
	d_fecha = date()
	If d_fecha <> "" Then
		n_DiaSistema = Separa(d_fecha)
		n_MesSistema = Separa(d_fecha)
		n_AnoSistema = Separa(d_fecha)
	End If
	
	%>
    <script type='Text/javascript'>alert('¡ATENCIÓN, REALIZAR UNA ÚNICA BOLETA DE HONORARIOS POR TODOS LOS PAGOS DEL MES!');</script>
    <%
	'If s_StringAsig = ""  Then		
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		d_fechaR = date()
		h_hora = time()
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "2_3"
		idsession = Session.SessionID 'obtiene el número único de la session que entrega el servidor, no es modificable.
		var = INSTR (1, d_fechaR, "/") 'busca el caracter especificado en la cadena
		var2 = INSTR (1, d_fechaR, "-") 
		If var > 0 and var2 = 0 then
			fecha = REPLACE (d_fechaR, "/", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena 
		End If
		If var2 > 0 and var = 0 then
			fecha = REPLACE (d_fechaR, "-", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena
		End If
		'fin funcion de escaneo de fecha		
		'archivo= request.serverVariables("APPL_PHYSICAL_PATH") &"Portal_uvm\log\"&n_NrRutProfe&"_"&fecha&".txt" 'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
		'***** ESTE PATH ES PARA EL SERVER, EL DE ARRIBA ES PARA EL EQUIPO LOCAL ********
		'archivo= request.serverVariables("APPL_PHYSICAL_PATH")&"log\"&n_NrAnoActivo&"_"&n_NrPerActivo&".txt"  'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
		'set confile = createObject("scripting.filesystemobject") 
		'set fich = confile.OpenTextFile(archivo,8,1) 'el 8 quiere decir va a ingresar otro registro y no modifica el existente y el 1 es por si no existe el archivo txt lo crea
		'fich.WriteBlankLines(1)  'da un salto de linea (1)... puede ser (1), (2), etc.
		'fich.write(s_opcion&"	"&n_modulo&"	"&n_NrRutProfe&"	"&fecha&"	"&h_hora&"	"&idsession)'escribe el archivo según parametros entregados
		'fich.close() 'se cierra el archivo
		'********  FIN FUNCION  *****************
	'End If
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
      <table width="570" border="0" cellpadding="0" cellspacing="3">
        <tr> 
          <td height="65" colspan="2" valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><p><img src="img/portaldocente.jpg" width="277" height="16"></p>
                  </td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
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
</strong></span> </td>
        </tr>
        <tr> 
          <td colspan="2" valign="top" class="txtitulo">ESTA ES SU CARGA DOCENTE    PARA EL SEMESTRE OTO&Ntilde;O 2011</td>
        </tr>
        <tr>
          <td colspan="2" valign="top" class="txsubtitulo"><div align="right"> </div></td>
        </tr>
        <tr>
          <td colspan="2" valign="top" class="txsubtitulo">
          <table width="100%">
          	<tr><td width="33%">&nbsp;</td>
          	  <td width="33%" align="center"><img src="img/exc.gif" width="40" height="40"></td>
          	  <td width="33%">&nbsp;</td>
          	</tr>
          	<tr bgcolor="#FFFF66">
            	<td colspan="3" bgcolor="#FFFF99" class="Mensaje_Atencion">
               &nbsp;&nbsp;<strong>¡ATENCIÓN, REALIZAR UNA ÚNICA BOLETA DE HONORARIOS POR TODOS LOS PAGOS DEL MES!</strong><br><br>
                &nbsp;&nbsp;<a href="PROCEDIMIENTO CANCELACION HONORARIOS DOCENTES.pdf" target="_blank">Hacer clic, para ver manual de Procedimiento.</a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td colspan="2" valign="top" class="txsubtitulo">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" valign="top" class="texto"><strong>Sus consultas al jefe de carrera respectivo </strong></td>
        </tr>
        <tr>
          <td width="283" valign="top" class="txsubtitulo"><div align="right"><a href="historico_boletas_boletas_emitidas.asp">Boletas registradas >></a> </div></td>
          <td width="283" valign="top" class="txsubtitulo"><div align="right"><a href="historico_boletas_cuotas_semestre.asp">Detalle carga docente del semestre>></a> </div></td>
        </tr>
        <tr>
          <td colspan="2" valign="top"><table width="560" border="1" cellpadding="4" cellspacing="0" bordercolor="#999999">
            <tr bgcolor="#666666">
              <td colspan="7" class="texto"><strong><font color="#FFFFFF">BOLETAS DE DOCENCIA A EMITIR</font></strong></td>
            </tr>
            <tr bgcolor="#CCCCCC" class="texto">
              <td width="18"><div align="center"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                  <% 'n_NrRutProfe = 3398351
				     'n_AnoSistema = 2009
					 'n_NrPerActivo = 1
                         xml = o.Consulta_Asignaturas_Cuota_Semestre(n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo) 
                         Set doc = Server.CreateObject ("MSXML.DomDocument")
                         Call doc.loadxml (xml)
                         set CARGA_DOCENTE_F = doc.selectNodes("//CARGA_DOCENTE_F/LIST_CARGA_DOCENTE_F") 
                          %>
              </font>N&ordm;</strong></div></td>
              <td width="70"><div align="center"><strong>Mes</strong></div></td>
              <td width="266"><div align="center"><strong>Unidad Acad&eacute;mica</strong></div></td>              
              <td width="49"><div align="center"><strong>Monto Bruto $</strong></div></td>
			  <td width="46"><div align="center"><strong>.</strong></div></td>
			  <td width="49"><div align="center"><strong>Boletas a Emitir para Docente Honorario </strong></div></td>
            </tr>
            <%		Dim arrDualArray( 100,6), y
    x=0		  
	
	
			set LIST_CARGA_DOCENTE_F= CARGA_DOCENTE_F.nextNode
			 while not (LIST_CARGA_DOCENTE_F is nothing)
			       arrDualArray(x,0) =  Cint(valor(LIST_CARGA_DOCENTE_F,"s_NrMesF"))
				   arrDualArray(x,1) =  (valor(LIST_CARGA_DOCENTE_F,"s_NmMesF"))
			       arrDualArray(x,2) =  (valor(LIST_CARGA_DOCENTE_F,"s_NmUnidadAcadF"))
				   arrDualArray(x,3) =  (valor(LIST_CARGA_DOCENTE_F,"s_CdUnidadAcadF"))
			       arrDualArray(x,4) =  (valor(LIST_CARGA_DOCENTE_F,"s_DebeF"))
				   arrDualArray(x,5) =  (valor(LIST_CARGA_DOCENTE_F,"s_CdEstadoF"))
				   arrDualArray(x,6) =  (valor(LIST_CARGA_DOCENTE_F,"s_TpConsultaF"))
			x=x+1						
	        set LIST_CARGA_DOCENTE_F= CARGA_DOCENTE_F.nextNode
     wend 
			
	 For x = 0 to  uBound(arrDualArray) -1
	    For y = x + 1  to  uBound(arrDualArray)
		    If arrDualArray( x, 0 ) > arrDualArray( y, 0 ) Then
			   Temp0 = arrDualArray(x,0)
			   Temp1 = arrDualArray(x,1)
			   Temp2 = arrDualArray(x,2)
			   Temp3 = arrDualArray(x,3)
			   Temp4 = arrDualArray(x,4)
			   Temp5 = arrDualArray(x,5)
			   Temp6 = arrDualArray(x,6)
			   arrDualArray(x,0) =  arrDualArray(y,0)
			   arrDualArray(x,1) =  arrDualArray(y,1)
			   arrDualArray(x,2) =  arrDualArray(y,2)
			   arrDualArray(x,3) =  arrDualArray(y,3)
			   arrDualArray(x,4) =  arrDualArray(y,4)
			   arrDualArray(x,5) =  arrDualArray(y,5)
			   arrDualArray(x,6) =  arrDualArray(y,6)
			   arrDualArray(y,0) = Temp0 
			   arrDualArray(y,1) = Temp1
			   arrDualArray(y,2) = Temp2 
			   arrDualArray(y,3) = Temp3 
			   arrDualArray(y,4) = Temp4  
			   arrDualArray(y,5) = Temp5  
  		       arrDualArray(y,6) = Temp6  
			 End If
		Next
    Next 
			 
			 
			n_NrContador = 1
							
			For i = LBound(arrDualArray) to UBound(arrDualArray)
		           If arrDualArray(i, 0) <> "" Then 
			 
			   %>
			 
            <tr class="texto">
              <td class="texto"><div align="center" >
                <div align="left"><strong><font face="Arial, Helvetica, sans-serif"><span class="Estilo4"><strong><font face="Arial, Helvetica, sans-serif">
                   <% call response.write (n_NrContador&".-") %>
                </font></strong></span>
                </font></strong></div>
              </div></td>
              <td class="texto"><div align="center" >
                <div align="left"><font face="Arial, Helvetica, sans-serif">
                    <%Response.Write arrDualArray(i, 1)%>
                </font></div>
              </div></td>
              <td class="texto"><div align="center" >
                <div align="left"><font face="Arial, Helvetica, sans-serif">
                    <%Response.Write arrDualArray(i, 2)%>
                </font></div>
              </div></td>
             
              <td><div align="right" ><span class="texto"><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif">
                  <% response.write FormatNumber((arrDualArray(i, 4)),0)%></a>
              </font></strong></font></span>                                                          
              </div></td>
               <td><div align="center"><strong><a href="historico_boletas_cuotas_mes.asp?s_codigo=<%= arrDualArray(i, 1)&"*"&arrDualArray(i, 0)&"*"&arrDualArray(i, 2)&"*"&arrDualArray(i, 3)&"*"&arrDualArray(i, 6)%>">
				  <%response.write"Detalle"%></a></strong></div></td>
			  <td><div align="center"><span class="texto"><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif">
                    <% If arrDualArray(i, 5) = "1" Then %>
                    <font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><img src="img/row_i.gif" width="13" height="13" border="0"></font></strong></font></font></strong></font></strong></font><%Else %>
					<font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><img src="img/blancoi.gif" width="11" height="13" border="0"></font></strong></font></font></strong></font></strong></font> <% End IF %>
                    </font></strong></font></span>                                                          
              </div></td>
            <%  n_NrContador = n_Nrcontador + 1
			    n_TotalPagoSemestre = n_TotalPagoSemestre +  CDbl(arrDualArray(i, 4))
		  	  End If	
		Next
				%>
				<Tr><Td colspan="4"><div align="right" class="texto"><strong> TOTAL BRUTO SEMESTRE DOCENCIA $ &nbsp; &nbsp; &nbsp; &nbsp;
                        <%response.write FormatNumber((n_TotalPagoSemestre),0)%>
				  </strong></div></Td>
				</Tr>
          </table></td>
        </tr>
		<tr>
          <td colspan="2" valign="top" class="txsubtitulo"><div align="right"></div>            <div align="right"></div></td>
        </tr>
		<tr>
		  <td colspan="2" valign="top" class="txsubtitulo">&nbsp;</td>
	    </tr>
		<tr>
		  <td colspan="2" valign="top" class="txsubtitulo"><table width="560" border="1" cellpadding="4" cellspacing="0" bordercolor="#999999">
            <tr bgcolor="#666666">
              <td colspan="7" class="texto"><strong><font color="#FFFFFF">BOLETAS DE TITULACION A EMITIR</font></strong></td>
            </tr>
            <tr bgcolor="#CCCCCC" class="texto">
              <td width="18"><div align="center"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                  <% 'n_NrRutProfe = 3398351
				     'n_AnoSistema = 2009
					 'n_NrPerActivo = 1
					     n_NrContadorT = 1  
                         xml = o.Consulta_Titulacion_Cuota_Semestre(n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo) 
                         Set doc = Server.CreateObject ("MSXML.DomDocument")
                         Call doc.loadxml (xml)
                         set CARGA_DOCENTE_T = doc.selectNodes("//CARGA_DOCENTE_T/LIST_CARGA_DOCENTE_T") 
                          %>
              </font>N&ordm;</strong></div></td>
              <td width="70"><div align="center"><strong>Mes</strong></div></td>
              <td width="266"><div align="center"><strong>Unidad Acad&eacute;mica</strong></div></td>
              <td width="49"><div align="center"><strong>Monto Bruto $</strong></div></td>
              <td width="46"><div align="center"><strong>.</strong></div></td>
              <td width="49"><div align="center"><strong>Boletas a Emitir </strong></div></td>
            </tr>
            <%  set LIST_CARGA_DOCENTE_T= CARGA_DOCENTE_T.nextNode
			 while not (LIST_CARGA_DOCENTE_T is nothing)	
			
			 %>
            <tr class="texto">
              <td class="texto"><div align="center" >
                  <div align="left"><strong><font face="Arial, Helvetica, sans-serif"><span class="Estilo4"><strong><font face="Arial, Helvetica, sans-serif">
                    <% call response.write (n_NrContadorT&".-") %>
                  </font></strong></span> </font></strong></div>
              </div></td>
              <td class="texto"><div align="center" >
                  <div align="left"><font face="Arial, Helvetica, sans-serif">
                     <%response.write (valor(LIST_CARGA_DOCENTE_T,"s_NmMesT"))%>
                  </font></div>
              </div></td>
              <td class="texto"><div align="center" >
                  <div align="left"><font face="Arial, Helvetica, sans-serif">
                    <%response.write (valor(LIST_CARGA_DOCENTE_T,"s_NmUnidadAcadT"))%>
                  </font></div>
              </div></td>
              <td><div align="right" ><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif">
				  <% response.write FormatNumber( (valor(LIST_CARGA_DOCENTE_T,"s_DebeT")),0) %>
              </font></strong></font> </div></td>
              <td><div align="center"><strong><a href="historico_boletas_cuotas_mes.asp?s_codigo=<%= valor(LIST_CARGA_DOCENTE_T,"s_NmMesT")&"*"&valor(LIST_CARGA_DOCENTE_T,"s_NrMesT")&"*"&valor(LIST_CARGA_DOCENTE_T,"s_NmUnidadAcadT")&"*"&valor(LIST_CARGA_DOCENTE_T,"s_CdUnidadAcadT")&"*"&valor(LIST_CARGA_DOCENTE_T,"s_TpConsultaT")%>">
                  <%response.write"Detalle"%>
              </a></strong></div></td>
              <td><div align="center"><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif">
                  <% If valor(LIST_CARGA_DOCENTE_T,"s_CdEstadoT") = "1"  Then %> 
                  <font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><img src="img/row_i.gif" width="13" height="13" border="0"></font></strong></font></font></strong></font></strong></font>
                  <%Else %>
                  <font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><strong><font face="Arial, Helvetica, sans-serif"><img src="img/blancoi.gif" width="11" height="13" border="0"></font></strong></font></font></strong></font></strong></font>
                  <% End IF %>
              </font></strong></font> </div></td>
              <%  n_NrContadorT = n_NrcontadorT + 1
			    n_TotalPagoSemestreT = n_TotalPagoSemestreT +  CDbl((valor(LIST_CARGA_DOCENTE_T,"s_DebeT")))
		  	  
		       set LIST_CARGA_DOCENTE_T= CARGA_DOCENTE_T.nextnode
               wend 
				%>
            <Tr>
              <Td colspan="4"><div align="right" class="texto"><strong> TOTAL BRUTO SEMESTRE TITULACION $ &nbsp; &nbsp; &nbsp; &nbsp;
                        <%response.write FormatNumber((n_TotalPagoSemestreT),0)%>
              </strong></div></Td>
            </Tr>
          </table></td>
	    </tr>
		<tr>
		  <td valign="top" class="txsubtitulo"><div align="right"><a href="historico_boletas_boletas_emitidas.asp">Boletas registradas >></a> </div></td>
	      <td width="283" valign="top" class="txsubtitulo"><div align="right"><a href="historico_boletas_cuotas_semestre.asp">Detalle carga docente del semestre>></a> </div></td>
		</tr>
      </table></td>
    <td width="190" valign="top"></td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table>
<%set o = nothing %>
</body>
</html>
