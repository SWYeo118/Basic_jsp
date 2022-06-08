<!--JSP로 작성-->

<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<%!
private String call1(){	//Call1이라는 class를 선언-->
	String a = "abc";	//a라는 String을 abc로 선언-->
	String b = "efg";	//b라는 String을 efg로 선언-->
	return (a + b);		//a와 b를 리턴한다-->
}
private Integer call2(){//Call2이라는 class를 선언-->
	Integer a = 1;		//a라는 Integer을 1로 선언-->
	Integer b = 2;		//b라는 Integer을 2로 선언-->
	return (a + b);		//a + b를 리턴한다-->
}
%>
</head>
<body>
String연산 : <%=call1()%><br>		<!--class call1을 부른다-->
Integer연산 : <%=call2()%><br>	<!--class call2을 부른다-->
Good..
</body>
</html>