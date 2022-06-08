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
			td {border-spacing: 0px; padding:0px;}
			p { margin-top:0px; margin-bottom:0px;}
			h3 { margin-top: 0px; margin-bottom: 0px; margin-left: 0; margin-right: 0; }
		</style>
		<title>후보등록</title>
	</head> <!-- 헤드 종료 -->
	<body>  <!-- 본문에 해당 시작 -->
		<table cellspacing=3 width=600 border=1>
			<tr>
				<td width=100 align=center><a href='A01.jsp'><h3>후보등록</h3></a></td>
				<td width=100 align=center><a href='B01.jsp'><h3>투표</h3></a></td>
				<td width=100 align=center bgcolor='#FFD9FA'><a href='C01.jsp'><h3>개표결과</h3></a></td>
			</tr>   
		</table>
		
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","CJDghd9311@");
			 Statement stmt = conn.createStatement();

			int total_pyo = 0;
			int kiho_pyo = 0;
			String name;
			int percent = 0;
			int kiho;
			int kiho2 = 0;
			String age2;	

			ResultSet rset2 = stmt.executeQuery("select * from tupyo_jsp;");
			while (rset2.next()) {
				kiho2 = rset2.getInt(1); 
				age2 = rset2.getString(2); 
			}
			rset2.close();
			if(kiho2 != 0 ){
				out.println("<br><table cellspacing=3 width=600 border=1><tr><td width = 75><p align=center>이름</p> </td><td width = 500><p align=center>인기도</p> </td></tr>");
				
				ResultSet rset = stmt.executeQuery("select count(*) from tupyo_jsp;");
				while (rset.next()) {
					total_pyo = rset.getInt(1);
				}
				rset.close();
				ResultSet rset1 = stmt.executeQuery("select name, ifnull(tupyoCount,0), hubo_jsp.kiho from hubo_jsp left outer join (select kiho, count(*) as tupyoCount " +
											"from tupyo_jsp group by kiho) tupyoCount on hubo_jsp.kiho = tupyoCount.kiho;");
				while (rset1.next()) {

					name = rset1.getString(1); 
					kiho_pyo = rset1.getInt(2); 
					kiho = rset1.getInt(3); 
					percent = (int)((float)kiho_pyo/(float)total_pyo*100.0);
					out.println("<tr><td width = 75><a href='C02.jsp?nameHubo="+name+"&hubokiho="+kiho+"'><p align=center>"+ kiho + " " + name +"</p></a></td>");
					out.println("<td width = 500><p align=left><img src='bar.jpg' height =20 width = "+(350*(percent/100.0))+">   "+ kiho_pyo +"("+ percent +"%)</p></td></tr>");
				}
				out.println("</table>");
				out.println("<br><h3>총 투표수 : " + total_pyo + " 표 </h3>");
				rset1.close();
			} else {
				out.println("<h2>아직 투표를 진행하지 않았습니다.</h2>");
			}
			stmt.close();
			conn.close();
		%>
	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->