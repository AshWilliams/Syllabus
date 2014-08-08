<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>PortalUVM - Docente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../estilos.css" rel="stylesheet" type="text/css">
<link href="../css/demo_table.css" rel="stylesheet" type="text/css">
<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css">

 <script type='text/javascript' src='../js/jquery-1.8.3.js'></script>
 <script type="text/javascript" src="../js/jquery-ui.js"></script>
 <script type='text/javascript' src='../js/jquery.dataTables.js'></script>
 <script type='text/javascript' src='../js/underscore.js'></script>
 <script type='text/javascript' src='../js/moment.js'></script>

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

var getSyllabus;
var showTabla;
var showNotas;
var showUnidades;
var objAsignaturas;
var pushUnidad;
var objMaximo;
var cargaGrilla;
var objActividades = {};
var contador = 0;
var cont2 = 0;
var auxRamo;
var existe = 0;
var tabActividades;

$(document).ready(function(){

      $("#tabs").tabs();
      
      //Common functions

      //Form a object
      $.fn.serializeObject = function(){
         var o = {};
         var a = this.serializeArray();
         $.each(a, function() {
             if (o[this.name]) {
                 if (!o[this.name].push) {
                     o[this.name] = [o[this.name]];
                 }
                 o[this.name].push(this.value || '');
             } else {
                 o[this.name] = this.value || '';
             }
         });
         return o;
      };
      //Salto de linea a caracter
      function escapeNewLineChars(valueToEscape) {
        if (valueToEscape != null && valueToEscape != "") {
            return valueToEscape.replace(/\n/g, "\\n");
        } else {
            return valueToEscape;
        }
      }

      //Caracter a salto de linea
      function convertToHTMLVisibleNewline(value) {
          if (value != null && value != "") {
              return value.replace(/\n/g, "\n");
          } else {
              return value;
          }
      }

      //End common functions
      
      //Cargo grilla
      cargaGrilla = function (){

      $("#tabs").hide();
      $("#uniTem").html("");
      $.ajax({
                type: "POST",
                url: "ajax/getAsignaturas.asp",
                data: { "rut": 9334854 },
                success: function (respuesta) {
                    ultimo = respuesta.cursos.length;
                    respuesta.cursos.splice(ultimo-1, 1);
                    showTable(respuesta);
                    $("#formulario").show();
                }
      });
      }

      cargaGrilla();

      showTable = function (respuesta){
        
            objAsignaturas = respuesta.cursos;
            $("#asignaturas").html("<thead><tr><td>Codigo</td><td>Asignatura</td><td>Paralelo</td><td>Tipo</td><td>Docente</td><td>Syllabus</td></tr></thead><tbody></tbody>");
            $("#asignaturas").dataTable({
                "pagingType": "full_numbers",
                "aaData": respuesta.cursos,
                "aoColumns": [
                            { "mData": "idAsignatura" },
                            { "mData": "Asignatura" },
                            { "mData": "Paralelo" },
                            { "mData": "Tipo" },
                            { "mData": "nombre", "sClass": "capital" },
                            {
                                "mData": null,
                                "mRender": function (data, type, full) {
                                    //var resto = ",'" + full.Asignatura + "'" + ",'" + full.idCarrera + "'" + ",'" + full.Carrera + "'" + ",'" + full.nombre + "'";
                                    return '<input type="button" onclick="getSyllabus('+ full.idAsignatura +')" value="Ver"/>';
                                }
                            }

                            ],

                "bDestroy": true
            }).fnDraw();

                   
    }

    getSyllabus = function (codASigna){

       var objRamo = _.where(objAsignaturas, {idAsignatura: codASigna.toString() }); //Filtro Json Mongodb style
       objRamo = objRamo[0]; //Un resultado
       auxRamo = objRamo;
       //console.log(objRamo);
       $("#asignaturas_wrapper").effect("drop");
       $("#tabs").effect("slide");
       $("#tabs").tabs('select', 0)
       $("#asignatura").val(objRamo.Asignatura);
       $("#carrera").val(objRamo.Carrera);
       $("#profesor").val(objRamo.nombre);
       $("#correo").val(objRamo.email);
       $("#cdAsigna").val(codASigna);
       $('#requisitos').html('');

       //Obtengo prerequisitos de Asignatura
       $.ajax({
                type: "POST",
                url: "ajax/getRequisitos.asp",
                data: { "codigo": codASigna },
                success: function (preJson) {
                    ultimo = preJson.prerequisitos.length;
                    preJson.prerequisitos.splice(ultimo-1, 1);
                    
                    if(preJson.prerequisitos.length < 1)
                    {
                      $("#requisitos").append("No tiene");
                    }
                    else
                    {
                      $.each(preJson.prerequisitos, function(i, item) {
                            $("#requisitos").append(item.Prerequisito+"\n");
                      });
                      
                    }
                }
      });

      //Obtengo UD-SCT
      $.ajax({
                type: "POST",
                url: "ajax/getUdust.asp",
                data: { "codigo": codASigna, "tipo" : objRamo.Tipo },
                success: function (udustJson) {
                    ultimo = udustJson.creditos.length;
                    udustJson.creditos.splice(ultimo-1, 1);
                    $("#ud").val(udustJson.creditos[0].ud);
                    $("#ust").val(udustJson.creditos[0].ust);
                    $("#autonomo").val(udustJson.creditos[0].trabajo);
                    $("#perfil").val(udustJson.creditos[0].perfil);
                }
      });  


      //Obtengo HorarioAs y HorarioAt desde Syllabus en caso de existir
          var myForm = {};
          myForm['cdAsigna'] = codASigna;
          myForm['cdCarrera'] = auxRamo.idCarrera;
          myForm['Semestre'] = 1;
          myForm['Anio'] = 2014;
          
           $.ajax({
                type: "POST",
                url: "ajax/getSylla_uno.asp",
                data: myForm,
                success: function (getUno) {
                    $("#horarios").val(getUno.horario);
                    $("#atencion").val(getUno.atencion);
                    $("#estrategia").val(getUno.estrategia);
                    $("#reglas").val(getUno.reglas);
                }
            });  

      //Obtengo Unidades Tematicas y Recursos de Aprendizaje

           $.ajax({
                type: "POST",
                url: "ajax/getUnidades.asp",
                data: {cdasigna: codASigna},
                success: function (getUnidades) {
                    ultimo = getUnidades.unidades.length;
                    getUnidades.unidades.splice(ultimo-1, 1);
                    showUnidades(getUnidades.unidades);
                }
            });  

      //Obtengo Actividades por Recurso

      //Obtengo Pruebas de Asignatura
      $.ajax({
                type: "POST",
                url: "ajax/getPruebas.asp",
                data: { "codigo": codASigna, "tipo" : objRamo.Tipo, "paralelo" : objRamo.Paralelo, "carrera" : objRamo.idCarrera },
                success: function (pruebasJson) {
                    ultimo = pruebasJson.pruebas.length;
                    pruebasJson.pruebas.splice(ultimo-1, 1);
                    var suma = 0;
                    var num = 0;
                    $.each(pruebasJson.pruebas, function(i, item) {
                        suma+= parseInt(item.porcentaje);
                        num = item.numero;
                    });
                    
                    //Armo fila de Total
                    num = parseInt(num) + 1;
                    num = num.toString();
                    var elemento = {};
                    elemento['numero'] = num;
                    elemento['nombre'] = "Total";
                    elemento['porcentaje'] = suma.toString();
                    elemento['glosa'] = "";
                    //Añado fila a json con el Total

                    pruebasJson.pruebas.push(elemento);
                    //Armo la grilla
                    showTabla(pruebasJson); 

                }
      });  

      tabActividades();

     
    }


    //Muestro Unidades Tematicas

    showUnidades = function(getUnidades){
          
          objActividades = getUnidades;
          tabActividades();
          $("#tablaUnidades").html("<thead><tr><td>Unidad Tematica</td><td>Orden</td><td>Resultado Esperado</td></tr></thead><tbody></tbody>");
          $("#tablaUnidades").dataTable({
                    "bSort": false,
                     "pagingType": "full_numbers",
                      "aaData": getUnidades,
                      "aoColumns": [
                            { "mData": "contenido",
                              "mRender": function(data, type, full){
                                 if(full.subnivel == "")
                                 {
                                   return full.contenido;
                                 }
                                 else
                                 {
                                  return "";
                                 }
                              }
                             },
                            { "mData": "subnivel" },
                            { "mData": "contsubnivel" }
                            ],

                    "bDestroy": true
                  }).fnDraw();

    }

    //Muestro Unidades en Tabla Parte 4

    tabActividades = function()
    {   
        var tabla = "";
        $.each(objActividades, function(i, item) {
              if(item.subnivel == "")
              { //Es Unidad
                tabla += "<tr><td align='left' colspan='7'>Unidad Tematica: " + item.contenido + "</td></tr>";
              }
              else
              { //Es resultado
                tabla += "<tr><td align='left' colspan='7'>RA: " + item.subnivel + " "+ item.contsubnivel + "</td></tr>";
                tabla += "<tr><td>Semana</td><td>Inicio</td><td>Termino</td><td>Temas</td><td>Actividades</td><td>Recursos</td><td>";
                tabla += "<input type='button' class='addActividad' value='+'/><input type='hidden' value='"+ item.asignatura + ","+ item.nivel + ","+ item.subnivel +"' /></td></tr>";
                //tabla += "<tr><td colspan='7'></td></tr>";
                
                //Ver si hay actividades y añadir las filas
                var resultados;
                var myForm = {};
                  myForm['asignatura'] = auxRamo.idAsignatura;
                  myForm['cdCarrera'] = auxRamo.idCarrera;
                  myForm['Semestre'] = 1;
                  myForm['Anio'] = 2014;
                  myForm['userRut'] = "9334854";
                  myForm['padre'] = item.nivel;
                  myForm['hijo'] = item.subnivel;


                $.ajax({
                type: "POST",
                url: "ajax/getActividad.asp",
                async: false,
                data: myForm,
                success: function (Actividades) {
                    ultimo = Actividades.actividades.length;
                    Actividades.actividades.splice(ultimo-1, 1);
                    resultados = Actividades.actividades; 
                  }
                });  

                if(resultados.length > 0){
                  var res = "";
                  $.each(resultados, function(i, item) {
                    var inicio = item.inicio.substring(0,10).split("-").reverse().join("-"); 
                    var termino = item.termino.substring(0,10).split("-").reverse().join("-");
                    res += "<tr><td>"+item.semana+"</td><td>"+inicio+"</td><td>"+termino+"</td><td>"+item.tema+"</td><td>"+item.actividad+"</td><td>"+item.recurso+"</td><td></td></tr>";
                  });
                }
                
                tabla += res;


              }
        });

      
        $("#planActividad").html(tabla);

    }


     //Bind a elementos agregados dinamicamente
        $('body').on('click', '.addActividad', function() {
          var valores = $( this ).closest('tr').find( 'input:hidden' ).val();
          var row = "<tr><td colspan='1'><input class='semana' type='text' /></td><td colspan='1'><input class='fecIni' type='text' /></td>";
               row += "<td colspan='1'><input class='fecTer' type='text' /></td><td colspan='1'><input class='temas' type='text' />";
               row += "</td><td colspan='1'><input class='activids' type='text' /></td><td colspan='1'><input class='recurs' type='text' /></td>";
               row += "<td colspan='1'><div class='boton2'><input type='button' value='Guardar' class='addActRow' /></div><input type='hidden' value='" + valores + "' /></td></tr>";
               //row += "<tr></tr>";
             //console.log(misValores[0]);
           $(this).closest('tr').after(row);

        });

        $('body').on('focus','.fecIni', function(){
          $(this).datepicker({ dateFormat: 'dd-mm-yy' });
        });

        $('body').on('focus','.fecTer', function(){
          $(this).datepicker({ dateFormat: 'dd-mm-yy' });
        });

         $('body').on('click', '.addActRow', function() {
          var myForm = {};
          $( this ).closest('tr').find('input, select, textarea, hidden').each(function(){
                var tipo = $(this).attr('type');
                var clase = $(this).attr('class');

                if(clase == "semana")
                {
                  myForm['semana'] = $(this).val();
                }
                if(clase == "fecIni hasDatepicker")
                {
                  myForm['inicio'] = $(this).val().split("-").reverse().join("-");
                }
                if(clase == "fecTer hasDatepicker")
                {
                  myForm['termino'] = $(this).val().split("-").reverse().join("-");
                }
                if(clase == "temas")
                {
                  myForm['temas'] = $(this).val();
                }
                if(clase == "activids")
                {
                  myForm['actividad'] = $(this).val();
                }
                if(clase == "recurs")
                {
                  myForm['recurso'] = $(this).val();
                }
                if(tipo == "hidden")
                {
                  valores = $(this).val().split(",");
                  myForm['asignatura'] = valores[0];
                  myForm['padre'] = valores[1];
                  myForm['hijo'] = valores[2];
                  myForm['cdCarrera'] = auxRamo.idCarrera;
                  myForm['Semestre'] = 1;
                  myForm['Anio'] = 2014;
                  myForm['userRut'] = "9334854";
                }

          });
          //Llamo al ajax y envio el objeto
          //console.log(myForm);
          //Checkear valores del formulario
          $.ajax({
                type: "POST",
                url: "ajax/setActividad.asp",
                data: myForm,
                success: function (setActiva) {
                    //Check for null values on form
                    alert(setActiva.mensaje);
                }
            });    

        });
    

  

    showTabla = function(pruebasJson)
    {
                  $("#tablaNotas").html("<thead><tr><td>Orden</td><td>Evaluaciones</td><td>Ponderaciones</td></tr></thead><tbody></tbody>");
                  $("#tablaNotas").dataTable({
                     "pagingType": "full_numbers",
                      "aaData": pruebasJson.pruebas,
                      "aoColumns": [
                            { "mData": "numero" },
                            { "mData": "nombre" },
                            {
                                "mData": null,
                                "mRender": function (data, type, full) {
                                      return  full.porcentaje +'%';
                                }
                            }
                            ],

                    "bDestroy": true
                  }).fnDraw();
    }


    pushUnidad = function(){
         $.ajax({
                type: "POST",
                url: "ajax/getUnidades.asp",
                data: {cdasigna: auxRamo.idAsignatura},
                success: function (getUnidades) {
                    ultimo = getUnidades.unidades.length;
                    getUnidades.unidades.splice(ultimo-1, 1);
                    showUnidades(getUnidades.unidades);
                }
            });  
    }


      $("#paso1").click(function(){

          //Almaceno cabecera del Syllabus y modifico tabla maasig para añadir campos horas y perfil
          //Datos update maasig
          var autonomo = $("#autonomo").val();
          var perfil = escapeNewLineChars($("#perfil").val());
          var cdasigna = auxRamo.idAsignatura;

            $.ajax({
                type: "POST",
                url: "ajax/setHorasPerfil.asp",
                data: { idAsig: cdasigna, hrsAuto: autonomo, perEgreso: perfil },
                success: function (setUni) {
                    //Check for null values on form
                }
            });       
          //Datos insertar y/o actualizar a Syllabus
          var myForm = $("#cabSyllabus").serializeObject();
          
          myForm['horarios'] = escapeNewLineChars($("#horarios").val());
          myForm['cdCarrera'] = auxRamo.idCarrera;
          myForm['Semestre'] = 1;
          myForm['Anio'] = 2014;
          myForm['userRut'] = "9334854";
          //myForm['fecha'] = moment().format("YYYY-MM-DD");
          $.ajax({
                type: "POST",
                url: "ajax/setSyllabus.asp",
                data: myForm,
                success: function (setUni) {
                    //Check for null values on form
                }
            });      


          $("#tabs").tabs('select', 1)
          $("#paso2").removeAttr("disabled");

      });

      $("#paso2").click(function(){

          var myForm = {};
          myForm['cdAsigna'] = auxRamo.idAsignatura;
          myForm['cdCarrera'] = auxRamo.idCarrera;
          myForm['Semestre'] = 1;
          myForm['Anio'] = 2014;
          myForm['estrategia'] = escapeNewLineChars($("#estrategia").val());
          myForm['userRut'] = "9334854";
          //myForm['fecha'] = moment().format("YYYY-MM-DD");
          $.ajax({
                type: "POST",
                url: "ajax/upEstrategia.asp",
                data: myForm,
                success: function (setUni) {
                    //Check for null values on form
                }
            });    
          $("#tabs").tabs('select', 2)
          $("#paso3").removeAttr("disabled");

      });

      $("#paso3").click(function(){

          var myForm = {};
          myForm['cdAsigna'] = auxRamo.idAsignatura;
          myForm['cdCarrera'] = auxRamo.idCarrera;
          myForm['Semestre'] = 1;
          myForm['Anio'] = 2014;
          myForm['reglas'] = escapeNewLineChars($("#reglas").val());
          myForm['userRut'] = "9334854";
          //myForm['fecha'] = moment().format("YYYY-MM-DD");
          $.ajax({
                type: "POST",
                url: "ajax/upReglas.asp",
                data: myForm,
                success: function (setUni) {
                    //Check for null values on form
                }
            });    

          $("#tabs").tabs('select', 3);
          //console.log(objActividades);

      });


       $("#paso4").click(function(){

          cargaGrilla();
          $("#paso2").attr("disabled","disabled");
          $("#paso3").attr("disabled","disabled");
      });

        //Bind a elementos agregados dinamicamente en parte 2
        //para almacenar unidades academicas y resultados de aprendizaje
        $('body').on('click', '.guardaUnidad', function() {
            //alert("Guardando");
            //Desplegar dialog con alerta
            aux = contador - 1;

            //Obtengo maximos nivels y subniveles
            
            $.ajax({
                type: "POST",
                url: "ajax/getMaxUnidad.asp",
                async:false,
                data: {asignatura: auxRamo.idAsignatura},
                success: function (getMaxUni) {
                    //Check for null values on form
                    objMaximo = getMaxUni;
                
                }
            });     

       
           //Asigno el siguiente
           var nextPadre = parseInt(objMaximo.nivel) + 1;
           var nextHijo = parseInt(objMaximo.subnivel) + 1;

           

            var myForm = $("#formUt"+aux+"").serializeObject();
            //console.log(auxRamo);
            myForm['cdasigna'] = auxRamo.idAsignatura;
            myForm['nivelPadre'] = nextPadre;
            myForm['userRut'] = "9334854";
            //Guarda unidad y resultados
            $.ajax({
                type: "POST",
                url: "ajax/setUnidad.asp",
                data: myForm,
                success: function (setUni) {
                    //Check for null values on form
                    alert(setUni.mensaje);
                    pushUnidad();
                    tabActividades();
                }
            });                  



            $("#uniTem").html("");
            $("#agregaUt").removeAttr("disabled");
            
            
            cont2 = 0;
        });


        //Bind a elementos agregados dinamicamente
        $('body').on('click', '.resAp', function() {
          var customId = $(this).attr('id');
          var customDiv = "divRes" + customId;
          var resultado = "Resultado de Aprendizaje: <input type'text' name='subResultado"+customId+cont2+"' id='subResultado"+customId+cont2+"' /></br>";
          $("#"+customDiv+"").append(resultado);    
          cont2++;
        });


       $("#agregaUt").click(function(){
          var unidad = "</br><form id='formUt"+contador+"'>Nombre Unidad Tematica: ";
              unidad += "<input type='text' id='contenido"+contador+"' name='contenido"+contador+"' />";
              unidad += "<input type='button' class='resAp' id='"+contador+"' value='Agregar Resultado' />";
              unidad += "</br><div id='divRes"+contador+"'></div></br>";
              unidad += "<input type='button' class='guardaUnidad' value='Guardar Unidad' /> </form>";
            
          $("#uniTem").append(unidad);
          contador++;
          $(this).attr("disabled","disabled");
       });



});

