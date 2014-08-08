<script type="text/javascript" charset="utf-8">
<!--
function ocultamenu(){
  var menu = document.getElementById("Gesacademica");
  var menu2 = document.getElementById("Serdocente");
  var menu3 = document.getElementById("otrosSer");
  var menu4 = document.getElementById("Comunicados");
  menu.style.display = "none";
  menu2.style.display = "none";
  menu3.style.display = "none";
  menu4.style.display = "none";
}
function despliega(){
  var menu = document.getElementById("Gesacademica");
    if(menu.style.display == "none"){
      menu.style.display = "block";
    }
    else{
      menu.style.display = "none";
    }
}
function despliega2(){
  var menu2 = document.getElementById("Serdocente");
    if(menu2.style.display == "none"){
      menu2.style.display = "block";
    }
    else{
      menu2.style.display = "none";
    }
}
function despliega3(){
  var menu3 = document.getElementById("otrosSer");
    if(menu3.style.display == "none"){
      menu3.style.display = "block";
    }
    else{
      menu3.style.display = "none";
    }
}
function despliega4(){
  var menu4 = document.getElementById("Comunicados");
    if(menu4.style.display == "none"){
      menu4.style.display = "block";
    }
    else{
      menu4.style.display = "none";
    }
}
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
//-->
</script>  
<link href="../estilos.css" rel="stylesheet" type="text/css">
<body bgcolor="#990000" leftmargin="0" topmargin="0"> 
<table width="160" border="0" cellspacing="10" cellpadding="0">
  <tr>
    <td><ul>
        <li><img src="../img/flechamenu.jpg" width="5" height="6"><a href="#"  class="estilo2" onClick="despliega();return false;"><strong> 
          Gesti&oacute;n Acad&eacute;mica </strong></a> 
          <ul id="Gesacademica">
            <li><a href="reglamentos.asp" class="estilo2">Reglamentos</a></li>
            <li><a href="prof_acta.asp" class="estilo2">Actas de Notas</a></li>
            <li><a href="prof_Acta_Formacion_General.asp" class="estilo2">Actas 
              de Formación General</a></li>
            <li><a href="http://www.uvm.cl/portal2007/docente/masagenda.shtml" target="_blank" class="estilo2">Agenda</a></li>
            <li><a href="prof_datos_personales.asp" class="estilo2">Mi Ficha Docente</a></li>
            <li><a href="prof_asistencia_asig.asp" class="estilo2">Asistencias</a></li>
            <li><a href="../ca2011.pdf" target="_blank"class="estilo2">Calendario 
              Acad&eacute;mico</a></li> 
            <li><a href="prof_lista_curso.asp" class="estilo2">Listas de Curso</a></li>
            <li><a href="documentos/modelo%20educativo.pdf" target="_blank" class="estilo2">Modelo 
              Educativo UVM</a></li>
            <li><a href="prof_notas_parciales.asp" class="estilo2">Notas Parciales</a></li>
            <li><a href="http://www.uvm.cl/portal2007/docente/masnoticias.shtml" target="_blank" class="estilo2">Noticias</a></li>
            <li><a href="prof_prog_asig.asp" class="estilo2">Programas</a></li>
            <hr size="1" noshade color="ff0000">
          </ul>
		  </li>
        <li><img src="../img/flechamenu.jpg" width="5" height="6"><a href="#"  class="estilo2" onClick="despliega2();return false;"><strong> 
          Servicios Docentes</strong></a> 
          <ul id="Serdocente">
            <li><a href="prof_bandeja_salida.asp" class="estilo2">Mensajes a Alumnos</a></li>
			<li><a href="historico_boletas_carga_academica.asp" class="estilo2">Boletas de Honorarios</a></li>
          </ul>
        </li>
        <hr size="1" noshade color="ff0000">
        <li><img src="../img/flechamenu2.jpg" width="5" height="6"><a href="aula_intranet_docente.asp" target="_blank" class="estilo2"><strong> 
          Aula Virtual</strong></a></li>
        <li><img src="../img/flechamenu2.jpg" width="5" height="6"><a href="http://www.uvm.cl/biblioteca/nuevopac.htm" target="_blank"  class="estilo2" ><strong> 
          Biblioteca</strong></a></li>
		  <hr size="1" noshade color="ff0000">
        <li><img src="../img/flechamenu.jpg" width="5" height="6"><a href="#"  class="estilo2" onClick="despliega4();return false;"><strong> 
          Noticias y Novedades </strong></a> 
          <ul id="Comunicados">
		    <li><a href="http://www.uvm.cl/masagenda.shtml" target="_blank" class="estilo2">Agenda UVM </a></li>
            <li><a href="http://www.uvm.cl/portal2007/docente/masarticulos.shtml" target="_blank" class="estilo2">Art&iacute;culos</a></li>
            <li><a href="prof_com_globales.asp" class="estilo2">Comunicados</a></li>
            <li><a href="http://www.uvm.cl/gaceta.shtml" target="_blank" class="estilo2">Gaceta Universitaria</a></li>
            <li><a href="http://www.uvm.cl/informes.htm" target="_blank" class="estilo2">Informes de Prensa</a></li>
            <li><a href="http://www.uvm.cl/masnoticias.shtml" target="_blank" class="estilo2">Noticias Generales </a></li>
            <li><a href="http://www.radiouvm.cl/" target="_blank" class="estilo2">Radio UVM </a> 
              <hr size="1" noshade color="ff0000">
            </li>
          </ul>
        </li>
        <li><img src="../img/flechamenu.jpg" width="5" height="6"><a href="#"  class="estilo2" onClick="despliega3();return false;"><strong> 
          Otros Servicios</strong></a> 
          <ul id="otrosSer">
            <li><a href="http://www.uvm.cl/buses.shtml" target="_blank" class="estilo2">Horario Buses</a></li>
            <img src="../img/flechamenu2.jpg">
          </ul>
        </li>
        <li> 
          <hr size="1" noshade color="ff0000">
		  <li><img src="../img/flechamenu2.jpg" width="5" height="6">
          <a href="http://helpdesk.uvm.net:8080/"  class="estilo2" target="_blank"><strong> 
           Mesa de Ayuda</strong></a></li>
        <li><img src="../img/flechamenu2.jpg" width="5" height="6"><a href="formulario_contacto.asp"  class="estilo2"><strong> 
          Contacto</strong></a></li>
		  </li>
      </ul></td>
  </tr>
</table>
