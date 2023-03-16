<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieList.css"/>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css"/>


<div class="shadow-xl border border-gray-200 rounded-xl w-full min-h-screen ml-2 mb-4">
  <form:form action="${pageContext.request.contextPath}/movie/searchMovie" method="get" class="mb-3">
    <div class="input-group">
      <input type="hidden" name="searchType" value="title" />
      <input type="text" class="form-control" placeholder="영화 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="title" />
      <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
    </div>
  </form:form>
	<div class="shadow-xl border border-gray-200 rounded-xl w-full min-h-screen ml-2 mb-4">
    <table class="admMemberList w-11/12 mx-auto mt-4">
      <thead>
        <tr class="bg-gray-600 text-white grid-adm-members text-center font-bold py-2 px-1">
          <td>번호</td>
          <td>제목</td>
          <td>장르</td>
          <td>출연진</td>
          <td>감독</td>
          <td>연령</td>
        </tr>
        <c:forEach items="${movieList}" var="movie">
        

        <tr class="grid-adm-members py-2 px-1 text-center" data-no="${movie.no}">
         <td>${movie.no}</td>
          <td>${movie.title}</td>
		  <td>${movie.genre.movieName}</td>
          <td>${movie.actors}</td>
          <td>${movie.director}</td>
          <td>${movie.limitAge}세</td>
          
          </c:forEach>
         </tr>
      </tbody>
    </table>
  </div>
</div>
  
<script>
document.querySelector("#btn-add").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/movie/movieForm.do';
});

document.querySelectorAll("tr[data-no]").forEach((tr) => {
	tr.addEventListener('click', (e) => {
		const no = tr.dataset.no;
		console.log(no);
		location.href = '${pageContext.request.contextPath}/movie/movieDetail.do?no=' + no;
	});
});
</script>