</script>
</head>

<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('../img/ir.jpg','../img/home2.jpg')">
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-W29R"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-W29R');</script>
<!-- End Google Tag Manager -->
<%  Dim n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, ASIGNATURAS, LISTAASIGNATURAS,  n_PorExamen
	dim s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer,s_NrMalla, s_NrParale, s_CdAsigna, s_NmEvaluacion, s_Eximicion, s_NotaExim, s_ObjGenerales, s_ObjEspecificos, s_Glsiseva, s_Glactapr, s_NmModalidad, s_NmFuncion, s_NmRegimen
    'Response.Buffer = True
	Response.CacheControl = "no-cache"
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	s_NmBrsProfe = ""
	s_StringAsig = ""
	d_FcSistema=#12-1-1999#
	Session("n_ano") = ""
	Session("n_periodo") = ""
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	'd_FcSistema = CDate(Session("d_FcSistema"))
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")

  '2014-05-08 fix para iniciar'
  n_NrRutProfe = 9334854

	s_StringAsig=Request("s_StringAsig")	
	If n_NrRutProfe = 0 Then		
		response.redirect("http://www.uvm.cl")
    End If	
	Session.TimeOut = 10	
	
 
%>
<table width="950" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="3"> <!--#include file="headerdocente.asp"--> </td>
  </tr>
  <tr> 
    <td height="10" colspan="3" bgcolor="#990000" class="fondo4"> <div><img src="../../img/rojo.jpg" width="10" height="10"></div></td>
  </tr>
  <tr> 
    <td width="190" height="100%" valign="top" bgcolor="#990000" class="fondo1"> 
      <table width="190" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="160" valign="top"> <table width="160" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><!--#include file="menu_docente.asp"--></td>
              </tr>
            </table></td>
          <td width="30" height="100%" valign="top"><img src="../../img/arco.jpg" width="30" height="100%"></td>
        </tr>
      </table></td>
    <td width="570" valign="top"> <table width="570" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td valign="top">
          <div align="center">
            <table width="670" height="100%" border="0" cellpadding="0" cellspacing="5">
                <tr> 
                  <td colspan="2" valign="top"> <div align="left"><img src="../img/portaldocente.jpg" width="277" height="16"><span class="txsubtitulo"><br>
                      </span><span class="homeintrod"><strong><br>
                      Bienvenido</strong> <%=(s_NmBrsProfe)%></span> </div></td>
                  <td width="185" valign="top"><div align="right"><a href="http://www.uvm.cl"><img src="../../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a> 
                    </div></td>
                </tr>
                <tr> 
                  <td colspan="3" valign="top"><hr size="1" noshade>
				  <%If s_Existe = "S" Then%>
				  <!--<iframe src="comunicado.asp" width="560" height="100" scrolling="yes" frameborder="no"></iframe>-->
				  <!--#include file="comunicado.asp"-->
				  <%End If%></td>
                </tr>
                 
               
                <tr> 

                  <td valign="top">

                  <div id="formulario">

                  <h2 class="homeintrod">Asignaturas del Docente:</h2>
                  
                  </div>
                  
                  </td>


                </tr>


                
              </table>

               <table id="asignaturas" width="100%"></table>


                     
                     
               </div>




