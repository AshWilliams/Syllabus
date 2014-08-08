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
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu()">
<%  Dim o, doc, xml, ASIGNATURAS, LISTAASIGNATURAS, ALUMNOS, ASISTENCIA, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer,s_NrMalla, s_NrParale, s_CdAsigna, s_NmCarrer, s_NmAsigna, n_Sw, n_NrContador, s_NrRutAluDv, s_NmAlumno, s_NrOportu, s_VlNotaPr, s_VlNotaEx, s_VlNotaTc, s_NotaConcepto, s_GlNotaCo
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
	d_FcSistema=#12-1-1999#
	s_StringAsig = ""
    s_CdCarrer = ""
	s_NrMalla  = ""
	s_NrParale = ""
	s_CdAsigna = ""
	s_NmCarrer = ""
	s_NmAsigna = ""
	n_Sw = 0
	n_NrContador = 1
	s_NrRutAluDv = ""
	s_NmAlumno =""
	s_NrOportu = ""
	s_VlNotaPr = ""
	s_VlNotaEx = ""
	s_VlNotaTc = ""
	s_NotaConcepto = ""
	s_GlNotaCo = ""
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	If n_NrRutProfe = 0 Then
		Response.Redirect("http://intranet.uvm.cl/Portal_uvm/login3.asp")
    End If
	Session.TimeOut = 10	
	s_StringAsig = Request("s_StringAsig")
	s_CdCarrer = Cstr(Separa(s_StringAsig))						   
	s_NmCarrer = Cstr(Separa(s_StringAsig))						   						   
	s_NrParale = Cstr(Separa(s_StringAsig))
    s_NrMalla = Cstr(Separa(s_StringAsig))
    s_CdAsigna = Cstr(Separa(s_StringAsig))
	s_NmAsigna = s_StringAsig
	Set o = getComponent()
	
	 'If s_StringAsig = ""  Then
	'	d_fecha = date()
	'	h_hora = time()
	'	'***********  FUNCION PARA EL REGISTRO DE LOG ***************
	'	'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
	'	'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
	'	var = 0
	'	var2 = 0
	'	s_opcion = "D"	
	'	n_modulo = "10"
	'	idsession = Session.SessionID 'obtiene el número único de la session que entrega el servidor, no es modificable.
	'	var = INSTR (1, d_fecha, "/") 'busca el caracter especificado en la cadena
	'	var2 = INSTR (1, d_fecha, "-") 
	'	If var > 0 and var2 = 0 then
	'		fecha = REPLACE (d_fecha, "/", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena 
	'	End If
	'	If var2 > 0 and var = 0 then
	'		fecha = REPLACE (d_fecha, "-", "_", 1, 3) 'el 1 es donde parte buscando y el 3 es cuantas veces cambia el caracter indicado en la cadena
	'	End If
	'	'fin funcion de escaneo de fecha		
	'	'archivo= request.serverVariables("APPL_PHYSICAL_PATH") &"Portal_uvm\log\"&n_NrRutProfe&"_"&fecha&".txt" 'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
	'	'***** ESTE PATH ES PARA EL SERVER, EL DE ARRIBA ES PARA EL EQUIPO LOCAL ********
	'	archivo= request.serverVariables("APPL_PHYSICAL_PATH")&"log\"&n_NrAnoActivo&"_"&n_NrPerActivo&".txt"  'se da path, raiz donde se encuentra el sitio y se modifica según parametros donde se quiera
	'	set confile = createObject("scripting.filesystemobject") 
	'	set fich = confile.OpenTextFile(archivo,8,1) 'el 8 quiere decir va a ingresar otro registro y no modifica el existente y el 1 es por si no existe el archivo txt lo crea
	'	fich.WriteBlankLines(1)  'da un salto de linea (1)... puede ser (1), (2), etc.
	'	fich.write(s_opcion&"	"&n_modulo&"	"&n_NrRutProfe&"	"&fecha&"	"&h_hora&"	"&idsession)'escribe el archivo según parametros entregados
	'	fich.close() 'se cierra el archivo
	'	'********  FIN FUNCION  *****************
	'End If
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
    <td width="570" valign="top"> 
      <table width="570" border="0" cellpadding="0" cellspacing="5">
        <form enctype="application/x-www-form-urlencoded" method="post"  name="form_ingreso" id="form_ingreso" >
          <tr> 
            <td height="65" valign="top"> <div align="left"> 
                <table width="560" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td valign="top"><img src="img/portaldocente.jpg" width="277" height="16"></td>
                    <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                  </tr>
                </table>
              </div>
              <hr size="1" noshade></td>
          </tr>
          <tr> 
            <td valign="top" class="txsubtitulo">Documentos de Acreditaci&oacute;n Institucional</td>
          </tr>
          <tr> 
            <td valign="top">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top"><ul>
<li><a href="../docs/autoevaluacion2011.pdf" target="_blank" class="rel">Informe de Autoevaluaci&oacute;n Institucional 2011</a></li>
<li><a href="../docs/autoevaluacion2008.pdf" target="_blank" class="rel">Informe de autoevaluación institucional 2008</a></li>
<li><a href="../docs/ficha_Institucional.pdf" target="_blank" class="rel">Ficha institucional</a></li>
<li><a href="../docs/formularios .zip" target="_blank" class="rel">Formularios a,b y c de la CNA (para acreditación de carreras)</a></li>
<li><a href="../docs/manual_autoevaluacion.pdf" target="_blank" class="rel">Manual de autoevaluación de carreras</a></li>
<li><a href="../docs/manual_pares.pdf" target="_blank" class="rel">Manual de pares evaluadores para la acreditación de carreras</a></li>
      </ul></td>
          </tr>
          <tr>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top"><hr size="1" noshade></td>
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
  set ASIGNATURAS = nothing
  set LISTAASIGNATURAS = nothing
  set ALUMNOS = nothing
  set ASISTENCIA = nothing %>
</body>
</html>
