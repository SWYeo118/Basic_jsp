<meta charset="UTF-8">
<%@ page contentType="text/html; charset=utf-8" %>

<!-- 오류가 발생했을때 보여지는 페이지이다 -->
<%@ page isErrorPage="true" %>

<html> <!-- html 언어로 작성 시작 -->
	<head> <!-- heading의 준말로 머리말에 해당 -->
	</head> <!-- 헤드 종료 -->
	<body>  <!-- 본문에 해당 시작 -->
		<script>
			alert("오류가 발생했습니다.");
			window.history.go(-1);
		</script>
	</body> <!-- 본문 종료 -->
</html> <!-- html 종료 -->
