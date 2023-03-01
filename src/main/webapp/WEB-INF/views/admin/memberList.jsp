<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Dev 목록" name="title"/>
</jsp:include>
<table class="table w-75 mx-auto">
	<thead>
		<tr>
		  <th scope="col">번호</th>
		  <th scope="col">이름</th>
		  <th scope="col">경력</th>
		  <th scope="col">이메일</th>
		  <th scope="col">성별</th>
		  <th scope="col">개발가능언어</th>
		  <th scope="col">등록일시</th>
		  <th scope="col">수정</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="" var="member">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<c:forEach items="${dev.lang}" var="lang" varStatus="vs">
						${lang}${not vs.last ? "," : ""}
					</c:forEach>
				</td>
				<td>
					<fmt:parseDate value="" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
					<fmt:formatDate value="" pattern="yy/MM/dd HH:mm"/>
				</td>
				<td>
					<button class="btn btn-outline-secondary" type="button" onclick="updateMember()">수정</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
function updateMember(no){
	// GET /demo/updateDev.do 수정폼요청
	// POST /demo/updateDev.do 수정처리요청
	location.href = "${ pageContext.request.contextPath }/admin/updateMember.do?no=" + no;    
}
</script>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>