<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${sessionScope == null || sessionScope.login_id == null || sessionScope.login_id == '' }">
		<form class="form-inline" id="loginform" name="loginform" method="POST">
			<div class="form-group">
				<label for="login_id">아이디:</label> <input type="text" class="form-control" id="login_id" name="login_id">
			</div>
			<div class="form-group">
				<label for="login_pw">비밀번호:</label> <input type="password" class="form-control" id="login_pw" name="login_pw">
			</div>
			<button type="submit" class="btn btn-default">로그인</button>
			<button type="button" class="btn btn-default" onclick="writeUser();">사용자등록</button>
		</form>
	</c:when>
	<c:otherwise>
		  ${sessionScope.login_name}(${sessionScope.login_id})님 환영합니다.
		  <button type="button" class="btn btn-default" onclick="logout();">로그아웃</button>
		  <button type="button" class="btn btn-default" onclick="modifyUser('${sessionScope.login_id}');">사용자수정</button>
	</c:otherwise>
</c:choose>
