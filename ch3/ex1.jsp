<!--기본 함수 몇 가지-->

<%@ page contentType="text/html; charset=UTF-8" %>
<!--현재 페이지의 내용이 문자/html임을 정의해주었다. 문자는 UTF-8을 사용-->
<html>
<body>
	<% String myUrl = "http://www.kopo.ac.kr"; %>  <!--myUrl이라는 String을 폴리텍 사이트로 지정-->
	<a href="<%= myUrl %>">Hello</a> World.	<!--Hello World라고 출력하는데 Hello 부분에 myUrl을 하이퍼링크함-->
</body>
</html>