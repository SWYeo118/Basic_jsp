<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
        <nav class="navbar navbar-expand navbar-dark bg-dark">
        <div class="container">
            <div class="navbar-header">
                <a href="./welcome.jsp" class="navbar-brand">Home</a>
            </div>
        </div>
    </nav>
    <!-- margin top-4 padding-5  -->
    <div class="mt-4 p-5 bg-primary text-white rounded">
        <div class="container">
            <h class="display-3">Welcome to Web shopping Mall</h>
        </div>
    </div>
    <div class="container">
        <div class="text-center">
          <h3>Welcome to Web Market!</h3>
          <!-- ctrl shift m 하면 import 가능 -->
          <%
          Date now = new Date();
          SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss a");
          %>
          현재 접속 시각: <%= format.format(now) %>
        </div>
      </div>
  
      <footer class="container">
        <p>&copy; WebMarket</p>
      </footer>
  
</body>
</html>