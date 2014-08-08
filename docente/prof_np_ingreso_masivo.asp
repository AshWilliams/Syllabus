<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="librDocenteUVM.inc"-->
<html>
<head>
<title>PortalUVM - Docente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../estilos.css" rel="stylesheet" type="text/css">
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
<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ocultamenu();despliega();return false;">
<%  Dim o, doc, xml, ALUMNOS, NOTAS, n_NrRutProfe, n_NrAnoActivo, n_NrPerActivo, s_NmBrsProfe, d_FcSistema, s_StringAsig, s_CdCarrer, s_NrMalla, s_NrParale, s_CdAsigna, s_NmCarrer, s_NmAsigna, n_NrOrigen, n_NrError, n_NrContador, n_Sw, s_vlNota, id_campo_nota, n_vlNota, s_NrRutAlu, s_NmError
	Function Separa(s)
		dim text
		text = s
		pos = 0
		pos = InStr(text,"*")
		if pos > 0 then
	  		salida=left(text,pos-1)
		else
			salida=text
		end if
		s = Right(text,len(text)-pos)
		separa = salida
	End function
	Function Valor(nodo,etiqueta)
		valor = nodo.selectSingleNode(etiqueta).text
	End function
	d_FcSistema=#12-1-1999#
	d_FcPrueba=#1999/12/1#
	n_NrRutProfe = 0
	n_NrAnoActivo = 0
	n_NrPerActivo = 0
	n_CdCarrer = 0
	n_CdCarrerAlu = 0
	n_NrParalelo = 0
	n_CdAsigna = 0
	n_NrPrueba = 0
	n_NvPrueba = 0
	s_NrSubPru = 0
	s_NrSubPar = 0
	n_NrOrigen = 1
	n_NrError = 0
	n_NrContador = 1
	n_Sw = 0
	n_vlNota = 0
	s_NmBrsProfe = ""
	s_TipoAsig=""
	s_StringAsig = ""
	s_NrMalla  = ""
	s_NmCarrer = ""
	s_NmAsigna = ""
	s_NmError = ""
	s_VlNota = ""
	id_campo_nota = ""
	s_NrMalla = ""
	s_NmCarreraAlu = ""
	n_NrAnoActivo = Session("n_NrAnoActivo")
	'n_NrPerActivo = Session("n_NrPerActivo")
	n_NrProceMapaes = Session("n_NrProceMapaes")
	If n_NrProceMapaes > 0 Then
		n_NrPerActivo = n_NrProceMapaes
	End If
	'd_FcSistema = Session("d_FcSistema")
	d_FcSistema = date()
	n_NrRutProfe = Session("n_NrRutProfe")
	s_NmBrsProfe = Session("s_NmBrsProfe")		
	d_FechaRegistro = date()
	If n_NrRutProfe = 0 Then
	   response.redirect("http://www.uvm.cl")
    End If
	Session.TimeOut = 10
	s_StringAsig = Request("s_StringAsig")
	If s_StringAsig <> "" Then
		n_CdAsigna = Separa(s_StringAsig)
		s_NmAsigna = Separa(s_StringAsig)
		s_TipoAsig = Separa(s_StringAsig)
		n_NrParalelo = Separa(s_StringAsig)
		n_CdCarrer = Separa(s_StringAsig)
        n_NrPrueba = Separa(s_StringAsig)
        s_NmPrueba = Separa(s_StringAsig)
		d_FcPrueba = Separa(s_StringAsig)
		s_NmError = Separa(s_StringAsig)
	End If
	Set o = getComponent()
	
	n_NrPerActivo = n_NrProceMapaes
%>
<table width="950" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="3"> <!--#include file="headerdocente.asp"--></td>
  </tr>
  <tr> 
    <td height="10" colspan="3" bgcolor="#990000" class="fondo4"> <div><img src="../img/rojo.jpg" width="10" height="10"></div></td>
  </tr>
  <tr> 
    <td width="190" height="100%" valign="top" bgcolor="#990000" class="fondo1"> 
      <table width="190" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="160" valign="top"><table width="160" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><!--#include file="menu_docente.asp"--></td>
              </tr>
            </table></td>
          <td width="30" height="100%" valign="top"><img src="../img/arco.jpg" width="30" height="100%"></td>
        </tr>
      </table></td>
    <td width="570" valign="top"> 
      <table width="570" border="0" cellpadding="0" cellspacing="5">
	  <form action="" method="post" enctype="application/x-www-form-urlencoded"  name="form_ingreso" id="form_ingreso" >
        <tr> 
          <td height="65" valign="top"> <div align="left"> 
              <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top"><img src="img/portaldocente.jpg" width="277" height="16"></td>
                  <td> <div align="right"><a href="index.asp"><img src="../img/home1.jpg" name="Image5" width="68" height="36" border="0" id="Image5" onMouseOver="MM_swapImage('Image5','','../img/home2.jpg',1)" onMouseOut="MM_swapImgRestore()"></a></div></td>
                </tr>
              </table>
            </div>
            <hr size="1" noshade> </td>
        </tr>
        <tr> 
          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2" class="Estilo11"><span class="texto">Periodo:</span>                  <span class="respuesta"><strong>
                  <%
				  n_NrProceMapaes = Session("n_NrProceMapaes")
					If n_NrProceMapaes > 0 Then
						n_NrPerActivo = n_NrProceMapaes
					End If
	
	 call response.write (n_NrAnoActivo&"/"&n_NrPerActivo) %>
