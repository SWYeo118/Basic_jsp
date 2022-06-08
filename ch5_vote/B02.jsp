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
		<title> 투표하기-결과 </title>
	</head> <!-- 헤드 종료 -->
	<body>  <!-- 본문에 해당 시작 -->
		<table cellspacing=3 width=600 border=1>
			<tr>
				<td width=100 align=center><a href='A01.jsp'><h3>후보등록</h3></a></td>
				<td width=100 align=center bgcolor='#FFD9FA'><a href='B01.jsp'><h3>투표</h3></a></td>
				<td width=100 align=center><a href='C01.jsp'><h3>개표결과</h3></a></td>
			</tr>      
		</table>
		
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","CJDghd9311@");
			Statement stmt = conn.createStatement();

			String cHubo = request.getParameter("choice_hubo");
			String cAge = request.getParameter("choice_age");
			
			if(cHubo!=null) {
				stmt.execute("insert into tupyo_jsp (kiho, age) values(" + 
						cHubo + ",'" + 
						cAge + "');" );
						
				out.println("  <br>  <h1> 투표를 완료하였습니다. </h1>");
			} else {
				out.println(" <h1> 선택한 후보가 없습니다. </h1>");
			}
			stmt.close(); // statement 종료
			conn.close(); // connection 종료
		%>
	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->