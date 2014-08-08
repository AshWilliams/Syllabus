<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Notas_Actas_Profesor.inc"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Documento sin t&iacute;tulo</title>
</head>

<body>
<%
dim o, n_CdCarrera, s_NmCarrera
Set o = getComponent()

n_CdCarrera = 172
s_NmCarrera = ""
Call o.Act_Java(n_CdCarrera, s_NmCarrera)
response.write(s_NmCarrera)%>
</body>
</html>
