<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Aula Virtual - Universidad de Vina del Mar</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<%
	n_NrRutProfe = Session("n_NrRutProfe")
	If n_NrRutProfe = 0 Then		
	   Response.Redirect("../timeout.asp")
	   session.abandon   
	End If	
%>
<body background="img/aula_fondo.jpg" leftmargin="0" topmargin="0" onLoad="MM_preloadImages('img/aula_cont2.gif','img/aula_ayu2.gif','img/aula_faq2.gif','img/aula_biblio2.gif','img/aula_uvm2.gif','img/aula_asignaturas.gif')">
<table width="990" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><img src="img/aula_top.jpg" width="990" height="100"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table border="0" align="center" cellpadding="0" cellspacing="10">
        <tr>
          <td height="20" valign="top"><img src="img/aula_asignaturas2.gif" name="asig" width="201" height="122" border="0" id="asig" onMouseOver="MM_swapImage('asig','','img/aula_asignaturas.gif',1)" onMouseOut="MM_swapImgRestore()"></td>
          <td valign="top"> 
            <table width="536" border="1" cellpadding="2" cellspacing="0" bordercolor="#CCCCCC">
              <tr>
                <td bordercolor="#FF0000" background="img/aula_h2.png"><strong><font color="#FFFFFF" size="3" face="Arial, Helvetica, sans-serif">Noticias</font></strong></td>
              </tr>
              <tr>
                <td bgcolor="#FFFFFF">
					<p><!--<iframe src="http://www.uvm.cl/pruebaaula/home.shtml" width="530" height="340" frameborder="0"></iframe>-->
                    </p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p align="center"><strong>Aula Virtual moment&aacute;neamente fuera de servicio</strong>. <br>
				  <strong>Por su comprensi&oacute;n, muchas gracias.</strong></p>
				<p >&nbsp;</p>
<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p></td>
              </tr>
            </table><p>&nbsp;</p></td>
          <td valign="top">
<table width="200" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF0000">
              <tr> 
                <td bordercolor="#FF0000" background="img/aula_h2.png"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif">Accesos 
                  directos</font></strong></td>
              </tr>
              <tr> 
                <td bordercolor="#CCCCCC"> 
                  <table border="0" align="center" cellpadding="0" cellspacing="10">
                    <tr> 
                      <td><a href="http://ticedu.uvm.cl/contacto/contacto.html" target="_blank"><img src="img/aula_cont1.gif" name="cont" width="58" height="76" border="0" id="cont" onMouseOver="MM_swapImage('cont','','img/aula_cont2.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                      <td><a href="http://ticedu.uvm.cl/ayuda/ayuda.html" target="_blank"><img src="img/aula_ayu1.gif" name="ay" width="58" height="79" border="0" id="ay" onMouseOver="MM_swapImage('ay','','img/aula_ayu2.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                    </tr>
                    <tr> 
                      <td><a href="http://ticedu.uvm.cl/uvmfaq/" target="_blank"><img src="img/aula_faq1.gif" name="faq" width="58" height="78" border="0" id="faq" onMouseOver="MM_swapImage('faq','','img/aula_faq2.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                      <td><a href="http://biblioteca.uvm.cl/biblioteca.asp" target="_blank"><img src="img/aula_biblio1.gif" name="biblio" width="58" height="76" border="0" id="biblio" onMouseOver="MM_swapImage('biblio','','img/aula_biblio2.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                    </tr>
                    <tr> 
                      <td><a href="http://www.uvm.cl/" target="_blank"><img src="img/aula_uvm1.gif" name="uvm" width="61" height="76" border="0" id="uvm" onMouseOver="MM_swapImage('uvm','','img/aula_uvm2.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#990000">&nbsp;</td>
  </tr>
</table>
</body>
</html>