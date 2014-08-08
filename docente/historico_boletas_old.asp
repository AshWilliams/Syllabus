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

</head>
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega();return false;">
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
		archivo= request.serverVariables("APPL_PHYSICAL_PATH")&"log\"&n_NrAnoActivo&"_"&n_NrPerActivo&".txt"  'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
		set confile = createObject("scripting.filesystemobject") 
		set fich = confile.OpenTextFile(archivo,8,1) 'el 8 quiere decir va a ingresar otro registro y no modifica el existente y el 1 es por si no existe el archivo txt lo crea
		fich.WriteBlankLines(1)  'da un salto de linea (1)... puede ser (1), (2), etc.
		fich.write(s_opcion&"	"&n_modulo&"	"&n_NrRutProfe&"	"&fecha&"	"&h_hora&"	"&idsession)'escribe el archivo según parametros entregados
		fich.close() 'se cierra el archivo
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
      <table width="570" border="0" cellpadding="0" cellspacing="5">
        <tr> 
          <td height="65" valign="top"> <div align="left"> 
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
          <td valign="top" class="txtitulo">Hist&Oacute;rico de Boletas </td>
        </tr>
        <tr>
          <td valign="top" class="txsubtitulo"><div align="right"><a href="boleta.asp">Ir a Boletas &gt;&gt; </a> </div></td>
        </tr>
        <tr>
          <td valign="top"><table width="560" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
            <tr bgcolor="#666666">
              <td colspan="7" class="texto"><font color="#FFFFFF"><strong>Hist&oacute;rico de Boletas </strong></font></td>
            </tr>
            <tr bgcolor="#CCCCCC" class="texto">
              <td width="39"><div align="center"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                  <% 
                         xml = o.Consulta_Historico_Boleta(n_NrRutProfe, n_AnoSistema) 
                         Set doc = Server.CreateObject ("MSXML.DomDocument")
                         Call doc.loadxml (xml)
                         set BOLETA = doc.selectNodes("//BOLETA/LIST_BOLETA") 
                          %>
              </font>Nr Mes </strong></div></td>
              <td width="79"><div align="center"><strong>Nr Boleta </strong></div></td>
              <td width="70"><div align="center"><strong>Fc Boleta </strong></div></td>
              <td width="91"><div align="center"><strong>Rut Dest </strong></div></td>
              <td width="113"><div align="center"><strong>Nr Comprobante </strong></div></td>
              <td width="76"><div align="center"><strong>Sdo. Base </strong></div></td>
              <td width="62"><div align="center"><strong>Anulaci&oacute;n</strong></div></td>
            </tr>
            <%							  
			 set LIST_BOLETA= BOLETA.nextNode
			 while not (LIST_BOLETA is nothing)							  
						      %>
            <tr class="texto">
              <td><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_BOLETA,"s_NrMesPer"))%>
              </font></div></td>
              <td><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_BOLETA,"s_NrBoleta"))%>
              </font></div></td>
              <td><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_BOLETA,"s_FechaBoleta"))%>
              </font></div></td>
              <td><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">
                  <%response.write (valor(LIST_BOLETA,"s_NrRutDestinatario"))%>
              </font></div></td>
              <td><font size="2" face="Arial, Helvetica, sans-serif">
                <%response.write (valor(LIST_BOLETA,"s_NrComprobante"))%>
              </font></td>
              <td><font size="2" face="Arial, Helvetica, sans-serif">
                <%response.write (valor(LIST_BOLETA,"s_VlSuelBruto"))%>
              </font></td>
              <td><font size="2" face="Arial, Helvetica, sans-serif">
                <%'response.write (valor(LIST_BOLETA,"s_Anulacion"))%>
                <%If (valor(LIST_BOLETA,"s_Anulacion")) = "S" then%>
                <a ONMOUSEOVER="popup('<%response.write (valor(LIST_BOLETA,"s_GlConformidad"))%>','#FFFFCC')"; ONMOUSEOUT="kill()">
                <%response.write (valor(LIST_BOLETA,"s_Anulacion"))%>
                </a>
                <%Else
				     response.write (valor(LIST_BOLETA,"s_Anulacion"))
				  End If%>
              </font></td>
            </tr>
            <%set LIST_BOLETA= BOLETA.nextnode
              wend 
				%>
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
<%set o = nothing%>
</body>
</html>
