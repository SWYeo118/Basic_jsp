<!--JSP Class 사용-->

<%@ page contentType="text/html; charset=UTF-8" %>
<HTML>
<HEAD>
<%! 									//클래스 생성때도 !를 사용함.
    private class AA{
										//인자 2개를 받아서 더해서 반환해주는 함수.
        private int Sum(int i, int j){
            return i + j;
        }
    }
AA aa = new AA();						//AA의 객체aa 생성.
%>
</HEAD>
<BODY>
<% out.println("2+3=" + aa.Sum(2,3));
										//위에서 생성한 객체를 이용해서 함수 호출.
%><br>
Good...
</BODY>
</HTML>