<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="librDocenteUVM.inc"-->
<%
Dim o, n_NrRutProfe, s_DirDocente, s_NrTelefono, d_FcNaciMi, s_CorreoElec, s_EstadoCiv
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
	
	n_NrRutProfe = 0
	s_DirDocente = ""
	s_NrTelefono = ""
	s_CorreoElec = ""
	s_EstadoCiv = ""
	d_fecha = Date()
	h_hora = time()
	
	n_NrRutProfe = Session("n_NrRutProfe")
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivo")

	If Request.Form("accion") = "Actualizar" then
		Set o = getComponent() 
		s_DirDocente = Request("DirDocente")
		s_NrTelefono = Request("NrTelefono")
		s_CorreoElec = Request("CorreoElec")
		
		'***********  FUNCION PARA EL REGISTRO DE LOG ***************
		'funcion que escanea la fecha y determina que caracter trae como separador, si es / o - para que sea reemplazado por un _ y sea 
		'creado un archivo con el rut del usuario y la fecha, para que se actualice el archivo diariamente
		var = 0
		var2 = 0
		s_opcion = "D"	
		n_modulo = "1_2"
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

		Call o.Modifica_datos_docente(n_NrRutProfe, s_DirDocente, s_NrTelefono, s_CorreoElec)
		n_error = 100
		Response.redirect("prof_datos_personales.asp?s_error"&"="&n_error)
	End If	

	If Request.Form("accion") = "Cancelar" then
	   s_DirDocente = Request("DirDocente")
		s_NrTelefono = Request("NrTelefono")
		d_FcNaciMi = Cdate(Request("FcNaciMi"))
		s_CorreoElec = Request("CorreoElec")
		s_EstadoCiv = Request("EstadoCiv")
	   Response.redirect("index.asp")
	End If
set o = nothing
%>
    