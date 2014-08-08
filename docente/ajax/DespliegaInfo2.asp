<!--#include file="Notas_Actas_Profesor.inc"-->
<%
'function Valor(nodo,etiqueta)
'	valor = nodo.selectSingleNode(etiqueta).text
'end function

	dim o, s_NmNombre, rut
	rut = Request("rut")
	set o = getComponent()
	
	Call o.Consulta_Info_Check2(rut, s_NmNombre)
	
	Response.Write(s_NmNombre)
	
set o = nothing
%>