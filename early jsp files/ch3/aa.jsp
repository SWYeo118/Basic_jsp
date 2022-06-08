<!--JSP Class 사용-->

<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
<%!
private class AA{								//AA라는 클래스 선언
		private int Sum(int i, int j){			//i와 j를 받는 method Sum을 선언
			return i + j;						//이는 i + j를 리턴한다.
		}
}
	AA aa = new AA();								//aa라는 생성자 생성
%>
</head>
<body>
<% out.println("2+3=" + aa.Sum(2,3));%><br>		<!--println으로 AA 클래스에 값을 넣어서 출력가능하다-->
Good..
</body>
</html>