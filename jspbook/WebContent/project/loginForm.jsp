<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #ededed;">
   <div class="loginbox" style=" width: 780px; height: 450px; margin: 0 auto; ">
      <h2 style="width: 100%; height: 100px; line-height: 100px; text-align: center; font-size: 30px; font-weight: normal;">로그인</h2>
      <form action="/jspbook/LoginServlet" style=" width: 100%; height: 450px; background-color: #fff;  padding: 50px; box-sizing: border-box; border-radius: 50px">
         <fieldset style="border: none;">
            <legend style="position: absolute; left: -999em; ">로그인 구역</legend>
            <label for="loginid" style=" display: block; font-size: 18px; color: #333; margin-bottom: 10px; margin-top: 25px">아이디</label>
            <input type="text" id="loginid" name="id" placeholder="아이디를 입력하시오." style="display: block; width: 100%; height: 50px; margin-bottom: 30px; border: none; background-color: #ededed; padding: 0 20px; box-sizing: border-box;">
            <label for="loginpw" style="display: block; font-size: 18px; color: #333; margin-bottom: 10px;">비밀번호</label>
            <input type="password" id="loginid" name="password" placeholder="비밀번호를 입력하시오." style="display: block; width: 100%; height: 50px; margin-bottom: 40px; border: none; background-color: #ededed; padding: 0 20px; box-sizing: border-box;">
            <button type="submit" style="cursor: pointer; display: block; width: 220px; height: 50px; margin: 0 auto; border: none; border-radius: 50px; background-color: #ffd400; color: #000000; font-size: 14px; font-weight: bold;">
            로그인</button>
            <input type="checkbox" id="remeber-check" style="margin: 0 auto; box-sizing: border-box;"/>
               <label for="remeber-check" style="">로그인 저장</label>
         </fieldset>
      </form>
   </div>
</body>
</html>