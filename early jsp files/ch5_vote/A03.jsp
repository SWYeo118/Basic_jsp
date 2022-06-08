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
		<title>후보등록 - 추가</title>
	</head> <!-- 헤드 종료 -->
	<body>  <!-- 본문에 해당 시작 -->
		<%
		   Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","CJDghd9311@");
		   Statement stmt = conn.createStatement();
		   
		   int newKiho = 1;
		   int minKiho = 1;
		   int maxKiho = 1;
		   
		   ResultSet rset = stmt.executeQuery("select max(kiho) from hubo_jsp"); // 가장 높은 기호번호 찾기
		   while (rset.next()) {
			  maxKiho = rset.getInt(1); 
		   }

		   ResultSet rset2 = stmt.executeQuery("select kiho from hubo_jsp"); // 모든 기호 조회
		   while (rset2.next()) {
			  newKiho = rset2.getInt(1);
			  if (minKiho != newKiho ) {
				 newKiho = minKiho;
				 break;
			  }
			  if(minKiho == maxKiho){
				 newKiho = maxKiho +1;
				 break;
			  }
			  minKiho++;
		   }
		   
		   //String kiho = request.getParameter("kiho");
		   String name = request.getParameter("name");
		   name = name.trim();
		   String nameHan = new String(name.getBytes("8859_1"),"utf-8");
		   
		   stmt.execute("insert into hubo_jsp (kiho, name) values(" + 
		   newKiho + ",'" + 
		   nameHan + "');" );
		   
		   response.sendRedirect("./A01.jsp");
		   
		   rset.close();
		   rset2.close();
		   stmt.close(); // statement 종료
		   conn.close(); // connection 종료
		%>

		<table cellspacing=3 width=600 border=1>
			<tr>
				<td width=100 align=center bgcolor='#FFD9FA'><a href='A01.jsp'><h3>후보등록</h3></a></td>
				<td width=100 align=center><a href='B01.jsp'><h3>투표</h3></a></td>
				<td width=100 align=center><a href='C01.jsp'><h3>개표결과</h3></a></td>
			</tr>   
		</table>
		<h1>후보등록 결과 : 후보가 추가되었습니다.</h1>
	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->