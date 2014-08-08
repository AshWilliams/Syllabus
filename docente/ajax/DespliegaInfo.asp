<!--#include file="Prof_Acta.inc"-->
<%
function Valor(nodo,etiqueta)
	valor = nodo.selectSingleNode(etiqueta).text
end function

	dim o, s_Reg_Fecha, rut
	'rut = Request("rut")
	n_CdCarrera   = Request("n_CdCarrera")		
    n_NrAnoPrueba = Request("n_NrAnoPrueba")
	n_NrPerPrueba = Request("n_NrPerPrueba")
	s_NrRutAlu     = Request("s_NrRutAlu")
	's_TipoAsig    = Request("s_TipoAsig")
	'n_NrParalelo  = Request("n_NrParalelo")
	's_TpRegimen   = Request("s_TpRegimen")
	n_CdAsigna    = Request("n_CdAsigna")
 	n_CdDepende   = Request("n_CdDepende")
	s_CierraActa  = Request("s_CierraActa") 
	
	set o = getComponent()
	
	Call o.Act_ValidaPendiente(n_NrAnoPrueba, n_NrPerPrueba, n_CdCarrera, n_CdDepende,  n_CdAsigna, s_NrRutAlu, s_Pendiente)
	
	Response.Write(s_Pendiente)
	
set o = nothing
%>