<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예매|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieForm.css"/>

<div id="contents">
  <div class="cols-content">
		<div class="col-aside">
		    <div class="snb">
		        <ul class="ul1">
		            <li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의 관리<i></i></a></li>
		            <li class='on'><a href="${ pageContext.request.contextPath }/schedule/cinemaList.do">상영 관리<i></i></a></li>
		        </ul>
		    </div>
	<h1>상영 시간 등록</h1>
	<br></br>
			<form:form name="scheduleFrm" action="${pageContext.request.contextPath}/schedule/insertSchedule.do" method="POST">
		  	<table class="ttbl">
			    <tr>
			      <td class="tit">영화 제목</td>
			      <td><input type="text" placeholder="제목" name="movieNo" class="input_txt" maxlength="30" required></td>
			    </tr>
			    <tr>
			      <td class="tit">상영관</td>
			      <td>
			        <input type="text" placeholder="감독" name="theaterNo" class="input_txt" required />
			      </td>
			    </tr>
			    <tr>
			      <td class="tit">상영시작일</td>
			      <td>
			        <input type="date" placeholder="상영시작일" name="startTime" class="input_txt" required />
			      </td>
			    </tr>
			    <tr>
			      <td class="tit">상영종료일</td>
			      <td>
			        <input type="date" placeholder="상영시작일" name="endTime" class="input_txt" required />
			      </td>
			    </tr>
			    <tr>
			      <td class="tit">등록</td>
			      <td>
			        <input type="submit" value="등록"/>
			      </td>
			    </tr>
			  </table>
		 	</form:form>
		  </div>
		</div>
	</div>
</body>
</html>