<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test8</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		// 비동기방식 ajax() 사용해서 JSON 데이터 타입정보 가져옴.
		$.ajax({
			url : 'json1.jsp',
			dataType : "json",
			success : function (data){
				// alert('json1.jsp 페이지를 다녀옴.');
				// alert(data.name);
				console.log('name : ' + data.name);
				// $('body').append(data);
				$('body').append(data.name+ "<hr>");
				$('body').append(data.age+ "<hr>");
				$('body').append(data.gender+ "<hr>");
			}
		})
		//////////////////////////////////////////////////////////////
// 		$.getJSON("주소", function(){
// 			// 성공시 처리 동작
// 		});
		
		$.getJSON("json2.json", function (data){
			// alert('getJSON 사용 데이터 가져옴');
// 			$('body').append(data.name);
			$(data).each(function(k , v) {
				$('body').append(k+" : " + v + "<hr>" )
			});
		});
		
		// 비동기 방식으로 json3.json 데이터를 가져와서
		// resultDiv 공간에 정보 출력
		
		$.ajax({
			url : 'json3.json',
			dataType: "json",
			success : function(data) {
				// alert('json3.jsp 페이지를 다녀옴');
				$(data).each(function(k , value){
					console.log(k + "/" + value);
					$('#resultDiv').append("이름 : "+value.name+"<br>");
					$('#resultDiv').append("나이 : "+value.age+"<br>");
					$('#resultDiv').append("성별 : "+value.gender + "<hr>");
				});
			}
		});
		
		$.getJSON("json3.json" , function(data){
			$(data).each(function( k , v){
				// $('table').append("<tr><td>"+v.name+"</td><td>"+v.age+"</td><td>"+v.gender+"</td></tr>" );
			})
		})
		
		// 비동기방식으로 DB에 저장된 정보를 가져와서 표에 출력
		$.ajax({
			url : 'list.jsp',
			success  : function(data) {
				// alert(data);
				// $('body').append(data);
				console.log(data);
				// #dbMember 테이블에 요소 추가.
				$(data).each(function(k , v){
					$('#dbMember').append("<tr><td>"+v.id+"</td><td>"+v.pw+"</td><td>"+v.email+"</td></tr>" );
					
				})
			}
		});
		
		

	}); // 제이쿼리 끝
</script>
</head>
<body>
	<div id="resultDiv"></div>
	
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td>성별</td>
			<td>나이</td>
		</tr>
	</table>
	
	
	<table border="1" id="dbMember">
		<tr>
			<td>ID</td>
			<td>PassWord</td>
			<td>Email</td>
		</tr>
	</table>
	
	
	
</body>
</html>