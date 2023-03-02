<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>




<!-- 테일윈드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">

<!-- 데이지UI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/1.14.2/full.css">

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 반응형 메타태그 -->
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css"/>



<div class="flex container mx-auto pt-2">
  <div class="adm-side-bar">
    <aside class="w-44 flex flex-col rounded-xl bg-gray-600 text-gray-100">
      <div class="h-12 flex justify-center items-center p-4 text-lg font-bold border-b box-border">
        <span>관리자 메뉴</span>
      </div>
      <div class="font-bold flex justify-center">
        <ul class="flex flex-col">
          <li class="p-2">
            <a href="${pageContext.request.contextPath}">
              메인 메뉴 이동
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              회원 목록 조회
            </a>
          </li>
          <%-- <li class="p-2">
            <a href="${pageContext.request.contextPath}/admin/blackList.do">
              블랙리스트
            </a>
          </li> --%>
          <li class="p-2">
            <a href="${pageContext.request.contextPath}/admin/movieEnroll.do">
              영화 등록
            </a>
          </li>
          <%-- <li class="p-2">
            <a href="${pageContext.request.contextPath}/admin/newAccordion.do">
              FAQ 관리
            </a>
          </li> --%>
        </ul>
      </div>
    </aside>
  </div>
  
  
 <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 아이콘 -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	
   <!-- 구글 폰트 -->
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">	
	
	<!-- CSS파일-->

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/CSS/movie/managementMovie.css">

   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
	

<title>KOREA BOX</title>
</head>
<body>

<!-- 
	-->
<%-- 	<jsp:include page="../admin/managerTheme.jsp" /> --%>
	
	
	<!-- 메뉴바 밑 컨테이너 -->
<!-- <div class = "container-fluid" >
<hr>
<div class = "container">
KOREA BOX 관리자 영화 관리
</div>
<hr>
</div> -->

	<div class="container">
		<div class="row" id = "list">
			<div class="col-sm-12">
				<h2>영화 리스트</h2>
				<br>
			</div>
		</div>
		<div class="row" >
			<div class="col-sm-12">
			<div align="right">
			<button type="button" class="btn btn-secondary"  id = "movieBtn" onclick="location.href='${pageContext.request.contextPath }/movieAdmin/writeMovie'">영화 등록</button>
			</div>
			<br>
				<table class="table table-hover" id = "listTable" style = "width: 100%">
					<thead class="thead-dark">
						<tr>
							<th scope="col">등록일</th>
							<th scope="col">영화제목</th>
							<th scope="col">감독</th>
							<th scope="col">배우</th>
							<th scope="col">장르</th>
							<th scope="col">러닝타임</th>
							<th scope="col">개봉일</th>
							<th scope="col">영화등급</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<tr>
						<td>${dto.mov_regDate }</td>
						<td>${dto.mov_title }</td>
						<td>${dto.mov_director }</td>
						<td>${dto.mov_actors }</td>
						<td>${dto.mov_genre }</td>
						<td>${dto.mov_runtime }</td>
						<td>${dto.mov_openDate }</td>
						<td>${dto.mov_grade }</td>
						<td><button class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath }/movieAdmin/updateMovie?mov_num=${dto.mov_num }'">수정</button>
						<button class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath }/movieAdmin/deleteMovieOk?mov_num=${dto.mov_num }'">삭제</button></td>				
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
					</tbody>
				</table>
			</div>
		</div>

	</div>



<%-- 	<jsp:include page="../footer.jsp" /> --%>

	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

</body>

<script>
/**
 * 
 */
$(document).ready(function () {
  $('#listTable').DataTable({
     "pagingType": "simple_numbers"
  });
  $('.dataTables_length').addClass('bs-select');
});
</script>

</html>