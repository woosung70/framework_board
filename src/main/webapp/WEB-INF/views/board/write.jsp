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

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="<c:url value='/resources/js/common.js' />"></script>
<script>
	function list() {
		location.href = "list.do";
	}
	function save(login_id) {
		if (!login_id) {
			alert("로그인후 등록 가능합니다.");
			return;
		}
		if ($('#title').val() == '') {
			alert("제목을 입력하세요.");
			$('#title').focus();
			return;
		}
		if ($('#user_name').val() == '') {
			alert("작성자를 입력하세요.");
			$('#user_name').focus();
			return;
		}
		if ($('#contents').val() == '') {
			alert("내용을 입력하세요.");
			$('#contents').focus();
			return;
		}

		if (!confirm("등록하시겠습니까?")) {
			return;
		}

		document.writeform.action = "write.do";
		document.writeform.submit();
	}
</script>
</head>
<body>

	<div class="container">
		<h2 class="text-left">게시물등록</h2>
		<div class="panel panel-default">
			<div class="panel-heading text-left">
				<%@ include file="../include/login.jsp"%>
			</div>
			<div class="panel-body">
				<form id="writeform" name="writeform" class="form-horizontal" method="post">
				<input type="hidden" name="user_id" value="${sessionScope.login_id}">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." maxlength="100">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="user_name" name="user_name" value="${sessionScope.login_name}" placeholder="작성자를 입력하세요." maxlength="100">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="contents">내용:</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="5" id="summernote" name="contents" placeholder="내용을 입력하세요." maxlength="400"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="file">첨부파일:</label>
						<div class="col-sm-10">
            <div class="input-group">
                <label class="input-group-btn">
                    <span class="btn btn-primary">
                        찾아보기&hellip; <input type="file" style="display: none;" multiple>
                    </span>
                </label>
                <input type="text" class="form-control" readonly>
            </div>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer text-right">
				<div class="btn-group">
					<button type="submit" class="btn btn-primary" id="btnSave" onclick="save('${sessionScope.login_id}');">등록</button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btnList" onclick="list();">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#summernote').summernote({
			placeholder : '내용을 입력하세요.',
			height : 200,
			minHeight : 100, // set minimum height of editor
			maxHeight : 900, // set maximum height of editor
		});
		
		//파일업로드
		$(function() {

			  // We can attach the `fileselect` event to all file inputs on the page
			  $(document).on('change', ':file', function() {
			    var input = $(this),
			        numFiles = input.get(0).files ? input.get(0).files.length : 1,
			        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
			    input.trigger('fileselect', [numFiles, label]);
			  });

			  // We can watch for our custom `fileselect` event like this
			  $(document).ready( function() {
			      $(':file').on('fileselect', function(event, numFiles, label) {

			          var input = $(this).parents('.input-group').find(':text'),
			              log = numFiles > 1 ? numFiles + ' files selected' : label;

			          if( input.length ) {
			              input.val(log);
			          } else {
			              if( log ) alert(log);
			          }

			      });
			  });
			  
		});
		
	</script>

</body>
</html>