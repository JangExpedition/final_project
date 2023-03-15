<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>




<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieList.css"/>



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
        	<%-- <tr data-no="${movie.no}"> --%>
         <td>${movie.no}</td>
          <td>${movie.title}</td>
		  <td>${movie.genre.movieName}</td>
          <td>${movie.actors}</td>
          <td>${movie.director}</td>
          <td>${movie.limitAge}</td>
          
          </c:forEach>
          
    <!--       <input type="button" value="영화 등록" id="btn-add" class="btn btn-outline-success"/> -->
          
          
          <%-- <div class="pagination">
		    <c:url var="prevUrl" value="/movieList.do">
		        <c:param name="cpage" value="${movieList.previousPage}" />
		    </c:url>
		    <c:if test="${not empty movieList.previousPage}">
		        <a href="${prevUrl}">&laquo;</a>
		    </c:if>

		   <c:forEach var="page" begin="1" end="${movieList.totalPages}">
		       <c:url var="pageUrl" value="/movieList.do">
		           <c:param name="cpage" value="${page}" />
		       </c:url>
		       <c:if test="${page eq movieList.pageNumber}">
		           <span class="current">${page}</span>
		       </c:if>
		       <c:if test="${page ne movieList.pageNumber}">
		           <a href="${pageUrl}">${page}</a>
		       </c:if>
		   </c:forEach>

		    <c:url var="nextUrl" value="/movieList.do">
		        <c:param name="cpage" value="${movieList.nextPage}" />
		    </c:url>
		    <c:if test="${not empty movieList.nextPage}">
		        <a href="${nextUrl}">&raquo;</a>
		    </c:if>
		  </div> --%>
         </tr>
      </tbody>
    </table>
  </div>
</div>


  
  <input type="button" value="영화 등록" id="btn-add" class="btn btn-outline-success"/>
  
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