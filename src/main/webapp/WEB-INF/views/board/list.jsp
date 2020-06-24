<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="<c:url value='/resources/js/common.js' />"></script>
<script>
	function add(login_id) {
		if (!login_id) {
			alert("로그인후 등록 가능합니다.");
			return;
		}
		//location.href = "<c:url value='/board/write.do'/>";
		location.href = "write.do";
	}
	function view(pageNum, idx) {
		location.href = "view.do?pageNum="+pageNum+"&idx=" + idx;
	}
</script>
</head>
<body>

	<div class="container">
		<h2 class="text-left">게시물목록</h2>
		<div class="panel panel-default">
			<div class="panel-heading text-left">
				<%@ include file="../include/login.jsp"%>
			</div>
			<div class="panel-body">

				<div style="padding-top: 10px;padding-bottom: 5px;">
					<form class="form-inline" method="get" action="list.do">
						<div class="form-group">
							<label for="keyword">제목(내용):</label> <input type="text" class="form-control" id="keyword" name="keyword" value="${keyword }">
						</div>
						<button type="submit" class="btn btn-default">검색</button>
					</form>
				</div>
				<div>
					<table class="table table-hover">
						<thead>
							<tr style="background-color: #f0f0f0;">
								<th class="text-center">번호</th>
								<th>제목</th>
								<th class="text-center">작성일</th>
								<th class="text-center">수정일</th>
								<th class="text-center">작성자</th>
								<th class="text-center">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td class="text-center">${list.idx}</td>
									<td><a href="javascript:view('${paging.cri.pageNum}', '${list.idx}');"> <c:out value="${list.title}" />
									</a></td>
									<td class="text-center">${list.reg_date}</td>
									<td class="text-center">${list.mod_date}</td>
									<td class="text-center">${list.user_name}(${list.user_id})</td>
									<td class="text-center">${list.cnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row text-center">
					<ul class="pagination">
						<c:if test="${ paging.prev==true && !empty keyword }">
							<li class=""><a href="list.do?pageNum=${ paging.startPage-1 }&keyword=${ keyword }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:if test="${ paging.prev==true }">
							<li class=""><a href="list.do?pageNum=${ paging.startPage-1 }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:if test="${ paging.prev==false }">
							<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:if>

						<c:forEach var="i" begin="${ paging.startPage }" end="${ paging.endPage }">
							<c:choose>
								<c:when test="${ i == paging.cri.pageNum }">
									<li class="active"><a href="#">${ i }</a></li>
								</c:when>
								<c:when test="${ !empty keyword}">
									<li><a href="list.do?pageNum=${ i }&keyword=${ keyword }">${ i }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="list.do?pageNum=${ i }">${ i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${ paging.next==true && !empty keyword }">
							<li class=""><a href="list.do?pageNum=${ paging.endPage+1 }&keyword=${ keyword }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
						<c:if test="${ paging.next==true }">
							<li class=""><a href="list.do?pageNum=${ paging.endPage+1 }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
						<c:if test="${ paging.next==false }">
							<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
						<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">${paging.cri.pageNum} / ${paging.totalPage} of ${total}</span></a></li>
					</ul>
				</div>


			</div>
			<div class="panel-footer">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnInsert" onclick="add('${sessionScope.login_id}');">게시물등록</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>