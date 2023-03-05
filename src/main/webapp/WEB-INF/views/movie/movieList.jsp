<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>




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

<!-- <style>
/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}
tr[data-no] {cursor: pointer;}
</style>
<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success"/> -->

<style>
  /*글쓰기버튼*/
  input#btn-add {float: right; margin: 0 0 15px; margin-left: 5cm;}
  tr[data-no] {cursor: pointer;}
</style>
<input type="button" value="영화 등록" id="btn-add" class="btn btn-outline-success"/>

</br>
</br>
</br>

<div class="flex container mx-auto pt-2">
  <div class="adm-side-bar">
    <aside class="w-44 flex flex-col rounded-xl bg-gray-600 text-gray-100">
      <div class="h-12 flex justify-center items-center p-4 text-lg font-bold border-b box-border">
        <span>관리자 메뉴</span>
      </div>
      <div class="font-bold flex justify-center">
        <ul class="flex flex-col">
          <%-- <li class="p-2">
            <a href="${pageContext.request.contextPath}">
              메인 메뉴 이동
            </a>
          </li> --%>
          <li class="p-2">
             <a href="${pageContext.request.contextPath}/member/memberList.do">
              회원 관리
            </a>
          </li>
          <li class="p-2">
            <a href="${pageContext.request.contextPath}/movie/movieList.do">
              영화 관리
            </a>
          </li>
        </ul>
      </div>
    </aside>
  </div>
 <div class="shadow-xl border border-gray-200 rounded-xl w-full min-h-screen ml-2 mb-4">
    <table class="admMemberList w-11/12 mx-auto mt-4">
      <thead>
        <tr class="bg-gray-600 text-white grid-adm-members text-center font-bold py-2 px-1">
        <!--   <td>
            <input type="checkbox">
          </td> -->
          <td>번호</td>
          <td>제목</td>
          <td>장르</td>
          <td>출연진</td>
          <td>감독</td>
<!--           <td>시놉시스</td> -->
          <td>연령</td>
        </tr>
        <c:forEach items="${movieList}" var="movie">

        <tr class="grid-adm-members py-2 px-1 text-center">
         <td>${movie.no}</td>
          <td>${movie.title}</td>
		  <td>${movie.genre}</td>
          <td>${movie.actors}</td>
          <td>${movie.director}</td>
<%--           <td>${movie.synopsis}</td> --%>
          <td>${movie.limit_age}세</td>
          </c:forEach>
        </tr>
      </tbody>
    </table>
  </div>
  
<script>
document.querySelector("#btn-add").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/movie/movieForm.do';
});
</script>
</div>