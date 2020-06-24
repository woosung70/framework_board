<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사용자</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
#rcorners1 {
	border-radius: 25px;
	background: #73AD21;
	padding: 20px;
	width: 200px;
	height: 150px;
}

#rcorners2 {
	border-radius: 25px;
	border: 2px solid #73AD21;
	padding: 20px;
	width: 200px;
	height: 150px;
}

#rcorners3 {
	border-radius: 25px;
	background: url(paper.gif);
	background-position: left top;
	background-repeat: repeat;
	padding: 20px;
	width: 200px;
	height: 150px;
}

.rcorners5 {
	border-radius: 5px;
	border: 1px solid lightgray;
	padding: 5px;
	width: 82%;
}
</style>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script>
	function list() {
		//alert('테스트입니다.');
		location.href = "list.do";
	}
	function modify(user_id) {
		location.href = "modify.do?user_id=" + user_id;
	}
	function deleteUser(user_id) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "delete.do/"+user_id;
		}
	}
</script>
</head>
<body>

	<div class="container">
		<h2 class="text-left">사용자상세</h2>
		<div class="panel panel-default">
			<div class="panel-heading text-left">
				<%@ include file="../include/login.jsp" %>
			</div>
			<div class="panel-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="">아이디:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.user_id}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">비밀번호:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.password}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">이름:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.user_name}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">이메일:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.email}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">성별:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.gender}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">거주지:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.city}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">등록일:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.reg_date}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">수정일:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${user.mod_date}" />
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnList" onclick="list();">사용자목록</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnModify" onclick="modify('${user.user_id}');" />
					사용자수정
					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnDelete" onclick="deleteUser('${user.user_id}');" />
					사용자삭제
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