<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Datos de la Asignatura</a></li>
    <li><a href="#tabs-2">RA y Unidades Tematicas</a></li>
    <li><a href="#tabs-3">Evaluaciones</a></li>
    <li><a href="#tabs-4">Planificacion Actividades</a></li>
  </ul>
  <div id="tabs-1"> <small>
                    <form id="cabSyllabus">

                    <!--  Asignatura: <input type="text" id="asignatura" name="asignatura" value="" readonly="true"/> </br>
                     Carrera: <input type="text" id="carrera" name="carrera" value="" readonly="true"/> </br>
                     Codigo: <input type="text" id="cdAsigna" name="cdAsigna" value="" readonly="true"/> </br>
                     Requisitos: <textarea id="requisitos" name="requisitos" readonly="true"></textarea></br>
                     Horarios: <textarea id="horarios" name="horarios"></textarea></br>
                     UD: <input type="text" id="ud" name="ud" value="" readonly="true" /> </br>
                     SCT: <input type="text" id="ust" name="ust" value="" readonly="true" /> </br>
                     Trabajo Aut&oacute;nomo Semanal: <input type="text" id="autonomo" name="autonomo" value="" /> </br>
                     Profesor: <input type="text" id="profesor" name="profesor" value="" readonly="true" /> </br>
                     Correo Electr&oacute;nico: <input type="text" id="correo" name="correo" value="" readonly="true" /> </br>
                     Horario de Atenci&oacute;n: <input type="text" id="atencion" name="atencion" value="" /> </br>

                     CONTRIBUCION AL PERFIL DE EGRESO:</br>
                     <textarea id="perfil" name="perfil"></textarea></br></br>
                     <input type="button" id="paso1" name="paso1" value="Guardar Paso 1" /> -->
                     
                     <div id="col1"> 
                     <div class="field">Asignatura: <input type="text" id="asignatura" name="asignatura" value="" readonly></div>
                     <div class="field">Carrera: <input type="text" id="carrera" name="carrera" value="" readonly></div>
                     <div class="field">Codigo: <input type="text" id="cdAsigna" name="cdAsigna" value="" readonly></div>
                     <div class="field">Requisitos: <textarea id="requisitos" name="requisitos" readonly></textarea></div>
                     <div class="field">Horarios: <textarea id="horarios" name="horarios"></textarea></div>
                     
                      </div>
                    
                     <div id="col2"> 
                     <div class="field">Trabajo Aut&oacute;nomo Semanal: <input type="text" id="autonomo" name="autonomo" value=""></div>
                     <div class="field">Profesor: <input type="text" id="profesor" name="profesor" value="" readonly></div>
                     <div class="field">Correo Electr&oacute;nico: <input type="text" id="correo" name="correo" value="" readonly></div>
                     <div class="field">Horario de Atenci&oacute;n: <input type="text" id="atencion" name="atencion" value=""></div>
                     <div class="field">UD: <input type="text" id="ud" name="ud" value="" readonly></div>
                     <div class="field">SCT: <input type="text" id="ust" name="ust" value="" readonly></div>
                     </div>

                     <div class="field">CONTRIBUCION AL PERFIL DE EGRESO:<textarea id="perfil" name="perfil"></textarea></div>
                     <div class="boton"><input type="button" id="paso1" name="paso1" value="Guardar Paso 1"></div>
                     </form>

                     </small>
  </div>
  <div id="tabs-2"><small>
    <!--<p>PUNTOS 3 Y 4</p> --></br>
    <input type="button" id="agregaUt" name="agregaUt" value="Nueva Unidad Tematica" /></br>
    <div id="uniTem"></div></br></br>
    <table id="tablaUnidades" width="100%"></table>
    </br></br>

    <!-- Estrategia de Aprendizaje: <textarea id="estrategia"></textarea></br></br>

    
    <input type="button" id="paso2" name="paso2" value="Guardar Paso 2" disabled="true" /> -->

    <div class="field">Estrategia de Aprendizaje: <textarea id="estrategia"></textarea></div>
    <div class="boton"><input type="button" id="paso2" name="paso2" value="Guardar Paso 2" disabled="true"></div>

    </small>
  </div>
  <div id="tabs-3"><small>
    <p>Evaluaciones:</p>
    Se debe considerar los procedimientos de evaluaci&oacute;n mencionados en el Programa de Asignatura. Recordar asegurar la consistencia con los resultados
    de aprendizaje de la asignatura. Establecer la generalidad respecto... </br></br>

    <table id="tablaNotas" width="100%"></table></br></br>

    <!-- Reglas del Curso: <textarea id="reglas"></textarea></br></br>

    <input type="button" id="paso3" name="paso3" value="Guardar Paso 3" disabled="true" /> -->

    <div class="field">Reglas del Curso: <textarea id="reglas"></textarea></div>

    <div class="boton"><input type="button" id="paso3" name="paso3" value="Guardar Paso 3" disabled="true"></div>
    </small>
  </div>

  <div id="tabs-4"><small>
    <p>Planificaci&oacute;n de Actividades:</p>
    
    <ul>
      <li type="circle">Se&ntilde;ale los contenidos en el espacio donde se indican temas.</li>
      <li type="circle">Las actividades a desarrollar para el logro de los resultados de aprendizaje, deben considerar c&aocute;tedras, taller, laboratorios y/o cl&iacute;nicas, seg&uacute;n corresponda.</li>
      <li type="circle">Se&ntilde;ale las semanas de evaluaci&oacute;n, considerando.....</li>
    </ul>
    </br></br>
    <table id="planActividad" width="100%" border='1' style="border-collapse: collapse;"></table>

    <!-- <input type="button" id="paso4" name="paso4" value="Guardar Paso 4" /> -->
    <div class="boton"><input type="button" id="paso4" name="paso4" value="Volver"></div>
    </small>
  </div>
</div>

          </div></td>
        </tr>
      </table></td>
    <td width="190" valign="top">&nbsp;</td>
  </tr>
  <tr>


              

    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4"><table width="570" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td class="textblanco"><strong>Secretar&iacute;a Acad&eacute;mica UVM</strong> / Fono 2462500 / <a href="mailto:sec.academica@uvm.cl" target="_blank" class="estilo2">sec.academica@uvm.cl</a></td>
      </tr>
    </table></td>
  </tr>
  <div id="myDiv">
                
   <table id="asignaturas" width="100%"></table>
                
</div>
</table>
</body>
</html>
