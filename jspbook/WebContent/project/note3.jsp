<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel"stylesheet" href="resources/register/css" type="text/css"></link>
</head>
<script>
   
</script>
<body>
   <nav class="navbar navbar-expand-lg bg-light">
      <div class="container-fluid" style="padding: 0.4erm">
         <a class="navbar-brand" href="#">Cafe</a>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="#">로그인 </a></li>
               <li class="nav-item"><a class="nav-link" href="#">| 회원가입</a></li>

            </ul>
         </div>
      </div>
   </nav>
   <img src="./asset/banner.png" alt="banner"
      style="width: 100%; text-align: center;">
   <hr
      style="width: 100%; height: 10px; border: none; background-color: white;">
   <div style="display: flex">

      <div style="width: 30%;">
         <div>
            <center>
               <hr
                  style="width: 80%; height: 5px; border: none; background-color: yellow;">
            </center>
            <hr
               style="width: 100%; height: 10px; border: none; background-color: white;">
            <hr
               style="width: 100%; height: 10px; border: none; background-color: white;">
            <!-- <%
            //if (id.login()) {
            %>
            <h2 style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인이
               필요한</h2>
            <h2 style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스입니다.</h2>
            <%
            //}
            //else  {
            %>
            <h2 style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(아이디)님</h2>
            <%
            //}
            %> -->
            <h2 style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인이
               필요한</h2>
            <h2 style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스입니다.</h2>
            <hr
               style="width: 100%; height: 10px; border: none; background-color: white;">
            <hr
               style="width: 100%; height: 10px; border: none; background-color: white;">
            <center>
               <hr
                  style="width: 80%; height: 5px; border: none; background-color: yellow;">
            </center>
         </div>
      </div>
      <div style="width: 70%;">
         <span style="font-size: 1.5em;">공지사항</span>
         <button type="button" class="btn btn-outline-dark"
            style="margin-left: 650px" onclick="location.href='Main.jsp'">목록</button>
         <hr
            style="width: 100%; height: 10px; border: none; background-color: white;">
            <hr
                  style="width: 80%; height: 5px; border: none; background-color: yellow;">
         <div style="width: 80%">
            <div class="form-floating">
               <div style="border: 1px dotted; border-radius:5px; padding: 10px; height:100px; font-size:25px">공지사항2</div>
            </div>
            <div class="form-floating">
               <div style="border: 1px dotted; border-radius:5px; padding: 10px; height:500px;">공지사항2</div>



            </div>
         </div>
      </div>
   </div>

</body>
</html>