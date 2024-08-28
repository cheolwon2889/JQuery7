<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		// 특정 요소의 속성의 값을 가져오기.
		var c = $('h2').css('color');
		// alert(c);

		// 특정 요소의 속성의 값을 변경하기.
		$('h2').css('color', 'green');
		// $('h2:first').css('color' , 'yellow');
		// $('h2:last').css('color' , 'red');

		// function 속성을 사용하여 값 변경
		var colorArr = [ 'red', 'orange', 'yellow' ];
		// $('h2').css('color',colorArr[1]);
		$('h2').css('color', function(index, value) {
			// alert(index + "/" + value);
			return colorArr[index];

		});

		$('h2').css('background', 'black');

		// 한번에 다양한 속성정보를 변경
		$('h2').css({
			// "속성" : "값"
			color : 'red',
			background : 'yellow'
		});

		// 글자색(빨,주,노) + 배경색(검정)
		$('h2').css({
			color : function(index) {
				return colorArr[index];
			},
			background : 'black'
		});

		/////////////////////////////////
		// 태그 속성에 접근제어 attr();

		var imgValue = $('img').attr("src");
		alert(imgValue);
		// 접근할때는 처음 하나만 나오고.
		// 바꿀때는 전부를 바꿈.
		$('img').attr("src", "ico_naver.png")

		// img 태그에 'border' 속성의 값을 5 설정
		$('img').attr('border', 5);

		$('img').attr('border', function(idx, value) {
			// alert(idx+"/" + value); 인덱스, 설정된 속성값
			return (idx + 1) * 5;
		})

		// width, height, border 설정을 한번에 처리
		// -> 가로길이를 모드 다르게 설정.

		$('img').attr({
			width : function(idx) {
				return (idx+1) * 100+'px' ;
			},
			height : '100px',
			border : '2'

		})

	});
</script>
</head>
<body>
	<h1>test4.jsp</h1>

	<h2>head-0</h2>
	<h2>head-1</h2>
	<h2>head-2</h2>

	<h2>head-3</h2>

	<h3>head-4</h3>


	<hr>

	<img alt="" src="ico_instargram_r.png">
	<img alt="" src="ico_kakao.png">
	<img alt="" src="ico_naver.png">




</body>
</html>