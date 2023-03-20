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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css"/>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieDetail.css"/>


<div id="contents">
  <div class="cols-content">
		<div class="col-aside">	
 		    <div class="snb">
		        <ul class="ul1">
		            <li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의 관리<i></i></a></li>
		            <li class='on'><a href="${ pageContext.request.contextPath }/schedule/scheduleForm.do">상영 시간 관리<i></i></a></li>
		        </ul>
		    </div>
		    
		<h1>영화 정보 수정/삭제</h1>
		
	  	<table class="ttbl">
		    <colgroup>
		      <col width="20%" />
		      <col width="80%" />
		    </colgroup>
		    <tr>
		      <td><input type="hidden" name="no" ></td>
		    </tr>
		    <tr>
		      <td class="tit">영화 번호</td>
		      <td><input type="text" placeholder="제목" name="title" class="input_txt" maxlength="30" required></td>
		    </tr>
		    <tr>
		      <td class="tit"></td>
		      <td><input type="text" placeholder="출연진" name="actors" id="actors" class="input_txt" required ></td>
		    </tr>
		    <tr>
		      <td class="tit"><td>
		      <td>
		        <input type="text" placeholder="감독" name="director" class="input_txt" required />
		      </td>
		    </tr>
		    <tr>
		      <td class="tit"></td>
		      <td>
		        <input type="text" placeholder="개봉일" name="openDt" class="input_txt"  required />
		      </td>
		    </tr>
		  </table>
		  	<div class="fn1">
		      <form:form 
				name="scheduleUpdateFrm" 
				action="${pageContext.request.contextPath}/schedule/updateSchedule.do" 
				method="POST" >
		        <input type="submit" value="수정"/>
		      </form:form>
		      <form:form 
					name="scheduleDeleteFrm" 
					action="${pageContext.request.contextPath}/schedule/deleteSchedule.do"
					method="post">
					<input type="hidden" name="no" value="">
			        <input type="submit" value="삭제"/>
		      </form:form>    
		      <form:form 
					name="scheduleDeleteFrm" 
					action="${pageContext.request.contextPath}/schedule/insertSchedule.do"
					method="post">
					<input type="hidden" name="no" value="">
			        <input type="submit" value="등록"/>
		      </form:form>    
		     </div>
	   </div>
	</div>
</div>
</body>
</html>