&nbsp;</strong></span>&nbsp;              <span class="texto">Fecha:</span>
              <span class="respuesta"><strong>
              <% call response.write (d_FechaRegistro) %>
&nbsp;</strong></span>&nbsp;              <span class="texto">Nombres:</span><strong class="respuesta">
              <% call response.write (s_NmBrsProfe) %>
              </strong></td>
              </tr>
            <tr>
              <td colspan="2" class="Estilo11">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" class="txtitulo">Ingreso de Notas Masivo</td>
              </tr>
            <tr>
              <td colspan="2" class="txsubtitulo">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2"><font class="Estilo11">&nbsp;
              </font>
			   <%				
			   'CONSULTA BLOQUEO DE CALENDARIO 15/07/2013
				n_Permite_Registro = 0
				Call o.Act_Consulta_Calendario_NotasParciales(n_NrAnoActivo, n_NrPerActivo, n_CdCarrer, n_Permite_Registro)
				If n_Permite_Registro <> 10 Then
					s_NmError = "ATENCIÓN: El sistema se encuentra cerrado para registro y modificaciones de notas parciales. Favor, dirigirse al Jefe de Carrera."
				End If
				If s_NmError <> "" Then%>
                <table width="570" border="1" cellpadding="0" cellspacing="0" bordercolor="#FF0000">
                  <tr>
                    <td><font class="respuesta">
                      <% call response.write (s_NmError) %>
                    </font></td>
                  </tr>
                </table>
				<%End If%></td>
              </tr>
            <tr>
              <td colspan="2" class="texto">Asignatura:<span class="Estilo14">
                <strong>
                <% Response.Write(s_NmAsigna)%>
&nbsp;&nbsp;&nbsp;</strong></span><font size="1" face="Arial, Helvetica, sans-serif"><span class="Estilo9"><span class="Estilo8">&nbsp;
                </span></span></font>Tipo:
                <span class="respuesta"><strong>
              <% Response.Write(s_TipoAsig)%>
