<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkLogin() {
		var form = document.Signup;
		
		var id = form.id.value
		var name = form.name.value
		var pw = form.password.value
		var repw = form.repassword.value
	
		
		if (id === "") {
			alert("아이디 칸이 비어있습니다.");
			form.id.select();
			return;
		}
		if (name === "") {
			alert("이름 칸이 비어있습니다.");
			form.name.select();
			return;
		}
		if (pw === "") {
			alert("비밀번호 칸이 비어있습니다.");
			form.password.select();
			return;
		}
		if (repw === "") {
			alert("비밀번호 확인 칸이 비어있습니다.");
			form.repassword.select();
			return;
		}
		if (pw != repw) {
			alert("비밀번호와 확인 칸이 다릅니다.");
			form.repassword.select();
			return;
		}
		form.submit();
	}
</script>
<body style="background-color: #ededed;">
   <div class="loginbox" style=" width: 780px; height: 450px; margin: 0 auto; ">
      <h2 style="width: 100%; height: 100px; line-height: 100px; text-align: center; font-size: 30px; font-weight: normal;">회원가입</h2>
      <form action="/jspbook/SignUpServlet" name="Signup" style=" width: 100%; height: 700px; background-color: #fff;  padding: 50px; box-sizing: border-box; border-radius: 50px">
         <fieldset style="border: none;">
            <legend style="position: absolute; left: -999em; ">로그인 구역</legend>
            <label for="loginid" style=" display: block; font-size: 18px; color: #333; margin-bottom: 10px; margin-top: 25px">이름</label>
            <input type="text" id="name" name="name" placeholder="이름을 입력하시오." style="display: block; width: 100%; height: 50px; margin-bottom: 30px; border: none; background-color: #ededed; padding: 0 20px; box-sizing: border-box;">
            <label for="loginid" style=" display: block; font-size: 18px; color: #333; margin-bottom: 10px; margin-top: 25px">아이디</label>
            <input type="text" id="id" name="id" placeholder="아이디를 입력하시오." style="display: block; width: 100%; height: 50px; margin-bottom: 30px; border: none; background-color: #ededed; padding: 0 20px; box-sizing: border-box;">
            <label for="loginid" style=" display: block; font-size: 18px; color: #333; margin-bottom: 10px; margin-top: 25px">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하시오." style="display: block; width: 100%; height: 50px; margin-bottom: 30px; border: none; background-color: #ededed; padding: 0 20px; box-sizing: border-box;">
            <label for="loginpw" style="display: block; font-size: 18px; color: #333; margin-bottom: 10px;">비밀번호 확인</label>
            <input type="password" id="repassword" name="repassword" placeholder="비밀번호를 다시 한번 입력하시오." style="display: block; width: 100%; height: 50px; margin-bottom: 50px; border: none; background-color: #ededed; padding: 0 20px; box-sizing: border-box;">
            <input type="button" onclick="checkLogin()" value="회원가입"style="cursor: pointer; display: block; width: 220px; height: 50px; margin: 0 auto; border: none; border-radius: 30px; background-color: #ffd400; color: #000000; font-size: 14px; font-weight: bold;">
            
         </fieldset>
      </form>
   </div>
</body>
</html>