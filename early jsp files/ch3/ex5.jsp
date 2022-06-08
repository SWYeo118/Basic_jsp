<!--JSP 문자함수2 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
</head>
<body>
<%!
String arr[] = new String[]{"111", "222", "333"};	// arr라는 배열을 선언하고 값을 입력해주었다.
String str = "abc, efg, jif";						// str라는 문자열을 다음과 같이 선언해줌
String str_arr[] = str.split(",");					// str_arr에 split으로 값을 저장해주었다.
%>
arr[0]:<%=arr[0]%><br>								
arr[1]:<%=arr[1]%><br>
arr[2]:<%=arr[2]%><br>
str_arr[0]:<%=str_arr[0]%><br>
str_arr[1]:<%=str_arr[1]%><br>
str_arr[2]:<%=str_arr[2]%><br>
Good..
</body>
</html>