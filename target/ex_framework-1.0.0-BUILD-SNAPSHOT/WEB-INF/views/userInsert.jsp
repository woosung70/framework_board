<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 등록</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">사용자 정보 등록</h2>
		<div>
			<form method="post" action="insertUser.do"  >
				<table  class="table table-bordered table table-hover">
					<tr>
						<td>아이디 :</td>
						<td><input type="text" name="userId"  /></td>
					</tr>
					<tr>
						<td>이름 :</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td>성별 :</td>
						<td><c:forEach var="genderName" items="${map.genderList}">
									<input type="radio" name="gender" value="${genderName}">${genderName}
							  </c:forEach></td>
					</tr>
					<tr>
						<td>거주지 :</td>
						<td><select name="city">
								<c:forEach var="cityName" items="${map.cityList}">
									<option value="${cityName}">${cityName}</option>
								</c:forEach>
								</select></td>
					</tr>
					<tr>
					<td colspan="2"  class="text-center">
						<input type="submit" value="등록" /></td>
					</tr>
					<tr>					
						<td colspan="2" class="text-center"><a href="getUserList.do">사용자 목록보기</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>