<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String name = request.getParameter("username");		//login에서 받은 파라미터를 요청해서 name으로 한다.
	String password = request.getParameter("userpasswd");	//userpasswd에서 파라미터를 받아 password로 한다.
%>
<html>
<head>
	<title>로그인</titme>
</head>
<body>
	이름 : <%= name %><br>
	비밀번호 : <%= password %><br>
</body>
</html>