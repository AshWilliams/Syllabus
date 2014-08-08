<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="librDocenteUVM.inc"-->
<!--#include file="class_md5.asp"-->
<body onLoad="document.sw.submit()">
<%
dim s_preNombrs, s_postNombrs, s_postApellidos, s_Email, s_preLlave, s_postLlave, s_Cadena, n_NrRutProfe, o

s_preLlave = "LaureateUVM" 

Set objMD5 = New MD5
	objMD5.Text = s_preLlave
	s_postLlave = objMD5.HEXMD5
if session("n_NrRutProfe") <> "" then     ' si es docente
	n_NrRutProfe = Session("n_NrRutProfe") 
	set o = getComponent()
	call o.Consulta_Email_Profesor(n_NrRutProfe, s_Email, s_postNombrs, s_postApellidos)
else
	response.redirect("http://www.uvm.cl")
end if
	
%>
<form action="http://escuelas.uvm.cl/sso_laureate/Envio_Datos_Laureate.php" method="post" name="sw" id="sw" >
	<input name="FirstName" type="hidden" id="FirstName" value="<%=(s_postNombrs)%>">
	<input name="LastName" type="hidden" id="LastName" value="<%=(s_postApellidos)%>">
	<input name="UniversityEmail" type="hidden" id="UniversityEmail" value="<%=(s_Email)%>">
	<input name="postLlave" type="hidden" id="postLlave" value="<%=(s_postLlave)%>">
</form>
<%set objMD5 = nothing%>

</body>