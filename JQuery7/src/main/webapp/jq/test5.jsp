<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 	alert("test5.jsp");
		// $("h2").css("background" ,'yellow');
		
		// addClass() : 특정 요소에 클래스명을 설정
		// h2태그에 각각 알맞는 클래스명을 설정
		// $("h2").addClass("high_0");
		// $("h2").addClass(function(idx) {
		//	return "high_"+idx;
		// });
		
		// var h2Value = $('h2');
		// console.log(h2Value);
		
		/*  $('h2').each(function(idx,item){
			 $('h2').addClass('high_'+idx);
			// $(this).addClass('high_'+idx);
			console.log(this)
		}); */ 
		
		// this 레퍼런스 : 나 자신을 나타내는 레퍼런스
		//					+ 특정동작(이벤트)이 실행되는 요소(객체)
		//				사용자가 페이지에 방문해서 이벤트(동작)을 처리할때 그 대상

		
		///////////////////////////////////////////////
		// 하나 이상???
	/* 	$('input').bind('click', function(){
			// alert('jquery 클릭 bind');
		});
		
		$('input').click( function() {
			alert('jquery 클릭! click')
			
			$("h2").addClass(function(idx) {
				var idx2 = Math.floor(Math.random()*5);
				console.log(idx2);
				return "high_"+idx2;
			});
			
		});
		$('input').on('click', function() {
			alert( " 클릭 이벤트 on()" );
		}) */
		
		
		// 이벤트(event) : 브라우저에서 사용자가 발생시키는 모든 동작
		
		// 마우스 이벤트
		// 클릭 이벤트
		
		/* $('img').on('click', function() {
			alert(" 클릭 이벤트 (on)");
			// 클릭 햇을때 이미지를 변경
			// -> 이미지 태그의 속성(src) 변경
			var imgSrc =  $('img').attr('src');
			
			
			// 네이버 -> 클릭 -> 카카오, 카카오 -> 클릭 -> 네입
			if(imgSrc == 'ico_kakao.png' ){				
				$('img').attr('src', 'ico_naver.png');
			}else {
				$('img').attr('src', 'ico_kakao.png');			
			}
			console.log(imgSrc);
		}) */
		
		var status = true
		$('img').on('click', function() {
			alert(" 클릭 이벤트 (on : true || false)");
			// 네이버 -> 클릭 -> 카카오, 카카오 -> 클릭 -> 네입
			if(status){				
				$('img').attr('src', 'ico_kakao.png');			
			}else {
				$('img').attr('src', 'ico_naver.png');
			}			
				status = !status;
		});
		
		
		
		/* $('img').on('mouseover', function(){
			$('img').attr('src', 'ico_kakao.png');
		});
		$('img').on('mouseout', function(){
			$('img').attr('src', 'ico_naver.png');
		}); */
		
		// $('img').mouseover().mouseout();
		// => 체이닝 기법.
		$('img').mouseover( function(){
			$('img').attr('src', 'ico_kakao.png');
		}).mouseout(function(){
			$('img').attr('src', 'ico_naver.png');
		});
		
		// h2태그
		$('h2').on('click', function(idex, value){
			// 내가 선택한 대상(요소 태그) 만 + 를 추가
			$(this).append("+");
		})
		
		// 키보드 이벤트
		$('textarea').on('keyup', function(){
			// alert(" keyup!");
			// 입력된 글자수 가져오기.
			
			// 밑의 두개는 페이지 만들때 값을 가져오는거임.
			// var contents = $('textarea').html(); => 안됨. 
			// var contents = $('textarea').text(); => 안됨. 
			var value = $('textarea').val();
			console.log(value.length);
			
			// id="txtCnt" 요소(태그)에 숫자를 변경.
			var Text = $("#txtCnt").html(200 - value.length);
			
			// 200자 이내 작성시 검정색 글씨로 카운트 숫자 표현
			// 200자 초과 작성시 빨간색 글씨로 카운트 숫자 표현
			if(value.length > 200) {
				$('textarea').css('color' , 'red');
				$('#txtCnt').css('color', 'red');
			} else {
				$('textarea').css('color' , 'black');
				$('#txtCnt').css('color' , 'black');
			}
			
		});
		
		
		// 폼태그 정보 제어
		// * 아이디, 비밀번호가 하나라도 입력 안되면 정보전송(submit) X
		// click / submit
		$('#fr').submit(function() {
			var id = $('#id').val();
			var pw = $('#pw').val();
			if(id == ""){
				alert(" 아이디를 입력하세요 !");
				$('#id').focus();
				return false;
			}
			if(id.length < 5 ) {
				alert("아이디의 길이는 최소 5자 이상입니다.");
				return false;
			}
			//https://regexr.com/
			
			var reg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/gm;
			
			var tmp = reg.test(pw); // 위 정규표현식을 만족하는지 여부(true ,false)
			
			console.log(tmp);
			
			if(pw == "") {
				alert(" 비밀번호를 입력하세요 ! ");
				document.getElementById("pw").focus();
				return false; // submit 이벤트를 수행 X 
			}
			
			return false; // submit 이벤트를 수행 X 
		});
		
		//$('#fr').on("submit");
		
		
		
		
	});
</script>
<style type="text/css">
	/* 디자인팀 작업 */
	.high_0 {
		background: yellow;
	}
	.high_1 {
		background:  red;
	}
	.high_2 {
		background:  buttonface;
	}
	.high_3 {
		background:   blue;
	}
	.high_4 {
		background:  gray;
		
	}
	
</style>
</head>
<body>
	<h1>test5.jsp</h1>

	<!-- <h2 class="high_0">head-0</h2>
	<h2 class="high_1">head-1</h2>
	<h2 class="high_2">head-2</h2>
	<h2 class="high_3">head-3</h2>
	<h2 class="high_4">head-4</h2>
	<h2>head-5</h2> -->
	
	<h2>head-0</h2>
	<h2>head-1</h2>
	<h2>head-2</h2>
	<h2>head-3</h2>
	<h2>head-4</h2>

	<hr>
	
	<input type="button" value="버튼" onclick=" alert('클릭!');">
	
	<hr>
	
	<img src="ico_naver.png">


	<hr>
	
	<h1> 글자수 200자 제한 </h1>
	
	<h2 id="txtCnt">200</h2>
	<textarea rows="10" cols="20"></textarea>
	
	
	<fieldset>
		<legend>회원가입</legend>
		<form action="result.jsp" id="fr">
			아이디 : <input type="text" name="id" id="id"> <br>
			비밀번호 : <input type="password" name="pw" id="pw"> <br>
			<input type="submit" value="회원가입" >
		</form>
	</fieldset>
	
	
	
	
</body>
</html>