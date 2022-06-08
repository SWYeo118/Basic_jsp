<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*" %>

<html> <!-- html 언어로 작성 시작 -->
	<head> <!-- heading의 준말로 머리말에 해당 -->
		<style type="text/css">
			a:link { text-decoration:none; color:#000000;}
			a:visited { text-decoration:none; color:#000000;}
			a:active {text-decoration:none; color:#ff0000;}
			a:hover { text-decoration:none; color:#ff0000;}
			a { text-decoration:none } 
			table {border-spacing: 0px; padding:0px;}
			td {border-spacing: 0px; padding:0px;}
			p { margin-top:0px; margin-bottom:0px;}
			h3 { margin-top: 0px; margin-bottom: 0px; margin-left: 0; margin-right: 0; }
		</style>
		<title> 투표하기 </title>
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

			ResultSet rset2 = stmt.executeQuery("select * from hubo_jsp;");
			int kiho2 = 0;
			String name2;

			while (rset2.next()) {
				kiho2 = rset2.getInt(1); 
				name2 = rset2.getString(2); 	
			}
			rset2.close();
			
			if(kiho2 != 0 ){
				out.println("<br><table cellspacing=3 width=600 border=1><tr><form method=\"post\" action=\"B02.jsp\">	<td width=200> <p align = center><select name='choice_hubo'>");
				
				ResultSet rset = stmt.executeQuery("select * from hubo_jsp;");
				int kiho = 0;
				String name;

				while (rset.next()) {
					kiho = rset.getInt(1); 
					name = rset.getString(2); 
					out.println("<option value="+kiho+">"+kiho+" "+name);		
				}
				rset.close();		
				out.println("</select></p> </td><td width=200> <p align = center><select name='choice_age'>");
				for (int i = 10; i < 100; i=i+10) {
					out.println("<option value="+i+">"+i+" 대");
				}
				out.println("</select></p></td>");
				out.println("<td align=center><input type='submit' value='투표하기' ></td></form></tr></table>");
		   } else {
				out.println("</select></p></td></form></tr></table>");
				out.println("<h2>후보자가 없습니다.</h2>");
		   }

			stmt.close();
			conn.close();
		%>
	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->