<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script>
	function deleteUser(user_id) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "delete.do/"+user_id;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-left">사용자목록</h2>
		<div class="panel panel-default">
			<div class="panel-heading text-left">
				<%@ include file="../include/login.jsp" %>
			</div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th class="text-center">성별</th>
							<th class="text-center">거주지</th>
							<th class="text-center">등록일</th>
							<th class="text-center">수정일</th>
							<th class="text-center">수정</th>
							<th class="text-center">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>
									<a href="view.do?user_id=${list.user_id}">${list.user_id}</a>
								</td>
								<td>${list.user_name}</td>
								<td class="text-center">${list.gender}</td>
								<td class="text-center">${list.city}</td>
								<td class="text-center">${list.reg_date}</td>
								<td class="text-center">${list.mod_date}</td>
								<td class="text-center">
									<a href="modify.do?user_id=${list.user_id}">수정</a>
								</td>
								<td class="text-center">
									<a href="javascript:deleteUser('${list.user_id}');">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


			</div>
			<div class="panel-footer">
				<div class="btn-group">
					<input type="button" class="btn btn-primary" value="사용자등록" id="btnInsert" onclick="location.href='write.do' " />
				</div>
			</div>
		</div>
	</div>
</body>
</html>

































