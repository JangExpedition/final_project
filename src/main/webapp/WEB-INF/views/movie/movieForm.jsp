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

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css"/>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieForm.css"/>


<div id="movie-container">

	<form:form 
	name="movieFrm" 
	action="${pageContext.request.contextPath}/movie/movieEnroll.do" 
	method="post"
	enctype="multipart/form-data">
		<input type="text" class="form-control" placeholder="제목" name="title" id="title" required>
		<input type="text" class="form-control" placeholder="출연진" name="actors" id="actors" required>
		<input type="text" class="form-control" placeholder="감독" name="director" id="director" required>
		<input type="text" class="form-control" placeholder="시놉시스" name="synopsis" id="synopsis" required>
<!-- 		<input type="text" class="form-control" placeholder="러닝타임" name="runnigTime" id="runnigTime" required> -->
		<div>
		  <!-- value int 값으로 수정 -->
		  <select name="limitAge">
		    <option value="0">전체이용가</option>
		    <option value="12">12세이용가</option>
		    <option value="15">15세이용가</option>
		    <option value="18">청소년관람불가</option>
		  </select>
		  <select class="form-select" name="genre">
			      <option value="ACTION" selected>액션</option>
			      <option value="COMEDY" selected>코미디</option>
			      <option value="ROMANCE" selected>로맨스</option>
			      <option value="ANIMATION">애니</option>
			      <option value="HORROR">호러</option>
			      <option value="DOCUMENTARY">다큐</option>
			      <option value="DRAMA">드라마</option>
		  </select>
		</div>
		<br>
		<div class="input-group mb-3" style="padding:0px;">
			<div class="input-group-prepend" style="padding:0px;">
			  <span class="input-group-text">첨부파일</span>
			</div>
			<div class="custom-file">
			  <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
			  <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
			</div>
		</div> 
		<textarea class="form-control" name="content" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
	 </form:form>
</div>
<script>
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
</script>