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

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega2();return false;">
<%  Dim n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, n_messistema, n_anosistema, n_AnoActivo, n_MesActivo, n_NrEstado, n_NrBoleta, n_SdoBruto, n_VlRetencion, n_VlLiqPag, n_AnoProcesar, n_MesProcesar
    dim s_NmBrsProfe, d_FcSistema, d_fecha, d_FcBoleta, s_GlPrestacion    
	 
    'Response.Buffer = True
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
	Function Cortar(s)
		dim text
		text = s
		pos = 0
		pos = InStr(text,"/")
		if pos > 0 then
	  		salida=left(text,pos-1)
		else
			salida=text
		end if
		s = Right(text,len(text)-pos)
		cortar = salida
	End function
	s_NmError = ""
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	s_NmBrsProfe = ""
	d_FcSistema=#12-1-1999#
	n_CdCodigo = 0
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	'd_fecha = d_FcSistema
	d_fecha = date()
	If d_fecha <> "" Then
		n_diasistema = Separa(d_fecha)
		n_messistema = Separa(d_fecha)
		n_anosistema = Separa(d_fecha)
	End If
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")	
	If n_NrRutProfe = 0 Then
		response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10	
	Set o = getComponent()
	n_CdCodigo = 0 
	n_CdCodigo = CInt(Request("n_CdCodigo"))
	
	call o.Valida_Proceso(n_messistema, n_anosistema, n_AnoActivo, n_MesActivo, n_NrEstado)
	if n_NrEstado = 2 Then
		s_NmError = "No existe Información generada aún para pago de remuneraciones"
	else 
	  if n_NrEstado = 100 Then
	     call o.Valida_Existencia_Boleta(n_NrRutProfe, n_NrBoleta, d_FcBoleta, s_GlPrestacion, n_SdoBruto, n_VlRetencion, n_VlLiqPag, n_AnoProcesar, n_MesProcesar, n_NrEstado)
		 If n_NrEstado = 101 Then
		    n_DiaBoleta = Separa(d_FcBoleta)
		    n_MesBoleta = Separa(d_FcBoleta)
		    n_AnoBoleta = Separa(d_FcBoleta)
			n_SdoBasCon = n_SdoBruto
		 End If
		 If n_NrEstado = 3 Then
	        call o.Consulta_Sueldo_Bruto(n_messistema, n_anosistema, n_NrRutProfe, n_SdoBasCon, s_NrTelFun, s_NmDireccion, s_NmComuna, n_NrEstado, n_MesProcesar, n_CdCodigo)
		    'call o.Consulta_Sueldo_Bruto(n_messistema, n_anosistema, n_NrRutProfe, n_SdoBasCon, n_NrTelFun, s_NmDireccion, s_NmComuna, n_NrEstado, n_MesProcesar, n_CdCodigo)
		    If  n_CdCodigo <> 3 or n_CdCodigo <> 4 then
			    n_NrEstado = 100
		    End If
		 End If
	  end If
	end If
	if n_CdCodigo = 3 Then
		s_NmError = "Aviso: Ya existe boleta registrada para este periodo."
	End if 
	if n_CdCodigo = 4 Then
		s_NmError = "Aviso: No existe monto a pagar."
	End if 
	s_ValidaError = Session("s_ValidaError")
	If s_ValidaError <> "" Then
		n_NrBoleta = Session("n_NrBoleta")
		n_DiaBoleta = Session("n_NrDia")
		n_messistema = Session("n_messistema")
		n_anosistema = Session("n_anosistema")
		n_SdoBasCon = Session("n_SdoBasCon")
		s_GlPrestacion = Session("s_GlPrest1")
		n_SdoBruto = Session("n_NrValor1")
		n_VlRetencion = Session("n_NrRetencion1")
		n_VlLiqPag = Session("n_NrTotal1")
		n_CdCodigo = Session("n_CdCodigo")
		'----------------
		Session.Contents.Remove("s_ValidaError")
		Session.Contents.Remove("n_NrBoleta")
		Session.Contents.Remove("n_NrDia")
		Session.Contents.Remove("n_messistema")
		Session.Contents.Remove("n_anosistema")
		Session.Contents.Remove("n_SdoBasCon")
		Session.Contents.Remove("s_GlPrest1")
		Session.Contents.Remove("n_NrValor1")
		Session.Contents.Remove("n_NrRetencion1")
		Session.Contents.Remove("n_NrTotal1")
		Session.Contents.Remove("n_CdCodigo")
	End If
	'If s_StringAsig = ""  Then
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "2_2"
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
	  <form action = "Boleta1_eje.asp" method="post" name="form1">
        <tr> 
          <td height="65" valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><p><img src="img/portaldocente.jpg" width="277" height="16"></p>
                    <p class="homeintrod">Docente:
                    <%response.write(s_NmBrsProfe)%></p></td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade>
            <span class="texto">Periodo:</span>            <span class="respuesta"><strong>
            <% call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
            &nbsp;</strong></span>&nbsp;
			<span class="texto">Fecha:</span>
			<span class="respuesta"><strong>
			<% call response.write (d_FcSistema) %>
			&nbsp;</strong></span>&nbsp;
			<span class="texto">Nombres:</span>
			<span class="respuesta"><strong>
			<% call response.write (s_NmBrsProfe) %>
            </strong></span></td>
        </tr>
        <tr> 
          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td colspan="2"><span class="txtitulo"><font size="2" face="Arial, Helvetica, sans-serif">Boletas Profesor 
                </font></span></td>
              </tr>
            <tr>
              <td colspan="2" class="txsubtitulo"><div align="right"><a href="historico_boletas.asp">Ir a Hist&oacute;rico de Boletas &gt;&gt;</a> </div></td>
            </tr>
            <tr>
              <td colspan="2"><span class="Estilo3"><font size="2" face="Arial, Helvetica, sans-serif">
                <%Response.write(s_NmError)%>
                <%Response.write(s_ValidaError)%>
              </font></span></td>
            </tr>
			  <%If n_NrEstado = 100 and n_NrEstado <> 2 then%>
            <tr>
              <td colspan="2"><span class="texto">Direcci&oacute;n:</span>                <span class="respuesta">
                <%Response.write(s_NmDireccion)%>
              </span> </td>
              </tr>
              <td colspan="2"><span class="texto">Comuna:</span>                <span class="respuesta">
                <%Response.write(s_NmComuna)%>
              </span> </td>
              </tr>
              <td colspan="2"><span class="texto">Fono:</span>                <span class="respuesta">
                <%Response.write(n_NrTelFun)%>
              </span> </td>
              </tr>
            <tr>
              <td width="28%">&nbsp;</td>
              <td width="72%" class="txsubtitulo">Valor Bruto: $ <font size="2" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;
                <%Response.write(n_SdoBasCon)%>
              </strong></font>.-</td>
            </tr>
			<%If n_NrEstado <> 101 then%>
            <tr>
              <td><div align="right" class="texto">
                <div align="right">&iquest;Confirma Monto? </div>
              </div></td>
              <td><input name="accion" type="submit" class="Submit" id="accion" value="SI">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input name="accion" type="submit" class="Submit" id="accion" value="NO"></td>
            </tr>
			<%If n_CdCodigo = 2 Then%>
            <tr>
              <td>&nbsp;</td>
              <td><textarea name="Observacion" class="input" id="Observacion" onChange="MM_validateForm('Observacion','','R');return document.MM_returnValue"></textarea></td>
            </tr>
            <tr>
              <td><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong><font size="2" face="Arial, Helvetica, sans-serif">
                <input name="n_NrRutProfe" type="hidden" id="n_NrRutProfe" value="<%=(n_NrRutProfe)%>">
              </font></strong></font></td>
              <td><input name="accion" type="submit" class="Submit" id="accion" onClick="MM_validateForm('Observacion','','R');return document.MM_returnValue" value="Enviar"></td>
            </tr>
			<%End if%>
            <%
			End If
			End If%>
          </table>
            <table width="100%"  border="0" cellspacing="0" cellpadding="2">
			<%If (n_CdCodigo = 100)  or (n_NrEstado = 101) then%>
              <tr>
                <td colspan="4"><font size="2" face="Arial, Helvetica, sans-serif" class="texto">
                  <%If n_MesProcesar = 1 Then
								     s_MesProcesar = "Enero"
								  End If
								  If n_MesProcesar = 2 Then
								     s_MesProcesar = "Febrero"
								  End If
								  If n_MesProcesar = 3 Then
								     s_MesProcesar = "Marzo"
								  End If
								  If n_MesProcesar = 4 Then
								     s_MesProcesar = "Abril"
								  End If
								  If n_MesProcesar = 5 Then
								     s_MesProcesar = "Mayo"
								  End If
								  If n_MesProcesar = 6 Then
								     s_MesProcesar = "Junio"
								  End If
								  If n_MesProcesar = 7 Then
								     s_MesProcesar = "Julio"
								  End If
								  If n_MesProcesar = 8 Then
								     s_MesProcesar = "Agosto"
								  End If
								  If n_MesProcesar = 9 Then
								     s_MesProcesar = "Septiembre"
								  End If
								  If n_MesProcesar = 10 Then
								     s_MesProcesar = "Octubre"
								  End If
								  If n_MesProcesar = 11 Then
								     s_MesProcesar = "Noviembre"
								  End If
								  If n_MesProcesar = 12 Then
								     s_MesProcesar = "Diciembre"
								  End If%>
                  <%If n_MesActivo = 1 Then
								     s_MesActivo = "Enero"
								  End If
								  If n_MesActivo = 2 Then
								     s_MesActivo = "Febrero"
								  End If
								  If n_MesActivo = 3 Then
								     s_MesActivo = "Marzo"
								  End If
								  If n_MesActivo = 4 Then
								     s_MesActivo = "Abril"
								  End If
								  If n_MesActivo = 5 Then
								     s_MesActivo = "Mayo"
								  End If
								  If n_MesActivo = 6 Then
								     s_MesActivo = "Junio"
								  End If
								  If n_MesActivo = 7 Then
								     s_MesActivo = "Julio"
								  End If
								  If n_MesActivo = 8 Then
								     s_MesActivo = "Agosto"
								  End If
								  If n_MesActivo = 9 Then
								     s_MesActivo = "Septiembre"
								  End If
								  If n_MesActivo = 10 Then
								     s_MesActivo = "Octubre"
								  End If
								  If n_MesActivo = 11 Then
								     s_MesActivo = "Noviembre"
								  End If
								  If n_MesActivo = 12 Then
								     s_MesActivo = "Diciembre"
								  End If%>
