<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css"/>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberList.css"/>



<div class="shadow-xl border border-gray-200 rounded-xl w-full min-h-screen ml-2 mb-4">
   <form action="${pageContext.request.contextPath}/member/searchMember" method="get" class="mb-3">
     <div class="input-group">
       <input type="hidden" name="searchType" value="id" />
       <input type="text" class="form-control" placeholder="아이디 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="id" />
       <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
     </div>
   </form>
  <table class="admMemberList w-11/12 mx-auto mt-4">
    <thead>
      <tr class="bg-gray-600 text-white grid-adm-members text-center font-bold py-2 px-1">
        <td>아이디</td>
        <td>이름</td>
        <td>나이</td>
        <td>이메일</td>
        <td>가입 날짜</td>
        <td>추방</td>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${members}" var="member">
        <tr class="grid-adm-members py-2 px-1 text-center">
          <td>${member.id}</td>
          <td>${member.name}</td>
          <td>${member.age}세</td>
          <td>${member.email}</td>
          <td>
            <fmt:parseDate value="${member.enrollDate}" pattern="yyyy-MM-dd" var="enrollDate"/>
            <fmt:formatDate value="${enrollDate}" pattern="yy/MM/dd"/>
          </td>
          <td>
            <form:form action="${pageContext.request.contextPath}/member/deleteMember.do" method="post" onsubmit="return confirm('정말 추방하시겠습니까?')">
              <input type="hidden" name="id" value="${member.id}">
              <button type="submit"><i class="fas fa-user-times"></i></button>
            </form:form>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>