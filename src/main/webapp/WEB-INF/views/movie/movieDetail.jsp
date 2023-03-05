<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp">
<jsp:param value="영화 등록" name="title"/>
</jsp:include>
<style>
div#movie-container{width:400px; margin:0 auto; text-align:center;}
div#movie-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#movie-container label.custom-file-label{text-align:left;}	

</style>

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



<%-- <div class="flex container mx-auto pt-2">
  <div class="adm-side-bar">
    <aside class="w-44 flex flex-col rounded-xl bg-gray-600 text-gray-100">
      <div class="h-12 flex justify-center items-center p-4 text-lg font-bold border-b box-border">
        <span>관리자 메뉴</span>
      </div>
      <div class="font-bold flex justify-center">
        <ul class="flex flex-col">
          <li class="p-2">
             <a href="${pageContext.request.contextPath}/member/members.do">
              회원 관리
            </a>
          </li>
          <li class="p-2">
            <a href="${pageContext.request.contextPath}/movie/movieList.do">
              영화 관리
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              매출 관리
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              예매율 관리
            </a>
          </li>
        </ul>
      </div>
    </aside>
  </div>
</div> --%>

<div id="movie-container">
	<form:form 
		name="movieUpdateFrm" 
		action="${pageContext.request.contextPath}/movie/updateMovie.do"
		method="post">
		<input type="text" class="form-control" placeholder="제목" name="title" id="title" value="${movie.title}"required>
		<input type="text" class="form-control" placeholder="출연진" name="actors" id="actors" value="${movie.actors}" required>
		<input type="text" class="form-control" placeholder="감독" name="director" id="director" value="${movie.director}" required>
		<input type="text" class="form-control" placeholder="시놉시스" name="synopsis" id="synopsis" value="${movie.synopsis}" required>
		<!-- <input type="text" class="form-control" placeholder="연령 제한" name="title" id="title" required> -->
		<div>
			<select name="limit_age">
			    <option value="0">전체이용가</option>
			    <option value="12">12세이용가</option>
			    <option value="15">15세이용가</option>
			    <option value="19">청소년관람불가</option>
		  	</select>
		</div>
 		<div class="form-group row">
  		<div class="col-sm-10">
		    <select class="form-select" name="genre">
		      <option value="ACTION" selected>액션</option>
		      <option value="COMEDY" selected>코미디</option>
		      <option value="ROMANCE" selected>로맨스</option>
		      <option value="ANIMATION">애니</option>
		      <option value="HORROR">호러</option>
		      <option value="FANTASY">판타지</option>		      
		      <option value="DOCUMENTARY">다큐</option>
		      <option value="DRAMA">드라마</option>
		    </select>
  		</div>
	</div>
		<!-- <div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div> -->
		 
		
		<br />
		
		<input type="submit" class="btn btn-outline-success" value="수정">
		<!-- <button type="submit" class="btn btn-danger" onclick="deleteMovie()" >삭제</button> -->
<!-- 		<input type="submit" class="btn btn-danger" onclick="insertMovie();" value="삭제"/> -->
 	</form:form> 
</div> 
<!-- <script>
document.querySelectorAll("[name=upFile]").forEach((input) => {
	input.addEventListener('change', (e) => {
		const file = e.target.files[0];
		const label = e.target.nextElementSibling;
		
		if(file)
			label.innerHTML = file.name;
		else 
			label.innerHTML = '파일을 선택하세요';
	});
});


 function updateMovie() {
  // 수정 버튼이 클릭되었을 때 실행될 코드 작성
  location.href = "${ pageContext.request.contextPath }/movie/updateMovie.do";
}


</script> -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 --%>