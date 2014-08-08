<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
  $("#formulario").hide();
  $("#grilla").hide();

  $("#ingresa").click(function(event){
      $("#tabs").hide();
      event.preventDefault();
      //Cargo grilla
      cargaGrilla();

      $("#formulario").show();
      $("#paso2").attr("disabled","disabled");
      $("#paso3").attr("disabled","disabled");
      
   });

  $("#modifica").click(function(event){
      $("#formulario").hide();
      $("#grilla").show();  
      event.preventDefault();
  });
});
</script>  
<link href="../../estilos.css" rel="stylesheet" type="text/css">
<body bgcolor="#990000" leftmargin="0" topmargin="0"> 
<table width="160" border="0" cellspacing="10" cellpadding="0">
  <tr>
    <td><ul>
                
        
        <li><img src="../../img/flechamenu2.jpg" width="5" height="6"><a href="docente_aula_eje.asp" target="_blank" class="estilo2"><strong> 
          Aula Virtual</strong></a></li>
        <li><img src="../../img/flechamenu2.jpg" width="5" height="6"><a href="http://uvdm.sdp.sirsi.net" target="_blank"  class="estilo2" ><strong> 
          Biblioteca</strong></a></li>
        <li><img src="../../img/flechamenu2.jpg" width="5" height="6"><a href="eje_Laureate_sso.asp" target="_blank"  class="estilo2" ><strong> 
          Portal Docente Laureate</strong></a></li>          
		  <hr size="1" noshade color="ff0000">


        <li><img src="../../img/flechamenu.jpg" width="5" height="6" ><a href="" class="estilo2" id="ingresa" ><strong> 
          Ingresar Syllabus </strong></a> 
          <ul id="Comunicados">
		   
          </ul>
        </li>
        <!--
        <li><img src="../../img/flechamenu.jpg" width="5" height="6" ><a href="" class="estilo2" id="modifica"><strong> 
          Modificar Syllabus</strong></a> 
          
        </li>
          

        <li> 
        
        -->


          <hr size="1" noshade color="ff0000">
		  <li><img src="../../img/flechamenu2.jpg" width="5" height="6">
          <a href="http://helpdesk.uvm.net:8080/"  class="estilo2" target="_blank"><strong> 
           Mesa de Ayuda</strong></a></li>
        <li><img src="../../img/flechamenu2.jpg" width="5" height="6"><a href="formulario_contacto.asp"  class="estilo2"><strong> 
          Contacto</strong></a></li>
		  </li>
      </ul></td>
  </tr>
</table>