Sr(a). Profesor(a),
<%Response.write(s_NmBrsProfe)%>
, usted debe registrar los datos de su boleta correspondiente al mes de pago
( <%Response.write(s_MesProcesar)%>
). En caso de no tener boletas manuales, puede obtener boletas electr&oacute;nicas desde Servicio de Impuestos Internos SII. <a href="http://www.sii.cl/" target="_blank"><img src="img/sii.JPG" width="96" height="29" border="0"></a>. Despu&eacute;s de ello, deber&aacute; ingresar los datos solicitados a continuaci&oacute;n.</font></td>
              </tr>
              <tr>
                <td colspan="4">&nbsp;</td>
              </tr>
              <tr>
                <td width="46%" class="texto"><div align="right">Ingrese N&ordm; de Boleta </div></td>
                <td colspan="3"><font size="2" face="Arial, Helvetica, sans-serif">
                  <input name="NrBoleta" type="text" class="input" id="NrBoleta" value="<%=(n_NrBoleta)%>" size="7" maxlength="7">
                  <font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong>
                  <input name="n_NrBoleta" type="hidden" id="n_NrBoleta" value="<%=(n_NrBoleta)%>">
                  </strong></font></font></td>
              </tr>
              <tr>
                <td class="texto"><div align="right">Fecha:&nbsp;&nbsp;</div></td>
                <td colspan="3"><span class="texto">&nbsp;Dia</span> <font size="2" face="Arial, Helvetica, sans-serif">
                  <select name="dia" class="SELECT" id="dia">
  <option value="01" selected<%If n_DiaBoleta = 01 Then%>selected><%else%>><%end if%>01</option>
  <option value="02"<%If n_DiaBoleta = 02 Then%>selected><%else%>><%end if%>02</option>
  <option value="03"<%If n_DiaBoleta = 03 Then%>selected><%else%>><%end if%>03</option>
  <option value="04"<%If n_DiaBoleta = 04 Then%>selected><%else%>><%end if%>04</option>
  <option value="05"<%If n_DiaBoleta = 05 Then%>selected><%else%>><%end if%>05</option>
  <option value="06"<%If n_DiaBoleta = 06 Then%>selected><%else%>><%end if%>06</option>
  <option value="07"<%If n_DiaBoleta = 07 Then%>selected><%else%>><%end if%>07</option>
  <option value="08"<%If n_DiaBoleta = 08 Then%>selected><%else%>><%end if%>08</option>
  <option value="09"<%If n_DiaBoleta = 09 Then%>selected><%else%>><%end if%>09</option>
  <option value="10"<%If n_DiaBoleta = 10 Then%>selected><%else%>><%end if%>10</option>
  <option value="11"<%If n_DiaBoleta = 11 Then%>selected><%else%>><%end if%>11</option>
  <option value="12"<%If n_DiaBoleta = 12 Then%>selected><%else%>><%end if%>12</option>
  <option value="13"<%If n_DiaBoleta = 13 Then%>selected><%else%>><%end if%>13</option>
  <option value="14"<%If n_DiaBoleta = 14 Then%>selected><%else%>><%end if%>14</option>
  <option value="15"<%If n_DiaBoleta = 15 Then%>selected><%else%>><%end if%>15</option>
  <option value="16"<%If n_DiaBoleta = 16 Then%>selected><%else%>><%end if%>16</option>
  <option value="17"<%If n_DiaBoleta = 17 Then%>selected><%else%>><%end if%>17</option>
  <option value="18"<%If n_DiaBoleta = 18 Then%>selected><%else%>><%end if%>18</option>
  <option value="19"<%If n_DiaBoleta = 19 Then%>selected><%else%>><%end if%>19</option>
  <option value="20"<%If n_DiaBoleta = 20 Then%>selected><%else%>><%end if%>20</option>
  <option value="21"<%If n_DiaBoleta = 21 Then%>selected><%else%>><%end if%>21</option>
  <option value="22"<%If n_DiaBoleta = 22 Then%>selected><%else%>><%end if%>22</option>
  <option value="23"<%If n_DiaBoleta = 23 Then%>selected><%else%>><%end if%>23</option>
  <option value="24"<%If n_DiaBoleta = 24 Then%>selected><%else%>><%end if%>24</option>
  <option value="25"<%If n_DiaBoleta = 25 Then%>selected><%else%>><%end if%>25</option>
  <option value="26"<%If n_DiaBoleta = 26 Then%>selected><%else%>><%end if%>26</option>
  <option value="27"<%If n_DiaBoleta = 27 Then%>selected><%else%>><%end if%>27</option>
  <option value="28"<%If n_DiaBoleta = 28 Then%>selected><%else%>><%end if%>28</option>
  <option value="29"<%If n_DiaBoleta = 29 Then%>selected><%else%>><%end if%>29</option>
  <option value="30"<%If n_DiaBoleta = 30 Then%>selected><%else%>><%end if%>30</option>
  <option value="31"<%If n_DiaBoleta = 31 Then%>selected><%else%>><%end if%>31</option>
