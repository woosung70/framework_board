    $(document).ready(function(){
        $('#loginform').submit(function(event){
            event.preventDefault();
            login();
        });
    });
	function login(){
		
		var login_id = $("#login_id").val();
		var login_pw = $("#login_pw").val();
		
		if(!login_id){
			alert("아이디를 입력하세요..");
			$("#login_id").focus();
		}else if(!login_pw){
			alert("비밀번호를 입력하세요.");
			$("#login_pw").focus();
		}else {
			loginCheck(login_id,login_pw);
		}
		
	}
	function loginCheck(login_id,login_pw){
		$.ajax({
			
			url : "login_check.do",
			type : 'post',
			data : { login_id : login_id, 
					login_pw : login_pw	
			},
			success:function(response){
				if(response == 1){
					document.location.reload();
				}else{
					alert("아이디 또는 비밀번호가 맞지 않습니다.");
				}
			}, error : function(xhr, status, e) {
                console.error(status + " : " + e);
            }
			
		});
	}
	function logout(){
		$.ajax({
			url : "logout.do",
			success:function(response){
				document.location.reload();
			}
		});
	}
	function writeUser() {
		location.href = "../user/write.do";
	}
	function modifyUser(login_id) {
		location.href = "../user/modify.do?user_id=" + login_id;
	}
