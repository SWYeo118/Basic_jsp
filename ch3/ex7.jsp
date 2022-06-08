<!--JSP 예외처리 2-->

<%@ page errorPage="error.jsp" %>					<!--에러페이지를 여기로 연결한다-->
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
</head>
<body>
<%
String arr[] = new String[]{"111", "222", "333"}; //Arr를 이와 같이 정의한다.
	out.println(arr[4]+"<br>");					  //4번 항목은 없으므로 에러가 뜨는데 error.jsp로 연결된다.
%>
Good..
</body>
</html>