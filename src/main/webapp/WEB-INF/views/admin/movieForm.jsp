<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영화 등록" name="title"/>
</jsp:include>
<style>
div#board-container{width:400px; margin:0 auto; text-align:center;}
div#board-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}
</style>

<div id="board-container">
	<form name="movieFrm" action="${pageContext.request.contextPath}/movie/movieEnroll.do" method="post" enctype="multipart/form-data">
		<input type="text" class="form-control" placeholder="제목" name="title" id="title" required>
		<input type="text" class="form-control" name="memberId" value="${loginMember.memberId}" readonly required>
		<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">장르</label>
			<div class="col-sm-10">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="ACTION" value="ACTION" checked>
				  <label class="form-check-label" for="ACTION">액션</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="COMEDY" value="COMEDY" checked>
				  <label class="form-check-label" for="COMEDY">코미디</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="ROMANCE" value="ROMANCE" checked>
				  <label class="form-check-label" for="ROMANCE">로맨스</label>
				</div>	
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="ANIMATION" value="ANIMATION">
				  <label class="form-check-label" for="ANIMATION">애니메이션</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="HORROR" value="HORROR">
				  <label class="form-check-label" for="HORROR">호러</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="FANTASY" value="FANTASY">
				  <label class="form-check-label" for="FANTASY">판타지</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="DOCUMENTARY" value="DOCUMENTARY">
				  <label class="form-check-label" for="DOCUMENTARY">다큐멘터리</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="genre" id="DRAMA" value="DRAMA">
				  <label class="form-check-label" for="DRAMA">드라마</label>
				</div>
			</div>
		</div>
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div>
		
		
	    <textarea class="form-control" name="content" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="등록" >
	</form>
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
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 --%>