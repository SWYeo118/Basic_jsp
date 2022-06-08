<!-- html과 jsp에서 한글 처리를 지시하는 명령, 필요한 파일 임포트(아래 3개는 반드시 입력) -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>

<html>
<head>
    <title>inputForm1</title>
</head>
<body>
    <h1> 성적입력 추가</h1>
    <form method='post' action='insertDB.jsp'>		<!-- 연결방식은 post, form에서 입력받은 내용을 insertDB.jsp로 전송, 해당 폼의 id는 inputForm1-->
    <table width = 450 cellspacing = 0 cellpadding=0 border = 0>
        <tr>
        <td width = 450 align="right"><input type = "submit" value = "입력성적 추가" form="inputForm1"></td>    <!-- inputForm1 폼에 입력한 성적을 추가하는 submit버튼 생성--> 
        </tr>
    </table>
    <table width = 450 cellspacing = "1" cellpadding="0" border = "1">
        <tr align = center>
            <td>이름</td>
            <td><input type = 'text' name = 'stuName' value=''> </td>
        </tr>
        <tr align = center>
            <td>학번</td>
            <td>자동부여</td>
        </tr>
        <tr align = center>
            <td>국어</td>
            <td><input type = 'number' name = 'kor' value=''> </td>  <!-- 성적은 input type을 number로 지정해서 숫자만 입력 -->
        </tr>
        <tr align = center>
            <td>영어</td>
            <td><input type = 'number' name = 'eng' value=''> </td>  <!-- 성적은 input type을 number로 지정해서 숫자만 입력 -->
        </tr>
        <tr align = center>
            <td>수학</td>
            <td><input type = 'number' name = 'mat' value=''> </td>  <!-- 성적은 input type을 number로 지정해서 숫자만 입력 -->
        </tr>
    </table>
    </form>
</body>
</html>