<!--#include file="librDocenteUVM.inc"-->
<html>
<head>
<title>Resultado Evaluaci&oacute;n Docente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="estilos.css" rel="stylesheet" type="text/css">
<link href="estilos__.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function leerDatos()
{
var hf = document.getElementById("hf_cdasigna");
var hf2 = document.getElementById("hf_cdcarrera");
var hf3 = document.getElementById("hf_cdescuela");
var hf4 = document.getElementById("hf_cdmalla");
var hf5 = document.getElementById("hf_cdparalelo");
var hf6 = document.getElementById("hf_tipoasig");
var hf7 = document.getElementById("hf_rutdoc2");

//alert(hf);
var parametros = window.opener.prueba;
var parametros2 = window.opener.prueba2;
var parametros3 = window.opener.prueba3;
var parametros4 = window.opener.prueba4;
var parametros5 = window.opener.prueba5;
var parametros6 = window.opener.prueba6;
var parametros7 = window.opener.prueba7;

hf.value = parametros;
hf2.value = parametros2;
hf3.value = parametros3;
hf4.value = parametros4;
hf5.value = parametros5;
hf6.value = parametros6;
hf7.value = parametros7;
}


</script>
</head>

<body bgcolor="#CCCCCC" >
<%
n_ano = Session("n_ano")
n_periodo = Session("n_periodo")


	if Session("n_NrRutProfe") = "" then
		response.Redirect("http://www.uvm.cl")
	end if
	Session.TimeOut = 10
	param = ""
	param2 = ""
	param3 = ""
	param4 = ""
	param5 = ""
	param6 = ""
	param7 = ""
	
	param = request("hf_cdasigna")
	param2 = request("hf_cdcarrera")
	param3 = request("hf_cdescuela")
	param4 = request("hf_cdmalla")
	param5 = request("hf_cdparalelo")
	param6 = request("hf_tipoasig")
	param7 = request("hf_rutdoc2")
	'param = 11995021
	'param2 = 119
	'param3 = 29
	'param4 = "119005"
	'param5 = 1
	'param6 = "CAT"
	'd_FcSistema = date()
	'n_NrRutProfe = 15830102
	if param7 = "undefined" then
		'response.Write("rut sesion")
		n_NrRutProfe = Session("n_NrRutProfe")
	elseif param7 <> "undefined" then
	'response.Write("rut parametro :" & param7 )
		n_NrRutProfe = param7
	end if
	dim n_aaproceso, n_nrproceso, n_cdunidadacad, n_cdcarrer, n_nrmalla, n_cdasigna, s_tipoasig, n_nrparale, n_nrencuestados, n_nrinscritos
	dim n_rp01_siempre, n_rp01_casisiempre, n_rp01_ocasionalmente, n_rp01_casinunca, n_rp01_nunca, n_rp01_prompon, n_rp01_nota  
	dim	n_rp02_siempre, n_rp02_casisiempre, n_rp02_ocasionalmente, n_rp02_casinunca, n_rp02_nunca, n_rp02_prompon, n_rp02_nota
	dim	n_rp03_siempre, n_rp03_casisiempre, n_rp03_ocasionalmente, n_rp03_casinunca, n_rp03_nunca, n_rp03_prompon, n_rp03_nota  
	dim	n_rp04_siempre, n_rp04_casisiempre, n_rp04_ocasionalmente, n_rp04_casinunca, n_rp04_nunca, n_rp04_prompon, n_rp04_nota    
	dim	n_rp05_siempre, n_rp05_casisiempre, n_rp05_ocasionalmente, n_rp05_casinunca, n_rp05_nunca, n_rp05_prompon, n_rp05_nota 
	dim	n_rp06_siempre, n_rp06_casisiempre, n_rp06_ocasionalmente, n_rp06_casinunca, n_rp06_nunca, n_rp06_prompon, n_rp06_nota 
	dim	n_rp07_siempre, n_rp07_casisiempre, n_rp07_ocasionalmente, n_rp07_casinunca, n_rp07_nunca, n_rp07_prompon, n_rp07_nota
	dim	n_rp08_siempre, n_rp08_casisiempre, n_rp08_ocasionalmente, n_rp08_casinunca, n_rp08_nunca, n_rp08_prompon, n_rp08_nota
	dim	n_rp09_siempre, n_rp09_casisiempre, n_rp09_ocasionalmente, n_rp09_casinunca, n_rp09_nunca, n_rp09_prompon, n_rp09_nota
	dim	n_rp10_siempre, n_rp10_casisiempre, n_rp10_ocasionalmente, n_rp10_casinunca, n_rp10_nunca, n_rp10_prompon, n_rp10_nota          
	dim	n_rp11_siempre, n_rp11_casisiempre, n_rp11_ocasionalmente, n_rp11_casinunca, n_rp11_nunca, n_rp11_prompon, n_rp11_nota
	dim	n_rp12_siempre, n_rp12_casisiempre, n_rp12_ocasionalmente, n_rp12_casinunca, n_rp12_nunca, n_rp12_prompon, n_rp12_nota
	dim	n_rp13_siempre, n_rp13_casisiempre, n_rp13_ocasionalmente, n_rp13_casinunca, n_rp13_nunca, n_rp13_prompon, n_rp13_nota
	dim	n_rp14_siempre, n_rp14_casisiempre, n_rp14_ocasionalmente, n_rp14_casinunca, n_rp14_nunca, n_rp14_prompon, n_rp14_nota
	dim	n_rp15_siempre, n_rp15_casisiempre, n_rp15_ocasionalmente, n_rp15_casinunca, n_rp15_nunca, n_rp15_prompon, n_rp15_nota
	dim	n_rp16_siempre, n_rp16_casisiempre, n_rp16_ocasionalmente, n_rp16_casinunca, n_rp16_nunca, n_rp16_prompon, n_rp16_nota
	dim	n_rp17_siempre, n_rp17_casisiempre, n_rp17_ocasionalmente, n_rp17_casinunca, n_rp17_nunca, n_rp17_prompon, n_rp17_nota
	dim	n_rp18_siempre, n_rp18_casisiempre, n_rp18_ocasionalmente, n_rp18_casinunca, n_rp18_nunca, n_rp18_prompon, n_rp18_nota
	dim	n_rp19_siempre, n_rp19_casisiempre, n_rp19_ocasionalmente, n_rp19_casinunca, n_rp19_nunca, n_rp19_prompon, n_rp19_nota
	dim	n_rp20_siempre, n_rp20_casisiempre, n_rp20_ocasionalmente, n_rp20_casinunca, n_rp20_nunca, n_rp20_prompon, n_rp20_nota
	dim	n_rp21_siempre, n_rp21_casisiempre, n_rp21_ocasionalmente, n_rp21_casinunca, n_rp21_nunca, n_rp21_prompon, n_rp21_nota
	dim	n_rp22_siempre, n_rp22_casisiempre, n_rp22_ocasionalmente, n_rp22_casinunca, n_rp22_nunca, n_rp22_prompon, n_rp22_nota
	dim	n_rp23_si, n_rp23_no, n_rp23_praprobacion
	dim	n_rp24_si, n_rp24_no, n_rp24_praprobacion
	dim	n_rp25_si, n_rp25_no, n_rp25_praprobacion
	dim	n_promediodimension1, n_promediodimension2, n_promediodimension3
	dim n_desviaciondimension1, n_desviaciondimension2, n_desviaciondimension3, n_promedio_asignatura, n_desviacion_asignatura
	dim n_notadimension1, n_notadimension2, n_notadimension3, n_nota_asignatura, s_nmunidadacad
	dim s_nmcarrer, s_nmapepat, s_nmapemat, s_nmnombrs, o, s_nmasigna
	dim n_XdimensionCarrera1, n_XdimensionCarrera2, n_XdimensionCarrera3, n_XTotalCarrera, n_XdimensionUnidad1, n_XdimensionUnidad2, n_XdimensionUnidad3, n_XTotalUnidad
	dim n_XdimensionUVM1,n_XdimensionUVM2, n_XdimensionUVM3, n_XTotalUVM, n_XdimensionCarrera1Tem2
	
	set o = getComponent()
	if param <> "" and param2 <> "" and param3 <> "" and param4 <> "" and param5 <> "" and param6 <> "" then
		n_asignatura = 0
		n_asignatura = param
		n_cdcarrer2 = param2
		n_cdunidadacad2 = param3
		n_nrmalla2 = cstr(param4)
		n_nrparale2 = param5
		s_tipoAsig2 = cstr(param6)
		'response.Write(n_asignatura & ";" & n_cdcarrer2 & ";" & n_cdunidadacad2  & ";" & n_nrmalla2 & ";" & n_nrparale2 & ";" & s_tipoAsig2 )
		call o.Busca_DatosPerEncuesta_Part1(n_ano, n_periodo, n_asignatura, n_NrRutProfe, n_cdcarrer2, n_cdunidadacad2, n_nrmalla2, n_nrparale2, s_tipoAsig2, n_aaproceso, n_nrproceso, n_cdunidadacad, n_cdcarrer, n_nrmalla, n_cdasigna, s_tipoasig, n_nrparale, n_nrencuestados, n_nrinscritos, n_rp01_siempre, n_rp01_casisiempre, n_rp01_ocasionalmente, n_rp01_casinunca, n_rp01_nunca, n_rp01_prompon, n_rp01_nota, n_rp02_siempre, n_rp02_casisiempre, n_rp02_ocasionalmente, n_rp02_casinunca, n_rp02_nunca, n_rp02_prompon, n_rp02_nota, n_rp03_siempre, n_rp03_casisiempre, n_rp03_ocasionalmente, n_rp03_casinunca, n_rp03_nunca, n_rp03_prompon, n_rp03_nota, n_rp04_siempre, n_rp04_casisiempre, n_rp04_ocasionalmente, n_rp04_casinunca, n_rp04_nunca, n_rp04_prompon, n_rp04_nota, n_rp05_siempre, n_rp05_casisiempre, n_rp05_ocasionalmente, n_rp05_casinunca, n_rp05_nunca, n_rp05_prompon, n_rp05_nota, n_rp06_siempre, n_rp06_casisiempre, n_rp06_ocasionalmente, n_rp06_casinunca, n_rp06_nunca, n_rp06_prompon, n_rp06_nota, n_rp07_siempre, n_rp07_casisiempre, n_rp07_ocasionalmente, n_rp07_casinunca, n_rp07_nunca, n_rp07_prompon, n_rp07_nota, s_nmcarrer, s_nmapepat, s_nmapemat, s_nmnombrs, s_nmasigna, s_nmunidadacad)

		call o.Busca_DatosPerEncuesta_Part2(n_ano, n_periodo, n_asignatura, n_NrRutProfe,  n_cdcarrer2, n_cdunidadacad2, n_nrmalla2, n_nrparale2,s_tipoAsig2, n_rp08_siempre, n_rp08_casisiempre, n_rp08_ocasionalmente, n_rp08_casinunca, n_rp08_nunca, n_rp08_prompon, n_rp08_nota,	n_rp09_siempre, n_rp09_casisiempre, n_rp09_ocasionalmente, n_rp09_casinunca, n_rp09_nunca, n_rp09_prompon, n_rp09_nota, n_rp10_siempre, n_rp10_casisiempre, n_rp10_ocasionalmente, n_rp10_casinunca, n_rp10_nunca, n_rp10_prompon, n_rp10_nota, n_rp11_siempre, n_rp11_casisiempre, n_rp11_ocasionalmente, n_rp11_casinunca, n_rp11_nunca, n_rp11_prompon, n_rp11_nota, n_rp12_siempre, n_rp12_casisiempre, n_rp12_ocasionalmente, n_rp12_casinunca, n_rp12_nunca, n_rp12_prompon, n_rp12_nota, n_rp13_siempre, n_rp13_casisiempre, n_rp13_ocasionalmente, n_rp13_casinunca, n_rp13_nunca, n_rp13_prompon, n_rp13_nota, n_rp14_siempre, n_rp14_casisiempre, n_rp14_ocasionalmente, n_rp14_casinunca, n_rp14_nunca, n_rp14_prompon, n_rp14_nota, n_rp15_siempre, n_rp15_casisiempre, n_rp15_ocasionalmente, n_rp15_casinunca, n_rp15_nunca, n_rp15_prompon, n_rp15_nota,n_rp16_siempre, n_rp16_casisiempre, n_rp16_ocasionalmente, n_rp16_casinunca, n_rp16_nunca, n_rp16_prompon, n_rp16_nota, n_rp17_siempre, n_rp17_casisiempre, n_rp17_ocasionalmente, n_rp17_casinunca, n_rp17_nunca, n_rp17_prompon, n_rp17_nota)

		call o.Busca_DatosPerEncuesta_Part3(n_ano, n_periodo, n_asignatura, n_NrRutProfe,  n_cdcarrer2, n_cdunidadacad2, n_nrmalla2, n_nrparale2,s_tipoAsig2, n_rp18_siempre, n_rp18_casisiempre, n_rp18_ocasionalmente, n_rp18_casinunca, n_rp18_nunca, n_rp18_prompon, n_rp18_nota, n_rp19_siempre, n_rp19_casisiempre, n_rp19_ocasionalmente, n_rp19_casinunca, n_rp19_nunca, n_rp19_prompon, n_rp19_nota, n_rp20_siempre, n_rp20_casisiempre, n_rp20_ocasionalmente, n_rp20_casinunca, n_rp20_nunca, n_rp20_prompon, n_rp20_nota, n_rp21_siempre, n_rp21_casisiempre, n_rp21_ocasionalmente, n_rp21_casinunca, n_rp21_nunca, n_rp21_prompon, n_rp21_nota, n_rp22_siempre, n_rp22_casisiempre, n_rp22_ocasionalmente, n_rp22_casinunca, n_rp22_nunca, n_rp22_prompon, n_rp22_nota, n_rp23_si, n_rp23_no, n_rp23_praprobacion,  n_rp24_si, n_rp24_no, n_rp24_praprobacion, n_rp25_si, n_rp25_no, n_rp25_praprobacion, n_promediodimension1, n_promediodimension2, n_promediodimension3, n_desviaciondimension1, n_desviaciondimension2, n_desviaciondimension3, n_promedio_asignatura, n_desviacion_asignatura, n_notadimension1, n_notadimension2, n_notadimension3, n_nota_asignatura)
		
		call o.Busca_DatosDetalle(n_ano, n_periodo, n_cdcarrer, n_cdunidadacad, n_XdimensionCarrera1, n_XdimensionCarrera2, n_XdimensionCarrera3, n_XTotalCarrera, n_XdimensionUnidad1, n_XdimensionUnidad2, n_XdimensionUnidad3, n_XTotalUnidad, n_XdimensionUVM1,n_XdimensionUVM2, n_XdimensionUVM3, n_XTotalUVM, n_XdimensionCarrera1Tem2)
	end if
