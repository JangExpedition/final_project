<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


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



<div class="flex container mx-auto pt-2">
  <div class="adm-side-bar">
    <aside class="w-44 flex flex-col rounded-xl bg-gray-600 text-gray-100">
      <div class="h-12 flex justify-center items-center p-4 text-lg font-bold border-b box-border">
        <span>관리자 메뉴</span>
      </div>
      <div class="font-bold flex justify-center">
        <ul class="flex flex-col">
          <li class="p-2">
            <a href="${ pageContext.request.contextPath }">
              메인 메뉴 이동
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              회원 목록 조회
            </a>
          </li>
          <li class="p-2">
            <a href="${pageContext.request.contextPath}/admin/blackList.do"">
              블랙리스트
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              영화 등록
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              공지사항
            </a>
          </li>
        </ul>
      </div>
    </aside>
  </div>
  
  
  
 <div class="shadow-xl border border-gray-200 rounded-xl w-full min-h-screen ml-2 mb-4">

    <table class="admMemberList w-11/12 mx-auto mt-4">
    
     <br><br>
				<h1 align="center" > 블랙리스트 관리 </h1>
				
      <thead>
        <tr class="bg-gray-600 text-white grid-adm-members text-center font-bold py-2 px-1">
        <!--   <td>
            <input type="checkbox">
          </td> -->
          <td>번호</td>
          <td>아이디</td>
          <td>이름</td>
          <!-- <td>가입 일시</td>
          <td>권한 변경</td> -->
          <td>해제</td>
        </tr>
      </thead>
      <tbody class="shadow">
        <tr class="grid-adm-members py-2 px-1 text-center">
          <!-- <td>
            <input type="checkbox">
          </td> -->
          <td>1</td>
          <td>mbappe</td>
          <td>음바페</td>
          <td>
            <a href="#">
              <i class="fas fa-user-times"></i>
            </a>
          </td>
        </tr>
        <tr class="grid-adm-members py-2 px-1 text-center">
          <td>2</td>
          <td>haaland</td>
          <td>홀란드</td>
          <td>
            <a href="#">
              <i class="fa-solid fa-user-plus"></i>
            </a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>