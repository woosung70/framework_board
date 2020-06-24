<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	function list(pageNum) {
		//alert('테스트입니다.');
		location.href = "list.do?pageNum="+pageNum;
	}
	function modifyBoard(pageNum, idx, login_id, user_id) {
		console.log('user_id: ' + user_id);
		console.log('login_id: ' + login_id);
		if(!login_id){
			alert('게시물 수정은 로그인후 작성자만 할 수 있습니다.');
		}else if(login_id != user_id){
			alert('게시물 수정은 작성자만 할 수 있습니다.');
		}else{
			location.href = "modify.do?pageNum="+pageNum+"&idx=" + idx;
		}
	}
	function deleteBoard(pageNum, idx, login_id, user_id) {
		if(!login_id){
			alert('게시물 삭제는 로그인후 작성자만 할 수 있습니다.');
		}else if(login_id != user_id){
			alert('게시물 삭제는 작성자만 할 수 있습니다.');
		}else{
			if (confirm("삭제하시겠습니까?")) {
				location.href = "delete.do/"+idx+"?pageNum="+pageNum;
			}
		}
	}
</script>
</head>
<body>

	<div class="container">
		<h2 class="text-left">게시물상세</h2>
		<div class="panel panel-default">
			<div class="panel-heading text-left">
				<%@ include file="../include/login.jsp" %>
			</div>
			<div class="panel-body">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="">번호:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${view.idx}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">제목:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${view.title}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">작성자:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${view.user_name}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">작성일:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${view.reg_date}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="">내용:</label>
						<div class="col-sm-10 control-label rcorners5" style="text-align: left;">
							<c:out value="${fn:replace(view.contents, crcn, br)}" escapeXml="false" />
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnList" onclick="list('${pageNum}');">게시물목록</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnModify" onclick="modifyBoard('${pageNum}','${view.idx}','${sessionScope.login_id}','${view.user_id}');">
					게시물수정
					</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnDelete" onclick="deleteBoard('${pageNum}','${view.idx}','${sessionScope.login_id}','${view.user_id}');">
					게시물삭제
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>