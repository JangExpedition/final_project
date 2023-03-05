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
  </div> --%>
 <div class="shadow-xl border border-gray-200 rounded-xl w-full min-h-screen ml-2 mb-4">
    <table class="admMemberList w-11/12 mx-auto mt-4">
      <thead>
        <tr class="bg-gray-600 text-white grid-adm-members text-center font-bold py-2 px-1">
        <!--   <td>
            <input type="checkbox">
          </td> -->
          <td>아이디</td>
          <td>이름</td>
          <td>나이</td>
          <td>이메일</td>
          <td>가입 날짜</td>
          <td>추방</td>
        </tr>
        <c:forEach items="${members}" var="member">

        <tr class="grid-adm-members py-2 px-1 text-center">
         <td>${member.id }</td>
          <td>${member.name}</td>
          <td>${member.age}세</td>
          <td>${member.email}</td>
<%--           <td>${member.enrollDate}</td> --%>
          <td>
 			<fmt:parseDate value="${member.enrollDate}" pattern="yyyy-MM-dd" var="enrollDate"/>
			<fmt:formatDate value="${enrollDate}" pattern="yy/MM/dd"/>
		  </td>
		  <td>
            <a href="#">
              <i class="fas fa-user-times"></i>
            </a> 
          </td>
          </c:forEach>
        </tr>
      </tbody>
    </table>
  </div>
</div>