<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
    // 	var baseUrl = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp";
    // 	var params = {
    // 			collection : 'kmdb_new2',
    // 			detail: 'N',
    // 			director:'봉준호',
    //          title : '안녕, 할부지',
    // 			ServiceKey: '발급 받은 서비스키'
    // 	}
    // 	// jQuery의 $.param() 메서드를 사용하여 쿼리 스트링 생성
    // 	var fullUrl = baseUrl + '?' + $.param(params);
    // 	console.log('최종 URL:', fullUrl); // 최종 URL 출력
    // 	alert(fullUrl);
    // 	$.ajax({
    // 		url : baseUrl,
    // 		data : params,
    // 		method : "GET",
    // 		success : function(data) {
    // 			alert("갔다옴");
    // 			console.log(data);

    // 		}
    // 	});
    const getMoviePoster = (movieNm) => {
      var baseUrl1 =
        "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp";
      var params1 = {
        collection: "kmdb_new2",
        detail: "Y",
        title: movieNm,
        ServiceKey: "발급받은 인증키",
      };
      // jQuery의 $.param() 메서드를 사용하여 쿼리 스트링 생성
      var fullUrl = baseUrl1 + "?" + $.param(params1);
      console.log("최종 URL:", fullUrl); // 최종 URL 출력
      // alert(fullUrl);
      $.ajax({
        url: baseUrl1,
        data: params1,
        method: "GET",
        success: function (data) {
          //alert("갔다옴");
          alert(data);
          console.log(data);
        },
      });
    };

    var baseUrl =
      "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?";
    var params = {
      key: "82ca741a2844c5c180a208137bb92bd7",
      targetDt: "20240904",
    };

    var dailyBoxOfficeList = [];

    $.ajax({
      url: baseUrl,
      data: params,
      dataType: "json",
      success: function (data) {
        /*
  					값을 push를 했는데 왜 마지막 값만 뜨는건지 몰랐는데.
  					dailyBoxOffice 객체는 주소를 참조하고 있기때문에
  					dailyBoxOfficeList에는 같은 주소를 넣어주는거임.
  					그래서 마지막에 덮어쓴 10번째 값이 나오거였음.
  				*/
        console.log(data.boxOfficeResult.dailyBoxOfficeList);
        $(data.boxOfficeResult.dailyBoxOfficeList).each(function (
          k,
          value
        ) {
          var dailyBoxOffice = {};
          dailyBoxOffice.id = value.rnum;
          dailyBoxOffice.rank = value.rank;
          dailyBoxOffice.movieNm = value.movieNm;

          dailyBoxOfficeList.push(dailyBoxOffice);

          console.log(value.rank);
          console.log(value.movieNm);
        });
      },
      complete: function () {
        console.log(dailyBoxOfficeList); // 항상 실행
        /* $(dailyBoxOfficeList).each(function (k, v) {
          console.log(dailyBoxOfficeList); // 항상 실행
          getMoviePoster(v.movieNm);
        }); */
        getMoviePoster(dailyBoxOfficeList[0].movieNm);
      },
    });
  });


	
});
</script>
</head>
<body>

</body>
</html>