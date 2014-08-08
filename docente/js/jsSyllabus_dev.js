var getSyllabus;
var showTabla;
var showNotas;
var objAsignaturas;
var objMaximo;
var cargaGrilla;
var contador = 0;
var cont2 = 0;
var auxRamo;
var existe = 0;

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

      showTable = function (respuesta) {
        
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

    

    getSyllabus = function (codASigna)
    {
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


     
    }


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

          $("#tabs").tabs('select', 3)

      });


       $("#paso4").click(function(){

          cargaGrilla();
          $("#paso2").attr("disabled","disabled");
          $("#paso3").attr("disabled","disabled");
      });

        //Bind a elementos agregados dinamicamente en parte 2
        //para almacenar unidades academicas y resultados de aprendizaje
        $('body').on('click', '.guardaUnidad', function() {
            alert("Guardando");
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


           //console.log(objMaximo.nivel);

           var nextPadre = parseInt(objMaximo.nivel) + 1;
           var nextHijo = parseInt(objMaximo.subnivel) + 1;

           //console.log(nextHijo);

            var myForm = $("#formUt"+aux+"").serializeObject();
            //console.log(auxRamo);
            myForm['cdasigna'] = auxRamo.idAsignatura;
            //funciona guarda unidad y resultados
            $.ajax({
                type: "POST",
                url: "ajax/setUnidad.asp",
                data: myForm,
                success: function (setUni) {
                    //Check for null values on form
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
