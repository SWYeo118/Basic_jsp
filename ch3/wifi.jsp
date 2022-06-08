<%String code = request.getParameter("from");                     //from에서 값을 받아서 null값이면(주소가 wifi.jsp면)
if (code == null) {                                          //sendRedirect으로 from1&cnt10으로 보내준다.
   response.sendRedirect("wifi.jsp?from=1&cnt=10");
   } else { %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<meta charset="UTF-8" />
<style type="text/css"> 
a { text-decoration:none }                                     <!--하이퍼링크에 밑줄을 없애기 위해-->
</style> 
</head>
<body>
<h1>&nbsp★ 전국 와이파이 데이터 웹페이지</h1>

<%
    Class.forName("com.mysql.jdbc.Driver");                      //jdbc 드라이버 사용
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "CJDghd9311@");
                                                      //Mysql DB의 주소와 id와 비밀번호
    Statement stmt = conn.createStatement();
   int from = 0;                                          //from값을 초기값 선언
   from = Integer.parseInt(request.getParameter("from"));            //getParameter로 쿼리스트링의 from값을 받아온다
   int cnt = Integer.parseInt(request.getParameter("cnt"));         //getParameter로 쿼리스트링의 cnt값을 받아온다
   ResultSet rset = stmt.executeQuery("CALL print_report("+ (from - 1) +",10);");  // Call print_report 쿼리를 수행하도록 resultset 작성
%>                                                      <!--from은 페이지를 보여주도록 db의 procedure를 설계함. db에서 0페이지가-->
<table cellspacing=1 width=1000 height=200 align=center border = 1>      <!--웹페이지에서 1페이지이므로 (from-1)을 사용하고, 10개씩 보여주기 위해 cnt는 10-->
<%                                                      //표는 width 1000, height 200으로 설정
   out.println("<tr>");                                    //번호,주소,위도,경도,거리를 나타내는 목차 테이블
   out.println("<td width=10><p align=center>"+"번호"+"</p></td>");
   out.println("<td width=300><p align=center>"+"주소"+"</p></td>");
   out.println("<td width=30><p align=center>"+"위도"+"</p></td>");
   out.println("<td width=30><p align=center>"+"경도"+"</p></td>");
   out.println("<td width=30><p align=center>"+"거리"+"</p></td>");
   out.println("<tr>");

     while (rset.next()) {                                     //db에서 각 index값을 받아와서 println한다.
         out.println("<tr>");
       out.println("<td width=10><p align=center>"+Integer.toString(rset.getInt(1))+"</p></td>");
       out.println("<td width=300><p align=center>"+rset.getString(2)+"</p></td>");
       out.println("<td width=30><p align=center>"+Float.toString(rset.getFloat(3))+"</p></td>");
       out.println("<td width=30><p align=center>"+Float.toString(rset.getFloat(4))+"</p></td>");
       out.println("<td width=30><p align=center>"+Float.toString(rset.getFloat(5))+"</p></td>");
       out.println("<tr>");
   }
   out.println("</table>");
   out.println("<br><br><br>");
   out.println("<div style=" + "text-align:center" + ">");            //테이블 중간정렬
   if(from < 12){
   out.println("<a href=wifi.jsp?from=1&cnt=10><FONT SIZE=6> << </FONT></a>");   //1~11페이지 상황에서는 <<버튼을 누르면 첫 페이지가 뜨도록
   } else {                                                   //그렇지 않은 상황에서는 <<버튼을 누르면 10페이지씩 줄어들도록
   out.println("<a href=wifi.jsp?from=" + (from - 10) + "&cnt=10><FONT SIZE=6> << </FONT></a>");   
   }
   if(from < 5){                                                //현재페이지가 중간에 뜨고 양쪽에 5개씩 페이지를 띄울 것이므로
      for(int i = 1; i < 11; i++){                                 //5페이지 미만 상황에서는 무조건 1 ~ 10페이지를 띄운다
      out.println("<a href=wifi.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6>"+(i)+"</FONT></a>");   
      }
   } else if( from > 268){                                          //또한 마지막 페이지가 273페이지이므로 268페이지 이후로부턴 264~273페이지가 뜨도록
      for(int i =264; i < 274; i++){
      out.println("<a href=wifi.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6>"+(i)+"</FONT></a>");
      } 
   } else if( from == 5 ){                                          //else설정 하면 5페이지에서는 0페이지가 노출되니까 이를 막기 위해
      for(int i = from - 4; i < from + 6; i++){
      out.println("<a href=wifi.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6;>"+(i)+"</FONT></a>");   
      }
   } else {
      for(int i = from - 5; i < from + 5; i++){                        //그렇지 않은 상황에서는 왼쪽에 5개, 현재페이지, 오른쪽 4페이지가 뜨도록 한다.
         out.println("<a href=wifi.jsp?from=" + (i) + "&cnt=10><FONT SIZE=6;>"+(i)+"</FONT></a>");   
      }
   }
   if(from > 262){
   out.println("<a href=wifi.jsp?from=273&cnt=10><FONT SIZE=6> >> </FONT></a>");//262페이지가 넘어가면 >>를 눌렀을 때 마지막 페이지까지 뜨도록
   } else {
   out.println("<a href=wifi.jsp?from=" + (from + 10) + "&cnt=10><FONT SIZE=6> >> </FONT></a>"); //그렇지 않은 일반상황에서는 >> 누르면 10페이지 증가하도록
   }
   out.println("<br>");
   out.println("현재페이지" + "<h1>" + from + "</h1>");                     //현재페이지가 몇페이지인지 알려주도록 적어준다.
   out.println("</div>");
   rset.close(); 
    stmt.close(); 
    conn.close();

%>
</body>
</html>
<% } %>