</select>
                </font><span class="texto">Correspondiente al mes de <font size="2" face="Arial, Helvetica, sans-serif">
                <%Response.write(s_MesActivo)%>
                </font>del a&ntilde;o <font size="2" face="Arial, Helvetica, sans-serif">
                <%response.write(n_AnoActivo)%>
. <font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong>
<input name="n_MesActivo" type="hidden" id="n_MesActivo" value="<%=(n_MesActivo)%>">
<input name="n_AnoActivo" type="hidden" id="n_AnoActivo" value="<%=(n_AnoActivo)%>">
</strong></font></font></span></td>
              </tr>
              <tr>
                <td class="texto"><div align="right">Rut del destinatario: &nbsp;&nbsp;</div></td>
                <td colspan="3"><font size="2" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;71629400</strong></font></td>
              </tr>
              <tr>
                <td><span class="texto">Prestaci&oacute;n </span><font size="1" face="Arial, Helvetica, sans-serif">                  
<input name="Prest1" type="text" class="input" id="Prest1" value="<%=(s_GlPrestacion)%>" size="32" maxlength="60">
                </font></td>
                <td width="15%"><span class="texto">valor<font size="1" face="Arial, Helvetica, sans-serif"></font></span><font size="1" face="Arial, Helvetica, sans-serif">
                  <input name="Valor1" type="text" class="input" id="Valor1" value="<%=(n_SdoBruto)%>" size="9" maxlength="9">
                </font><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong><font size="2" face="Arial, Helvetica, sans-serif">
                <input name="n_SdoBasCon" type="hidden" id="n_SdoBasCon" value="<%=(n_SdoBasCon)%>">
                </font></strong></font></td>
                <td width="20%"><span class="texto">Retenci&oacute;n<font size="1" face="Arial, Helvetica, sans-serif"></font></span><font size="1" face="Arial, Helvetica, sans-serif">
                  <input name="Retencion1" type="text" class="input" id="Retencion1" value="<%=(n_VlRetencion)%>" size="9" maxlength="9">
                </font></td>
                <td width="19%"><span class="texto">L&iacute;quido<font size="1" face="Arial, Helvetica, sans-serif"></font></span><font size="1" face="Arial, Helvetica, sans-serif">
                  <input name="Total1" type="text" class="input" id="Total1" value="<%=(n_VlLiqPag)%>" size="9" maxlength="9">
                </font></td>
              </tr>
              <tr>
                <td colspan="4">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="4"><font size="2" face="Arial, Helvetica, sans-serif"><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong>
                  <input name="n_AnoProcesar" type="hidden" id="n_AnoProcesar" value="<%=(n_AnoProcesar)%>">
                </strong></font></font><font size="2" face="Arial, Helvetica, sans-serif"><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong>
                <input name="n_MesProcesar" type="hidden" id="n_MesProcesar" value="<%=(n_MesProcesar)%>">
                </strong></font></font></td>
              </tr>
              <tr>
                <td colspan="3"><div align="right">
                  <%If n_NrEstado = 101 then%>
                  <input name="accion" type="submit" class="Submit" id="accion" value="Actualizar">
                  <%else%>
                  <input name="accion" type="submit" class="Submit" id="accion" onClick="MM_validateForm('NrBoleta','','RisNum','Prest1','','R','Valor1','','RisNum','Retencion1','','RisNum','Total1','','RisNum');return document.MM_returnValue" value="Guardar">
  <%End If%>
                </div></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="3">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
			  <%End If%>
            </table></td>
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
<% set o = nothing %>
</body>
</html>
