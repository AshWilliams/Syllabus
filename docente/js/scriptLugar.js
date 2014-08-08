var delLugar;
var editLugar;
var jsonTest;
var showtable;
$(document).ready(function () {
    $("#dialog-confirm").hide();
    $("#dialog").hide();
    $("#Div1").hide();

    $("#imprime").click(function () {
        $.ajax({
            type: "POST",
            url: "getReporte",
            data: { test: 1, jsonT: JSON.stringify(jsonTest) },
            success: function (respuesta) {
                //console.log(respuesta);
                //alert(respuesta.Mensaje);
            }
        });

    });

    delLugar = function (codigo) {
        $('#dialog-confirm').dialog({
            resizable: true,
            modal: true,
            title: "Desea Eliminar Lugar de Reposo: " + codigo,
            buttons: {
                "Eliminar Lugar": function () {
                    $(this).dialog("close");
                    elimLugar(codigo);
                },
                Cancel: function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    function elimLugar(codigo) {
        $.ajax({
            type: "POST",
            url: "deleteLugar",
            data: { codigo: codigo },
            success: function (respuesta) {
                //table = $("#Tabla").dataTable();
                //table.fnClearTable();
                showTable();
                alert(respuesta);
            }
        });

    }

    editLugar = function (codigo, lugar) {
        $("#actual").val($.trim(lugar));
        $("#codigo").val($.trim(codigo));
        $('#Div1').dialog({
            resizable: true,
            modal: true
        });
    }

   
    function showTable() {
        $.getJSON("GetLugares", null, function (licencias) {
            jsonTest = licencias;
            $("#Tabla").html("<thead><tr><td>Tipo</td><td>Nombre</td><td>Editar</td><td>Eliminar</td></tr></thead><tbody></tbody>");
            $("#Tabla").dataTable({
                "aaData": licencias,
                "aoColumns": [
                            { "mData": "ID" },
                            { "mData": "Nombre" },
                            {
                                "mData": null,
                                "mRender": function (data, type, full) {
                                    var nombre = ",'" + full.Nombre + "'";
                                    return '<a onclick="editLugar(' + full.ID + nombre + ')" >Editar</a>';
                                }
                            },
                            {
                                "mData": null,
                                "mRender": function (data, type, full) {
                                    return '<a onclick="delLugar(' + full.ID + ')">Eliminar</a>';
                                }
                            }

                            ],
                "bDestroy": true
            }).fnDraw();
        });
    }

    showTable();


    $('#nuevo').click(function (event) {
        event.preventDefault();
        $("#describe").val("")
        $('#dialog').dialog({
            resizable: true,
            modal: true
        });
    });

    $("#guarda").click(function () {
        var valor = $("#describe").val();
        if (valor == "") {
            alert("Debe ingresar un valor");
        }
        else {
            $("#dialog").dialog('close');
            $.ajax({
                type: "POST",
                url: "insertLugar",
                data: { describe: valor },
                success: function (respuesta) {
                    //table = $("#Tabla").dataTable().fnDraw();
                    //table.fnClearTable();
                    showTable();
                    alert(respuesta);
                }
            });
        }
    });

    $("#actualiza").click(function () {
        var describe = $("#actual").val();
        var codigo = $("#codigo").val();
        if (describe == "") {
            alert("Debe completar la informacion");
        }
        else {
            $("#Div1").dialog('close');
            $.ajax({
                type: "POST",
                url: "updateLugar",
                data: { codigo: codigo, describe: describe },
                success: function (respuesta) {
                    //table = $("#Tabla").dataTable().fnDraw();
                    //table.fnClearTable();
                    showTable();
                    alert(respuesta);
                }
            });
        }
    });
});