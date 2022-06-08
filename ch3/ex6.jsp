<!--JSP 예외처리-->

<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
</head>
<body>
<%
String arr[] = new String[]{"111", "222", "333"}; //arr 배열에 다음과 같이 값을 입력하였다.
try{											  //자바때와 같이 try catch가 먹는다.
	out.println(arr[4]+"<br>");					  //arr 4번을 출력하려고 하면 에러가 발생(indexOutOfBound)
} catch(Exception e){							  //에러 발생하면 다음 에러라고 띄워주도록 catch에 사용
	out.println("error =>" + e + "<=<br>");
}
%>
Good..
</body>
</html>