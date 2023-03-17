<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예매|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<div id="movie-container">
	<form:form name="movieFrm" action="${pageContext.request.contextPath}/movie/movieEnroll.do?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
		<input type="text" placeholder="제목" name="title" id="title" required>
		<input type="text" placeholder="출연진" name="actors" id="actors" required>
		<input type="text" placeholder="감독" name="director" id="director" required>
		<input type="text" placeholder="러닝타임" name="runningTime" id="runningTime" required>
		<div>
		  <select name="limitAge">
		    <option value="0">전체이용가</option>
		    <option value="12">12세이용가</option>
		    <option value="15">15세이용가</option>
		    <option value="18">청소년관람불가</option>
		  </select>
		  <select name="genre">
		      <option value="ACTION">액션</option>
		      <option value="COMEDY">코미디</option>
		      <option value="ROMANCE">로맨스</option>
		      <option value="ANIMATION">애니</option>
		      <option value="HORROR">호러</option>
		      <option value="DOCUMENTARY">다큐</option>
		      <option value="DRAMA">드라마</option>
		  </select>
		</div>
		<br>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
			  <span class="input-group-text">첨부파일</span>
			</div>
			<div class="custom-file">
			  <input type="file" name="upFile" id="upFile" multiple>
			  <label for="upFile">파일을 선택하세요</label>
			</div>
		</div> 
		<textarea name="synopsis" placeholder="시놉시스" required></textarea>
		<br/>
		<input type="submit" value="저장" >
	 </form:form>
</div>
<script>
</script>
</body>
</html>