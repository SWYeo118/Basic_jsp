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
		<script language=javascript>
			   function checkValue() {
				 var myform = document.addData;
				 var name = document.getElementById('nameA').value;
				 
				 if((name) == "") {
					alert("이름을 입력해주세요");
					myform.action = "A01.jsp"
					
					} else {
					   myform.action = "A03.jsp"
					   myform.submit();
					}
			   }
		</script>

		
	</head> <!-- 헤드 종료 -->
	<body>  <!-- 본문에 해당 시작 -->
		<table cellspacing=3 width=600 border=1>
			<tr>
				<td width=100 align=center bgcolor='#FFD9FA'><a href='A01.jsp'><h3>후보등록</h3></a></td>
				<td width=100 align=center><a href='B01.jsp'><h3>투표</h3></a></td>
				<td width=100 align=center><a href='C01.jsp'><h3>개표결과</h3></a></td>
			</tr>   
		</table>
		<br>

		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","CJDghd9311@");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select * from hubo_jsp;");

			out.println("<table cellspacing=3 width=600 border=1>");

			int kiho;
			String name;
			
			while (rset.next()) {
				kiho = rset.getInt(1); 
				name = rset.getString(2);
				name = name.trim();
				out.println("<tr><td align=center><form method='post' action='A02.jsp'> 기호 번호 : <input type='text' name='kiho' value='"+ kiho + "' readonly>" +
					"이름 : <input type='text' name='name' value='" + name + "' readonly>" +
					"<input type='submit' value='삭제'></form></td></tr>");
			}

			rset.close();
			stmt.close();
			conn.close();
		%>
			<tr>
			  <td align=center>
				 <form method='post' name='addData' action='A03.jsp'>
					<b>기호 번호 :</b> 자동부여
					<b>이름 : </b><input type='text' name='name' id = 'nameA' minlength="1" maxlength="8"  required='required' pattern='^[가-힣a-zA-Z]*' title = '이름형식으로 입력해주세요.' value='' >
					<input type='submit' value='등록'>
				 </form>
			  </td>
			</tr>
	   </table>
	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->