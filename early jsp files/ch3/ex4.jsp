<!--JSP 문자함수1 -->

<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<%!
String str = "abcdfeffasdsd";		//string을 다음과 같이 정의한다
int str_len = str.length();			//str_len는 string의 길이
String str_sub = str.substring(5);	//index 0~4번까지 잘라서 저장
int str_loc = str.indexOf("cd");	//cd라는 단어의 index
String strL = str.toLowerCase();	//str을 소문자로 변형
String strU = str.toUpperCase();	//str을 대문자로 변형
%>
</head>
<body>
Str : <%=str %><br>
str_len : <%=str_len %><br>
str_sub : <%=str_sub %><br>
str_loc : <%=str_loc %><br>
strL : <%=strL %><br>
strU : <%=strU %><br>
Good..
</body>
</html>