%>

<form name="form2" id="form2" method="post" action="inf_1.asp">
		<input type="hidden" name="hf_cdasigna" id="hf_cdasigna">
		<input type="hidden" name="hf_cdcarrera" id="hf_cdcarrera">
		<input type="hidden" name="hf_cdescuela" id="hf_cdescuela">
		<input type="hidden" name="hf_cdmalla" id="hf_cdmalla">
		<input type="hidden" name="hf_cdparalelo" id="hf_cdparalelo">
		<input type="hidden" name="hf_tipoasig" id="hf_tipoasig">
		<input type="hidden" name="hf_rutdoc2" id="hf_rutdoc2">
</form>
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#FFFFFF">
  <tr>
    <td align="left" class="txtitulo"><img src="img/portaldocente.jpg" width="277" height="16"></td>
  </tr>
  <tr> 
    <td align="left" class="txsubtitulo">RESULTADO ENCUESTA DE EVALUACI&Oacute;N 
      DOCENTE <%=(n_ano)%>-<%=(n_periodo)%>
	 
      </td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"> <table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
        <tr> 
          <td width="15%" class="SubtitulosTablas">Escuela</td>
          <td colspan="3" class="texto">&nbsp;<%=s_nmunidadacad %></td>
        </tr>
        <tr> 
          <td class="SubtitulosTablas">Carrera</td>
          <td colspan="3" class="texto">&nbsp;<%=s_nmcarrer %></td>
        </tr>
        <tr> 
          <td class="SubtitulosTablas">Asignatura</td>
          <td colspan="3" class="texto">&nbsp;<%=s_nmasigna %></td>
        </tr>
        <tr> 
          <td class="SubtitulosTablas">Profesor</td>
          <td colspan="3" class="texto">&nbsp;<%=(s_nmnombrs & " " & s_nmapepat & " " & s_nmapemat) %></td>
        </tr>
        <tr> 
          <td class="SubtitulosTablas">Alumnos</td>
          <td width="28%" align="center" class="texto">Inscritos: <%=n_nrinscritos %></td>
          <td width="28%" align="center" class="texto">Encuestados: <%=n_nrencuestados %></td>
		  <% 
		  		if ( n_nrinscritos <> 0 ) then		 
					n_PorcEncuestados = (n_nrencuestados * 100) / n_nrinscritos 
				elseif n_nrinscritos = 0 then
					n_PorcEncuestados = 100
				end if
				%>
					
          <td width="28%" align="center" class="texto">Encuestados: <%=round(n_PorcEncuestados, 2) %> %</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td><hr width="80%"></td>
  </tr>
  <tr> 
    <td align="center"> <table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
        <tr> 
          <td colspan="4" class="SubtitulosTablas">Resumen</td>
          <td width="22%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="15%" class="SubtitulosTablas2">&nbsp;</td>
          <td width="21%" align="center" valign="top" class="SubtitulosTablas2">I. 
            Dise&ntilde;o y organizaci&oacute;n de la Ense&ntilde;anza </td>
          <td width="21%" align="center" valign="top" class="SubtitulosTablas2">II. 
            Metodolog&iacute;a y pr&aacute;ctica docente centrada en el aprendizaje</td>
          <td width="21%" align="center" valign="top" class="SubtitulosTablas2">III. 
            Ambiente para el aprendizaje</td>
          <td width="22%" align="center" class="SubtitulosTablas2">TOTAL</td>
        </tr>
        <tr> 
          <td width="15%" class="SubtitulosTablas2">Asignatura</td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=ROUND(n_notadimension1, 2) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_notadimension2, 2) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_notadimension3, 2) %></td>
          <td width="22%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_nota_asignatura, 2) %></td>
        </tr>
        <tr> 
          <td width="15%" class="SubtitulosTablas2">Carrera</td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=(round(n_XdimensionCarrera1, 2)) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionCarrera2, 2) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionCarrera3, 2) %></td>
          <td width="22%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XTotalCarrera, 2) %></td>
        </tr>
        <tr> 
          <td width="15%" class="SubtitulosTablas2">Escuela</td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionUnidad1, 2) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionUnidad2, 2) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionUnidad3, 2) %></td>
          <td width="22%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XTotalUnidad, 2) %></td>
        </tr>
        <tr> 
          <td width="15%" class="SubtitulosTablas2">UVM</td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionUVM1, 2) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionUVM2, 2) %></td>
          <td width="21%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XdimensionUVM3, 2) %></td>
          <td width="22%" align="center" bordercolor="#CCCCCC" class="texto"><%=round(n_XTotalUVM, 2) %></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td><hr width="80%"></td>
  </tr>
  <tr> 
    <td align="center"> <table width="90%" border="0" cellpadding="1" cellspacing="1" bordercolor="#CCCCCC">
        <tr> 
          <td class="SubtitulosTablas">EVALUACI&Oacute;N DOCENTE</td>
        </tr>
        <tr> 
          <td class="SubtitulosTablas2">S: Siempre; CS: Casi siempre; A: A veces; 
            CN: Casi nunca; N: Nunca</td>
        </tr>
        <tr> 
          <td align="center"> <table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC">
              <tr> 
                <td width="55%" bgcolor="#CCCCCC" class="texto3">I.-DISE&Ntilde;O 
                  Y ORGANIZACI&Oacute;N DE LA ENSE&Ntilde;ANZA</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">S</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">CS</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">A</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">CN</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">N</td>
                <td width="10%" align="center" bgcolor="#CCCCCC" class="texto4">Puntaje</td>
                <td width="10%" align="center" bgcolor="#CCCCCC" class="texto4">Nota</td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">1.- En la asignatura, el docente 
                  da a conocer al inicio del curso y explica de forma clara la 
                  totalidad del programa (syllabus).</td>
                <td width="5%" align="center" class="texto"><%=n_rp01_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp01_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp01_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp01_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp01_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp01_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp01_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">2.- En la asignatura, el docente 
                  realiza las clases programadas, recuperando aquellas a las que 
                  falt&oacute;. </td>
                <td width="5%" align="center" class="texto"><%=n_rp02_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp02_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp02_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp02_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp02_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp02_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp02_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">3.- En la asignatura, el docente 
                  cumple con el horario de inicio y t&eacute;rmino de clase. </td>
                <td width="5%" align="center" class="texto"><%=n_rp03_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp03_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp03_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp03_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp03_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp03_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp03_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">4- En la asignatura, el docente 
                  realiza las actividades planificadas en el programa (syllabus) 
                  del curso.</td>
                <td width="5%" align="center" class="texto"><%=n_rp04_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp04_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp04_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp04_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp04_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp04_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp04_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">5- Las formas y criterios de evaluaci&oacute;n 
                  (pruebas, cert&aacute;menes, tareas, etc.) corresponden con 
                  la informaci&oacute;n declarada en el programa (syllabus) de 
                  la asignatura.</td>
                <td width="5%" align="center" class="texto"><%=n_rp05_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp05_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp05_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp05_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp05_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp05_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp05_nota, 2 )%></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">6- En la asignatura, el docente 
                  entrega en el tiempo establecido los resultados de la evaluaci&oacute;n.</td>
                <td width="5%" align="center" class="texto"><%=n_rp06_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp06_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp06_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp06_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp06_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp06_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp06_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">7.- Los recursos, materiales de 
                  estudio (apuntes, gu&iacute;as etc.) y bibliograf&iacute;a fueron 
                  de utilidad para lograr los resultados del curso.</td>
                <td width="5%" align="center" class="texto"><%=n_rp07_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp07_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp07_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp07_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp07_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp07_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp07_nota,2) %></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC">
              <tr bgcolor="#CCCCCC"> 
                <td colspan="8" class="texto3">II.- METODOLOG&Iacute;A Y PR&Aacute;CTICA 
                  DOCENTE CENTRADA EN EL APRENDIZAJE</td>
              </tr>
              <tr bgcolor="#CCCCCC"> 
                <td width="55%" class="texto4">2.1. Estrategias metodol&oacute;gicas</td>
                <td width="5%" align="center" class="texto4">S</td>
                <td width="5%" align="center" class="texto4">CS</td>
                <td width="5%" align="center" class="texto4">A</td>
                <td width="5%" align="center" class="texto4">CN</td>
                <td width="5%" align="center" class="texto4">N</td>
                <td width="10%" align="center" class="texto4">Puntaje</td>
                <td width="10%" align="center" class="texto4">Nota</td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">8.- En la asignatura, la metodolog&iacute;a 
                  de ense&ntilde;anza que se promueve, fomenta la participaci&oacute;n 
                  en clases y el rol activo de sus estudiantes.</td>
                <td width="5%" align="center" class="texto"><%=n_rp08_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp08_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp08_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp08_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp08_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp08_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp08_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">9.- La metodolog&iacute;a de ense&ntilde;anza 
                  que promueve el docente, fomenta el trabajo colaborativo entre 
                  los estudiantes.</td>
                <td width="5%" align="center" class="texto"><%=n_rp09_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp09_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp09_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp09_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp09_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp09_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp09_nota,2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">10.- La metodolog&iacute;a de ense&ntilde;anza 
                  y las actividades propuestas a los estudiantes, son adecuados 
                  seg&uacute;n el tipo de asignatura y su grado de exigencia. 
                </td>
                <td width="5%" align="center" class="texto"><%=n_rp10_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp10_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp10_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp10_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp10_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp10_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp10_nota,2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">11.-El docente eval&uacute;a y 
                  refuerza al inicio de la clase los conocimientos previos de 
                  sus estudiantes, diagnosticando lo que saben acerca de la clase 
                  que comenzar&aacute;.</td>
                <td width="5%" align="center" class="texto"><%=n_rp11_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp11_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp11_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp11_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp11_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp11_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp11_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">12.-El docente relaciona los conocimientos 
                  de su clase con los de otras asignaturas.</td>
                <td width="5%" align="center" class="texto"><%=n_rp12_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp12_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp12_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp12_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp12_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp12_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp12_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">13.- En la asignatura, el docente 
                  promueve la aplicaci&oacute;n de los aprendizajes en diversas 
                  situaciones de la vida real y el futuro desempe&ntilde;o laboral 
                  del estudiante. </td>
                <td width="5%" align="center" class="texto"><%=n_rp13_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp13_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp13_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp13_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp13_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp13_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp13_nota, 2) %></td>
              </tr>
              <tr> 
                <td class="texto2">14.- En la asignatura, el docente incorpora 
                  las tecnolog&iacute;as de manera efectiva para fortalecer el 
                  aprendizaje de sus estudiantes.</td>
                <td width="5%" align="center" class="texto"><%=n_rp14_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp14_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp14_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp14_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp14_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp14_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp14_nota, 2) %></td>
              </tr>
              <tr bgcolor="#CCCCCC"> 
                <td class="texto4">2.2. Estrategias de Evaluaci&oacute;n</td>
                <td align="center" class="texto2">&nbsp;</td>
                <td align="center" class="texto2">&nbsp;</td>
                <td align="center" class="texto2">&nbsp;</td>
                <td align="center" class="texto2">&nbsp;</td>
                <td align="center" class="texto2">&nbsp;</td>
                <td align="center" class="texto2">&nbsp;</td>
                <td align="center" class="texto2">&nbsp;</td>
              </tr>
              <tr> 
                <td class="texto2">15.- Los instrumentos de evaluaci&oacute;n 
                  aplicados por el docente se adecuan a los objetivos abordados 
                  en las unidades tem&aacute;ticas que se eval&uacute;an.</td>
                <td width="5%" align="center" class="texto"><%=n_rp15_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp15_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp15_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp15_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp15_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp15_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp15_nota, 2) %></td>
              </tr>
              <tr> 
                <td class="texto2">16.- Previo a la evaluaci&oacute;n, el docente 
                  informa a los estudiantes los criterios a evaluar.</td>
                <td width="5%" align="center" class="texto"><%=n_rp16_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp16_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp16_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp16_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp16_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp16_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp16_nota, 2) %></td>
              </tr>
              <tr> 
                <td class="texto2">17.- El docente comenta con sus estudiantes 
                  los resultados de la evaluaci&oacute;n realizada, orient&aacute;ndolos 
                  para mejorar su desempe&ntilde;o acad&eacute;mico.</td>
                <td width="5%" align="center" class="texto"><%=n_rp17_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp17_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp17_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp17_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp17_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp17_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp17_nota, 2) %></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC">
              <tr> 
                <td width="55%" bgcolor="#CCCCCC" class="texto3">III. AMBIENTE 
                  PARA EL APRENDIZAJE</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">S</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">CS</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">A</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">CN</td>
                <td width="5%" align="center" bgcolor="#CCCCCC" class="texto4">N</td>
                <td width="10%" align="center" bgcolor="#CCCCCC" class="texto4">Puntaje</td>
                <td width="10%" align="center" bgcolor="#CCCCCC" class="texto4">Nota</td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">18.- En la asignatura, el docente 
                  establecen una comunicaci&oacute;n fluida con sus estudiantes 
                  durante y fuera de la clase.</td>
                <td width="5%" align="center" class="texto"><%=n_rp18_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp18_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp18_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp18_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp18_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp18_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp18_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">19.- En la asignatura, el docente 
                  establece normas b&aacute;sicas de convivencia en su clase, 
                  garantizando un ambiente &oacute;ptimo para el aprendizaje.</td>
                <td width="5%" align="center" class="texto"><%=n_rp19_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp19_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp19_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp19_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp19_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp19_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp19_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">20.- En la asignatura, el docente 
                  muestra inter&eacute;s, respeto y valoraci&oacute;n por sus 
                  estudiantes.</td>
                <td width="5%" align="center" class="texto"><%=n_rp20_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp20_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp20_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp20_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp20_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp20_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp20_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">21.- En la asignatura, el docente 
                  fomenta la participaci&oacute;n y motivaci&oacute;n de todos 
                  los estudiantes</td>
                <td width="5%" align="center" class="texto"><%=n_rp21_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp21_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp21_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp21_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp21_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp21_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp21_nota, 2) %></td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">22.- En la asignatura, el docente 
                  demuestra actitud receptiva y muestra disposici&oacute;n al 
                  logro de los aprendizajes de todos estudiantes</td>
                <td width="5%" align="center" class="texto"><%=n_rp22_siempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp22_casisiempre %></td>
                <td width="5%" align="center" class="texto"><%=n_rp22_ocasionalmente %></td>
                <td width="5%" align="center" class="texto"><%=n_rp22_casinunca %></td>
                <td width="5%" align="center" class="texto"><%=n_rp22_nunca %></td>
                <td width="10%" align="center" class="texto"><%=n_rp22_prompon %></td>
                <td width="10%" align="center" class="texto"><%=round(n_rp22_nota, 2) %></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC">
              <tr bgcolor="#CCCCCC"> 
                <td width="55%" class="texto3"><strong>&nbsp;<span class="txsubtitulo">IV.- 
                  PERCEPCI&Oacute;N GENERAL</span></strong></td>
                <td width="12%" align="center" class="texto4">Si</td>
                <td width="12%" align="center" class="texto4">No</td>
                <td width="10%" align="center" class="texto4">Si %</td>
                <td width="10%" align="center" class="texto4">No %</td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">23.- En esta asignatura, he logrado 
                  los conocimientos que esperaba.</td>
                <td align="center" class="texto"><%=n_rp23_si %></td>
                <td align="center" class="texto"><%=n_rp23_no %></td>
                <td width="10%" align="center" class="texto"><%=n_rp23_praprobacion %> %</td>
				<% n_rp23_prdesaprobacion = 100 - n_rp23_praprobacion %>
                <td width="10%" align="center" class="texto"><%=n_rp23_prdesaprobacion %> %</td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">24.- Me gustar&iacute;a tomar otro 
                  curso dictado por este docente. </td>
                 
                <td align="center" class="texto"><%=n_rp24_si %></td>
                <td align="center" class="texto"><%=n_rp24_no %></td>
                <td width="10%" align="center" class="texto"><%=n_rp24_praprobacion %> %</td>
				<% n_rp24_prdesaprobacion = 100 - n_rp24_praprobacion %>
                <td width="10%" align="center" class="texto"><%=n_rp24_prdesaprobacion %> %</td>
              </tr>
              <tr> 
                <td width="55%" class="texto2">25.- En general, estoy conforme 
                  con la labor docente de este profesor.</td>
                 
                <td align="center" class="texto"><%=n_rp25_si %></td>
                <td align="center" class="texto"><%=n_rp25_no %></td>
                <td width="10%" align="center" class="texto"><%=n_rp25_praprobacion %> % </td>
				<% n_rp25_prdesaprobacion = 100 - n_rp25_praprobacion %>
                <td width="10%" align="center" class="texto"><%=n_rp25_prdesaprobacion %> %</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align="center"> <p class="texto2">A continuaci&oacute;n, usted podr&aacute; 
              contrastar su nota obtenida por dimensi&oacute;n con los niveles 
              de desempe&ntilde;o (Destacado, Competente, B&aacute;sico o Satisfactorio) 
              que ofrece la siguiente r&uacute;brica, construida en relaci&oacute;n 
              a los criterios de calidad de la pr&aacute;ctica docente.</p>
            <p><a href="R%FAbrica%20para%20interpretar%20Evaluaci%F3n%20Docente.pdf" target="_blank">R&uacute;brica 
              para interpretar Evaluaci&oacute;n Docente</a></p></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td bgcolor="#990000">&nbsp;</td>
  </tr>
</table>
</body>
<%
	
	if param = "" and param2 = "" and param3 = "" and param4 = "" and param5 = "" then
		%> <script language="JavaScript">leerDatos();</script><%
		%> <script language="JavaScript">document.form2.submit();</script><%
	end if
	
%>
</html>
