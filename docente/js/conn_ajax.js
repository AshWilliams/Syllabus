// JavaScript Document
var Conexion = false;
if ( window.XMLHttpRequest ) 
	Conexion=new XMLHttpRequest();
else if ( window.ActiveXObject )
    Conexion=new ActiveXObject("Microsoft.XMLHTTP");
		

function DisplayInfo(rut)
{
	
 // En espera del valor 4 ( "respuesta completa" )
 if ( Conexion.readyState!=4 ) return;
alert('testing'+rut);
if ( Conexion.status==200 ) { // Si conexion HTTP es buena !!!
	
	document.getElementById('testing'+rut).innerHTML = Conexion.responseText;
	//document.getElementById("testing").value = "Holaaaa";
}

}

function clicka(s_NrRutAlu,n_CdCarrera,n_NrAnoPrueba,n_NrPerPrueba,n_CdAsigna,n_CdDepende,s_CierraActa)
{
	//var letras = document.getElementById("ColegiosaBuscar")
     // Preparacion.
    //Servidor="http://localhost/portal_servicio_matr_Nuevos/funciones_asp/Buscar_Colegios.asp?texto=" + letras.value;
	//Servidor="http://testing/portal_servicio_matr_Nuevos/funciones_asp/Buscar_Colegios.asp?texto=" + letras.value;
 	Servidor="ajax/DespliegaInfo.asp?n_CdCarrera="+n_CdCarrera+"&n_NrAnoPrueba="+n_NrAnoPrueba+"&n_NrPerPrueba="+n_NrPerPrueba+"&s_NrRutAlu="+s_NrRutAlu+"&n_CdAsigna="+n_CdAsigna+"&n_CdDepende="+n_CdDepende+"&s_CierraActa="+s_CierraActa;
  
   Conexion.open("GET",Servidor,true);
	
    // Manejando eventos.
    Conexion.onreadystatechange=function ()
	{
		// En espera del valor 4 ( "respuesta completa" )
 		if ( Conexion.readyState!=4 ) return;
		if ( Conexion.status==200 ) { // Si conexion HTTP es buena !!!
	
			document.getElementById('resolucion'+s_NrRutAlu).value = Conexion.responseText;
			if (document.getElementById('resolucion'+s_NrRutAlu).value == 'S') {
				document.getElementById(s_NrRutAlu+'NOTA2').value = "";
				document.getElementById(s_NrRutAlu+'NOTA3').value = "";
				document.getElementById(s_NrRutAlu+'NOTA2').disabled = true;
				document.getElementById('checkReprueba'+s_NrRutAlu).checked = false;
				document.getElementById('flag'+s_NrRutAlu).value = "S";
			}
			else {
				alert('Falta Resolucion que acredite estado pendiente');
				document.getElementById('checkPendiente'+s_NrRutAlu).checked = false;
			}
		}
	}

    // Solicitud al servidor.
    Conexion.send();                     
}

function clicka_val(s_NrRutAlu,n_CdCarrera,n_NrAnoPrueba,n_NrPerPrueba,n_CdAsigna,n_CdDepende,s_CierraActa)
{
	//var letras = document.getElementById("ColegiosaBuscar")
     // Preparacion.
    //Servidor="http://localhost/portal_servicio_matr_Nuevos/funciones_asp/Buscar_Colegios.asp?texto=" + letras.value;
	//Servidor="http://testing/portal_servicio_matr_Nuevos/funciones_asp/Buscar_Colegios.asp?texto=" + letras.value;
 	Servidor="ajax/DespliegaInfo.asp?n_CdCarrera="+n_CdCarrera+"&n_NrAnoPrueba="+n_NrAnoPrueba+"&n_NrPerPrueba="+n_NrPerPrueba+"&s_NrRutAlu="+s_NrRutAlu+"&n_CdAsigna="+n_CdAsigna+"&n_CdDepende="+n_CdDepende+"&s_CierraActa="+s_CierraActa;
  
   Conexion.open("GET",Servidor,true);
	
    // Manejando eventos.
    Conexion.onreadystatechange=function ()
	{
		// En espera del valor 4 ( "respuesta completa" )
 		if ( Conexion.readyState!=4 ) return;
		if ( Conexion.status==200 ) { // Si conexion HTTP es buena !!!
	
			document.getElementById('resolucion'+s_NrRutAlu).value = Conexion.responseText;
			if (document.getElementById('resolucion'+s_NrRutAlu).value == 'S') {
				document.getElementById(s_NrRutAlu).value = 6;
			}
			else {
				alert('Falta Resolucion que acredite estado pendiente');
				document.getElementById(s_NrRutAlu).value = 7;
			}
		}
	}

    // Solicitud al servidor.
    Conexion.send();                     
}

