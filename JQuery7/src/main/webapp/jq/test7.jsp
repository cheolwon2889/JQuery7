<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
	
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 동기방식 : 서버의 정보와 동일 형태로 처리되는 방식
		//           => 사용자의 요청이 처리가 완료될때까지 코드실행이 멈춤(대기)
		//           => 페이지 이동하는 형태(주로 방식)
		
		// 비동기방식 (AJAX) : 서버의 정보와 다른 형태로 처리되는 방식
		//                    => 사용자의 요청이 처리 완료될때를 기다리지 않고 바로 처리
		//                    => 페이지 이동 X (한 화면에서 처리), 정보 불러오기(파일업로드/ 다운로드, 이메일전송)
		//                      화면의 전환없이 데이터를 처리
		
		// AJAX ( Asyuncronous JavaScript And XML) : 비동기 방식의 JavaScript, XML
				
		// $.ajax() : 데이터를 서버에 HTTP통신방식으로 정보 전달(비동기 방식)
		
// 		$.ajax({
// 			url : '전송 페이지(액션 페이지)',
// 			type : "전송방식(get, post)",
// 			data : "전송할 데이터 (파라메터)",
// 			dataType : "요청한 데이터 타입(html,xml,text,json)",
// 			success : function(data) { data: 전달받은 정보
// 				성공시 수행할 동작
// 			}, 
// 			error : function(data) { data : 실패정보
// 				실패시 수행할 동작
// 			},
// 			complete : function() {
// 				ajax 동작이 완료시 수행하는 동작.
// 			}
// 		});
		
		$('body').css("background", "orange");
		
		// 동기 방식으로 string1.jsp 조회
		// location.href="string1.jsp";
		
		// 비동기 방식으로 string1.jsp 조회
		$.ajax({
			url : "string1.jsp",
			type : "get",
			dataType : "html",
			success : function(data) {
				// alert(" 비동기방식으로 string1.jsp 갔다옴");
				$("body").append(data);
				// console.log(data);
			},
			error : function(error) {
				// alert(" 비동기방식 실행에 문제가 있음 " + error);
				console.log(" 비동기방식 실행에 문제가 있음 ");
				console.log(error);
			}
		});
		
		// string2.jsp 비동기방식 데이터 처리
		$.ajax({
			url : 'string2.jsp',
			type: 'get',
			// data : name = "itwill" , (x) {속성 : 값} 사용해서 객체 형태로 전달.
			data : {
					name : 'itwill',
					age : '20'
					} ,
			success : function(data){
				alert(" string2.jsp 페이지 다녀옴 ");
				// console.log(data);
				$('body').append("<hr> <h2> string2.jsp 페이지 다녀옴</h2>"	);
				$('body').append("정보 전달 + 처리된 결과 가져오기 ");
				$('body').append(data);
			}
		});
		
		
		
		// XML (eXtensible Markup Language ) : 확장 가능한 마크업 언어
		// => HTML 형태 처럼 태그를 사용해서 데이터를 저장하는 언어.
		// => 다양한 플랫폼에서 사용가능한 타입(복잡한 데이터구조 표현 가능)
		
		// xml1.jsp or xml2.xml를 비동기방식으로 데이터 처리
		$.ajax({
			url : 'xml1.jsp',
// 			type : "get",
			success : function(data){
				alert("xml1.jsp 비동기 방식으로 페이지 다녀옴.");
				$('body').append("<hr> xml 비동기 방식 처리 ");
// 				console.log(data);
// 				$('body').append(data);
				$(data).find("person").each(function(){
					var name = $(this).find("name").text();
					var gender = $(this).find('gender').text();
					var tel = $(this).find('tel').text();
// 					alert(name);
					$('body').append("<h2> 이름 : "+ name + "<br> 성별 :  " + gender+ "<br> 전화번호 : " + tel+ "</h2>")
				});
	
		
			}
		});
		
		
		// jtbc rss 서비스 정보를 비동기 방식으로 처리
		// https://fs.jtbc.co.kr/RSS/entertainment.xml
		$.ajax({
			url : 'https://fs.jtbc.co.kr/RSS/entertainment.xml',
			success : function(data) {
				$(data).find('item').each(function() {
					var title = $(this).find('title').text();
					var link = $(this).find('link').text();
					var description = $(this).find('description').text();
					var pubDate = $(this).find('pubDate').text();
					
//					$('#news').append("<h2> 제목 : "+ title + "<br> 링크 : <a href="+link + " target=\"_blank\" > " + link+ "</a> <br> 내용  : " + description+ " <br> 날짜 : " + pubDate+ "</h2>")
					// 이렇게 하면 각 Id에 계속 append라서 태그안에 다 들어가네
// 					$('#title').append("제목 : "+title);
// 					$('#link').append(" 링크 : <a href="+link + " target=\"_blank\" >  " + link+ "</a>");
// 					$('#description').append(" 내용  : "+description);
// 					$('#pubDate').append(" 날짜 : "+ pubDate);

// 					var tag = "<a href='"+link+"'>"
// 						tag += title
// 						tag += "</a>"
// 					var tag = "<a href='"+link+"'>"+ title + "</a>"
					// `` 백틱 자바스크립트 버전이 달라서 안되는듯					
// 					var tag = `<a href="${link}">${title}</a>`;
					$('#news').append(tag+"<hr>");
					
					
				});
			}
		});
		
		
		
		
	}); // 제이쿼리 끝
</script>
</head>
<body>
	
	<h1>test7.jsp</h1>
	
	<h1> 비동기 방식( AJAX )</h1>	


	<hr> 
	
	<div id="news">
		<h2 id="title"></h2>
		<h2 id="link"></h2>
		<h2 id="description"></h2>
		<h2 id="pubDate"></h2>
	</div>


</body>
</html>