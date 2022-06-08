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
		<title>후보등록 - 삭제</title>
	</head> <!-- 헤드 종료 -->
	<body>  <!-- 본문에 해당 시작 -->
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","CJDghd9311@");
			Statement stmt = conn.createStatement();

			String kiho = request.getParameter("kiho");
			
			String sql = "delete from tupyo_jsp where kiho = " + kiho + ";";
			
			stmt.executeUpdate(sql);
			
			sql = "delete from hubo_jsp where kiho = " + kiho + ";";

			stmt.executeUpdate(sql);
			
			response.sendRedirect("./A01.jsp");
			
			stmt.close(); // statement 종료
			conn.close(); // connection 종료
		%>

	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->