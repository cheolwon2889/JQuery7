<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var baseUrl = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp";
	var params = {
			collection : 'kmdb_new2',
			detail: 'N',
			director:'봉준호',
			listCount : 18,
			ServiceKey: '발급 받은 서비스키'
	}
	// jQuery의 $.param() 메서드를 사용하여 쿼리 스트링 생성
	var fullUrl = baseUrl + '?' + $.param(params);
	console.log('최종 URL:', fullUrl); // 최종 URL 출력
	alert(fullUrl);
	$.ajax({
		url : baseUrl,
		data : params,
		method : "GET",
		success : function(data) {
			alert("갔다옴");
			console.log(data);
			
			
		}
	});
	
});
</script>
</head>
<body>

</body>
</html>