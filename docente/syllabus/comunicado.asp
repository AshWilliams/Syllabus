<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="librDocenteUVM.inc"-->
<link href="../estilos.css" rel="stylesheet" type="text/css">
<%	dim o, doc, xml, AGENDA, REGISTRO
    Function Valor(nodo,etiqueta)
		valor = nodo.selectSingleNode(etiqueta).text
	End function
	n_NrAnoActivo = Session("n_NrAnoActivo")
	n_NrPerActivo = Session("n_NrPerActivoDoc")
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")
	
	Set o = getComponent()
	n_NrMarca = 1  ' marca en 1 para que se muestre solamente el mensaje del index
	xml = o.Consulta_Agenda_Profesor(n_NrMarca)
		Set doc = Server.CreateObject ("MSXML.DomDocument")
		Call doc.loadxml (xml)
		set AGENDA = doc.selectNodes("//AGENDA/REGISTRO")%>

<style type="text/css">
<!--
.Estilo4 {color: #FFFFFF}
.Estilo5 {color: #ffffff}
-->
</style>
<table width="560" border="2" cellpadding="0" cellspacing="0" bordercolor="#CC0001">
  <% set REGISTRO= AGENDA.nextNode
			while not (REGISTRO is nothing)%>
  <tr bgcolor="#CC0001" class="texto">
    <td width="70" class="texto"><div align="center" class="Estilo1 Estilo4"><%= valor(REGISTRO,"s_FcRegistro")%></div></td>
    <td width="486" colspan="2"><div align="left" ><strong><font size="1" face="Arial, Helvetica, sans-serif"><a href="prof_com_globales_detalle.asp?n_NrRegistro=<%= valor(REGISTRO,"s_NrRegistro")%>&s_Fecha=<%=valor(REGISTRO,"s_FcRegistro")%>&s_Asunto=<%=valor(REGISTRO,"s_TpAsunto")%>" class="estilo2 Estilo5">
	<%= valor(REGISTRO,"s_TpAsunto")%></a></font></strong></div></td>
  </tr>
  <tr bgcolor="#CC0001" class="texto">
    <td colspan="3" class="textblanco"><%= valor(REGISTRO,"s_Resumen")%></td>
  </tr>
  <% set REGISTRO= AGENDA.nextnode
			 	 wend
				'n_NrContador = n_Nrcontador + 1
				%>
</table>
