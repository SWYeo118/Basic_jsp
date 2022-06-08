<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<h1>조</h1>
<%
     Class.forName("com.mysql.jdbc.Driver"); 
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "cjdghd93");
      
     Statement stmt = conn.createStatement(); 
     ResultSet rset = stmt.executeQuery("create table examtable4(name varchar(20), id int not null primary key, kor int, eng int, mat int);"); 
%>

<%

     stmt.close(); 
     conn.close(); 
%>
</table>
</body>
</html>
