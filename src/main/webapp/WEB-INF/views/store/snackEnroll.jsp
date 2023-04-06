<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="메뉴 등록|영화 그 이상의 감동. J3L" name="title" />
</jsp:include>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/snackEnroll.css" />


<div id="contents">
  <div class="cols-content">
    <div class="col-aside">
      <div class="snb">
        <ul class="ul1">
          <li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a></li>
          <li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
          <li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의 관리<i></i></a></li>
          <li class=''><a href="${ pageContext.request.contextPath }/schedule/insertSchedule.do">상영 관리<i></i></a></li>
          <li class='on'><a href="${ pageContext.request.contextPath }/store/snackEnroll.do">메뉴 관리<i></i></a></li>
        </ul>
      </div>
    </div>

    <form:form action="${ pageContext.request.contextPath }/store/snackEnroll.do?${_csrf.parameterName}=${_csrf.token}"
      method="POST" enctype="multipart/form-data">
      <h1>메뉴 등록</h1>
      <table class="ttbl">
        <tr>
          <td class="tit">이름</td>
          <td><input type="text" placeholder="이름" name="name" class="input_txt" maxlength="30" value="" required>
          </td>
        </tr>
        <tr>
          <td class="tit">가격</td>
          <td><input type="number" placeholder="가격" name="price" id="price" min="0" class="input_txt" value=""></td>
        </tr>
        <tr>
          <td class="tit">상영관</td>
          <td>
            <select name="cinemaName">
              <c:forEach items="${cinemaList}" var="cinema">
                <option value="${cinema.name}">${cinema.name}</option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td class="tit">카테고리</td>
          <td>
            <input type="radio" value="POPCORN" name="snackCategory" />팝콘
            <input type="radio" value="DRINK" name="snackCategory" />음료
            <input type="radio" value="COMBO" name="snackCategory" />콤보
            <input type="radio" value="PACKAGE" name="snackCategory" />패키지
            <input type="radio" value="SNACK" name="snackCategory" />스낵
          </td>
        </tr>
        <tr>
          <td class="tit">첨부파일</td>
          <td>
            <input type="file" name="upFile" id="upFile"/>
          </td>
        </tr>
        <tr>
          <td class="tit">등록</td>
          <td>
            <input type="submit" value="등록" />
          </td>
        </tr>
      </table>
    </form:form>
  </div>
</div>
</body>
</html>