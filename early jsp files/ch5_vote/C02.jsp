<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*" %>
<%@ page errorPage="error.jsp"%>

<html> <!-- html 언어로 작성 시작 -->
	<head> <!-- heading의 준말로 머리말에 해당 -->
		<style type="text/css">
			a:link { text-decoration:none; color:#000000;}
			a:visited { text-decoration:none; color:#000000;}
			a:active {text-decoration:none; color:#ff0000;}
			a:hover { text-decoration:none; color:#ff0000;}
			a { text-decoration:none } 
			table {border-spacing: 0px; padding:0px; }
			td {border-spacing: 0px; padding:0px; }
			p { margin-top:0px; margin-bottom:0px;}
			h3 { margin-top: 0px; margin-bottom: 0px; margin-left: 0; margin-right: 0; }
		</style>
		<title>연령대별 분석</title>
	</head> <!-- 헤드 종료 -->
	<body>  <!-- 본문에 해당 시작 -->
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","CJDghd9311@");
			Statement stmt = conn.createStatement();
			
			String cname = request.getParameter("nameHubo");
			String cnum = request.getParameter("hubokiho");
		%>
	
	
		<table cellspacing=3 width=600 border=1>
			<tr>
				<td width=100 align=center><a href='A01.jsp'><h3>후보등록</h3></a></td>
				<td width=100 align=center><a href='B01.jsp'><h3>투표</h3></a></td>
				<td width=100 align=center bgcolor='#FFD9FA'><a href='C01.jsp'><h3>개표결과</h3></a></td>
			</tr>   
		</table>
		<h1> <%=cnum%>번 <%=cname%> 후보 득표 성향 </h1>
		<table cellspacing=3 width=600 border=1>
			<tr>
				<td width = 75><p align=center>연령대</p> </td>
				<td width = 500><p align=center>인기도</p> </td>
			</tr>
			<%
			int total_pyo = 0;
			int kiho_pyo = 0;
			int percent = 0;
			
			ResultSet rset = stmt.executeQuery("select count(*) from tupyo_jsp where kiho = "+cnum+";");
			while (rset.next()) {
				total_pyo = rset.getInt(1);
			}
			rset.close();
			for (int i = 10; i < 100; i=i+10) {
				ResultSet rset1 = stmt.executeQuery("select ifnull(count(*),0) from tupyo_jsp where age="+i+" and kiho=" + cnum + ";");
				while (rset1.next()) {
					kiho_pyo = rset1.getInt(1); 
					percent = (int)((float)kiho_pyo/(float)total_pyo*100.0);
					out.println("<tr><td width = 75><p align=center>"+ i +"대 </p></td>");
					out.println("<td width = 500><p align=left><img src='bar.jpg' height =20 width = "+(350*(percent/100.0))+">   "+ kiho_pyo +"("+ percent +"%)</p></td></tr>");
				}
				rset1.close();
			}
			
			out.println("</table>");
			out.println("<br><h3> 받은 투표수 : " + total_pyo + " 표 </h3>");
			
			stmt.close();
			conn.close();
		%>

	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->