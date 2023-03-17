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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieDetail.css"/>


<div id="movie-container">
		<form:form 
		name="movieUpdateFrm" 
		action="${pageContext.request.contextPath}/movie/updateMovie.do"
		method="post">
		
		<input type="hidden" name="no" value="${movie.no}">
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
		<br />
 
		<input type="hidden" name="no" value="${movie.no}">
		<input type="submit" class="btn btn-outline-success" value="수정">
	</form:form>
		
	<form:form 
			name="movieDeleteFrm" 
			action="${pageContext.request.contextPath}/movie/deleteMovie.do"
			method="post"
			style="display: inline-block;">
		<input type="hidden" name="no" value="${movie.no}">
		<input type="submit" class="btn btn-outline-success" value="삭제">
	</form:form>
</div> 
</body>
</html>