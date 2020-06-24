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

<script src="<c:url value='/resources/js/common.js' />"></script>
<script>
	function list() {
		location.href = "list.do";
		//history.back();
	}
	function save() {
		if ($('#user_id').val() == '') {
			alert("아이디를 입력하세요.");
			$('#user_id').focus();
			return;
		}
		if ($('#password').val() == '') {
			alert("비밀번호를 입력하세요.");
			$('#password').focus();
			return;
		}
		if ($('#password_cf').val() == '') {
			alert("비밀번호 확인을 입력하세요.");
			$('#password_cf').focus();
			return;
		}
		if ($('#user_name').val() == '') {
			alert("이름을 입력하세요.");
			$('#user_name').focus();
			return;
		}
		if ($('#email').val() == '') {
			alert("이메일을 입력하세요.");
			$('#email').focus();
			return;
		}
		if ($('#gender').val() == '') {
			alert("성별을 선택하세요.");
			$('#gender').focus();
			return;
		}
		if ($('#city').val() == '') {
			alert("거주지를 선택하세요.");
			$('#city').focus();
			return;
		}
		if ($('#password').val() != $('#password_cf').val()) {
			alert("비빌번호와 비빌번호 확인은 같아야합니다.");
			$('#password_cf').focus();
			return;
		}

		if (!confirm("수정하시겠습니까?")) {
			return;
		}

		document.signform.action = "modify.do";
		document.signform.submit();
	}
</script>
</head>
<body>

	<div class="container">
		<h2 class="text-left">사용자수정</h2>
		<div class="panel panel-default">
			<div class="panel-heading text-left">
				<%@ include file="../include/login.jsp" %>
			</div>
			<div class="panel-body">
				<form id="signform" name="signform" class="form-horizontal" method="post">
					<input type="hidden" name="user_id" value="${map.user.user_id}" />
					<div class="form-group">
						<label class="control-label col-sm-2" value="${map.user.user_id}">비밀번호:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" style="width: 180px;" id="password" name="password" value="${map.user.password}" placeholder="비밀번호를 입력하세요." maxlength="20">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">비밀번호확인:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" style="width: 180px;" id="password_cf" name="password_cf" value="${map.user.password}" placeholder="비밀번호를 입력하세요." maxlength="20">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">이름:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" style="width: 180px;" id="user_name" name="user_name" value="${map.user.user_name}" placeholder="이름을 입력하세요." maxlength="100">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">이메일:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" style="width: 240px;" id="email" name="email" value="${map.user.email}" placeholder="이메일을 입력하세요." maxlength="120">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">성별:</label>
						<div class="col-sm-10">
							<c:forEach var="genderName" items="${map.genderList}">
								<c:choose>
									<c:when test="${genderName eq map.user.gender}">
										<label class="radio-inline"><input type="radio" name="gender" value="${genderName}" checked="checked">${genderName}</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"><input type="radio" name="gender" value="${genderName}">${genderName}</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">거주지:</label>
						<div class="col-sm-10">
							<select class="form-control" style="width: 80px;" name="city">
								<c:forEach var="cityName" items="${map.cityList}">
									<c:choose>
										<c:when test="${cityName eq map.user.city}">
											<option value="${cityName}" selected>${cityName}</option>
										</c:when>
										<c:otherwise>
											<option value="${cityName}">${cityName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer text-right">
				<div class="btn-group">
					<button type="submit" class="btn btn-primary" id="btnSave" onclick="save();">수정</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnList" onclick="javascript:history.back();">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
