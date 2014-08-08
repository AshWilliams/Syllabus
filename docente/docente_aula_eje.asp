<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="class_md5.asp"-->
<body onLoad="document.sw.submit()">
<%  dim  n_NrRutProfe, s_Clave, objMD5
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmClave = Session("s_Clave") 
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")
	If n_NrRutProfe = 0 Then		
	   Response.Redirect("../timeout.asp")
	   session.abandon   
	End If	
	s_Nmaula = "aula"
	
	If n_NrRutProfe > 0 Then
		d_fecha = date()
		h_hora = time()
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "3"
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
	End If

	Set objMD5 = New MD5
	objMD5.Text = s_Nmaula
	s_aula = objMD5.HEXMD5
	
	'Response.Write objMD5.HEXMD5 ' This will display an MD5 hash
%>
<form action="http://edutic.uvm.cl/aulavirtual/login/eje_control_m.php" method="post" name="sw" id="sw" >
	<input name="usuario" type="hidden" id="usuario" value="<%=(n_NrRutProfe)%>">
	<input name="clave" type="hidden" id="clave" value="<%=(s_NmClave)%>">
	<input name="llave" type="hidden" id="llave" value="<%=(s_aula)%>">
</form>
<%set objMD5 = nothing%>
</body>
    