&nbsp;&nbsp;</strong></span><span class="input"><strong>&nbsp;&nbsp;
                </strong></span>Paralelo:<strong class="respuesta">
              <% Response.Write(n_NrParalelo)%>
                  </strong></td>
              </tr>
            <tr>
              <td colspan="2" class="texto">Prueba:<span class="respuesta">                
                <% 
			
						xml = o.Consulta_Lista_Curso_Nota(n_NrAnoActivo, n_NrPerActivo, n_CdCarrer, n_CdAsigna, n_NrParalelo, s_TipoAsig, n_NrPrueba, n_NrRutProfe)
						Set doc = Server.CreateObject ("MSXML.DomDocument")
						Call doc.loadxml (xml)
						set NOTAS = doc.selectNodes("//NOTAS/ALUMNOS")
						Response.Write(s_NmPrueba&" Fecha l&iacute;mite de registro de Nota: "&d_FcPrueba)%>              
                </span></td>
              </tr>
            <tr>
              <td colspan="2" class="texto">&nbsp;</td>
            </tr>
            <tr>
              <td width="43%"><input name="accion" type="submit" <%If n_Permite_Registro <> 10 Then%>disabled <%End If%> class="Submit" id="accion" value="Guardar"></td>
              <td width="57%"><input name="accion" type="submit" class="input" id="accion" value="Volver"></td>
            </tr>
          </table>
            <table width="560" border="1" cellpadding="1" cellspacing="0" bordercolor="#999999">
              <tr bgcolor="#666666">
                <td colspan="4" class="texto"><font color="#FFFFFF"><strong>Ingreso de Notas Masivo </strong>
				<%if request("accion") = "Volver" then
					Response.Redirect("prof_notas_parciales.asp?s_Strvolver"&"="&(n_CdAsigna)&"*"&(s_TipoAsig)&"*"&(n_NrParalelo)&"*"&(n_CdCarrer)&"*"&(s_NmPrueba)&"*"&(s_NmAsigna))	
			    End If%></font></td>
              </tr>
              <tr bgcolor="#CCCCCC" class="texto">
                <td width="27"><div align="center"><strong>N&ordm;</strong></div></td>
                <td width="86"><div align="center"><strong>Rut</strong></div></td>
                <td width="357"><div align="center"><strong>Nombre</strong></div></td>
                <td width="72"><div align="center"><strong>Valor Nota </strong></div></td>
              </tr>
			  <%set ALUMNOS= NOTAS.nextNode
				while not (ALUMNOS is nothing)%>
              <tr class="texto">
                <td><div align="center">
                  <%response.write (n_NrContador&".- ")%>
                </div></td>
                <td><div align="left"><%= valor(ALUMNOS,"s_NrRutAluDv")%></div></td>
                <td><div align="center">
                  <div align="left"><%= valor(ALUMNOS,"s_NmAlumno") %><span class="Estilo21">&nbsp;<%="("&valor(ALUMNOS,"s_NmCarreraAlu")&")"%></span></div>
                </div></td>
                <td><div align="center">
                  <%
								s_VlNota = valor(ALUMNOS,"s_VlNota")
								id_campo_nota = "n_VlNota" & valor(ALUMNOS,"s_NrRutAlu")
								id_campo_nota1 = "n_VlNota" & n_NrContador																
								if request("accion") = "Guardar" then
									if request(id_campo_nota) <> "" then
										if request(id_campo_nota) <> request(id_campo_nota1) then
											n_NrRutAlu = CDbl(valor(ALUMNOS,"s_NrRutAlu"))
											n_CdCarrerAlu = CInt(valor(ALUMNOS,"s_CdCarrerAlu"))
											s_NrMalla = valor(ALUMNOS,"s_NrMalla")
											n_VlNota = request(id_campo_nota)
											s_VlNota = CStr(n_VlNota)
											If n_NrError = 2 or n_NrError = 0 or n_NrError = 4 or n_NrError = 1 Then
												Call o.Ingresa_Notas_Parciales_Profesor(n_NrAnoActivo, n_NrPerActivo, n_NrRutAlu, n_CdCarrerAlu, n_CdAsigna, n_NrParalelo, s_TipoAsig, n_NrPrueba, s_vlNota, s_NrMalla, n_NrRutProfe, d_FechaRegistro, n_NrError )
											End If 
											If n_NrError = 3 or n_NrError = 5 then 
												set ALUMNOS= nothing
											End If
										End If
									end if									
								end if								
							%>
                  <%=Response.Write("("&n_NrContador&")")%>
                  <input name="<%= id_campo_nota %>" type="text" id="<%=id_campo_nota %>" value="<%= s_vlNota %>" size="3" maxlength="3">
                  <input name="<%= id_campo_nota1 %>" type="hidden" id="<%= id_campo_nota1 %>"value="<%= s_vlNota %>">
                  </div></td>
              </tr>
			  <% set ALUMNOS= NOTAS.nextnode
				 n_NrContador = n_NrContador + 1 %>
                <% wend %>
            </table><input name="accion" type="submit" <%If n_Permite_Registro <> 10 Then%>disabled <%End If%> class="Submit" id="accion" value="Guardar">
            <%If request("accion") = "Guardar" then								   		
										If n_NrError = 3 Then
											s_NmError = "ERROR: Fecha de registro fuera de plazo, consulte con su Jefe de Carrera."
										End If
										If n_NrError = 4 Then
			  								 's_NmError = "ERROR: Debe registrar como separador coma (ej:4,5) o (45)."
											 s_NmError = "ERROR: Si ingresa valores enteros, deben ser entre 10 y 70 (ej:58)"
										End If
										If n_NrError = 5 Then
				 							 s_NmError = "ERROR: Prueba no posee fecha de registro, consulte con su Jefe de Carrera."
										End If
										If n_NrError = 2 or n_NrError = 1 Then		  
				    						 s_NmError = "Las notas se actualizaron en forma correcta"
										End If
										Response.Redirect("prof_np_ingreso_masivo.asp?s_StringAsig"&"="&n_CdAsigna&"*"&s_NmAsigna&"*"&s_TipoAsig&"*"&n_NrParalelo&"*"&n_CdCarrer&"*"&n_NrPrueba&"*"&s_NmPrueba&"*"&d_FcPrueba&"*"&s_NmError)
								    End If%></td>
        </tr>
        <tr>
          <td valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td valign="top"><hr size="1" noshade></td>
        </tr>
		</form>
      </table></td>
    <td width="190" valign="top"></td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#990000"> </td>
    <td height="20" colspan="2" valign="top" bgcolor="#990000" class="fondo4">&nbsp;</td>
  </tr>
</table>
<%set o = nothing
  set xml = nothing
  set NOTAS = nothing
  set ALUMNOS = nothing%>
</body>
</html>
