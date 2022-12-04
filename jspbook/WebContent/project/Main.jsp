<%@page import="model.BoardBean"%>
<%@page import="manager.BoardManager"%>
<%@page import="java.util.List"%>
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
	<%
	request.setCharacterEncoding("UTF-8");
	model.UserBean user = (model.UserBean) session.getAttribute("user");
	if (user != null) {
		System.out.println("이름 : " + user.getUsername());
	}
	String title = request.getParameter("title");
	String author = request.getParameter("author");

	if (title == null)
		title = "";
	if (author == null)
		author = "";

	List<BoardBean> boards = BoardManager.getInstance().getBoards(title, author);
	%>
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
					<%
					if (user == null) {
					%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="loginForm.jsp">로그인 </a></li>
					<li class="nav-item"><a class="nav-link" href="signup.jsp">|
							회원가입</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/jspbook/LogOutServlet">로그아웃</a></li>
					<%
					}
					%>

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
				<%
				if (user == null) {
				%>
				<h2 style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인이
					필요한</h2>
				<h2 style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서비스입니다.</h2>
				<%
				} else {
				%>
				<h2 style="">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getUsername()%>님
				</h2>
				<%
				}
				%>
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
			<div>
				<span style="font-size: 1.5em;">전체글보기</span> <span
					style="font-size: 10pt;"> 5개의 글</span>
				<button type="button" class="btn btn-outline-dark"
					style="margin-left: 600px" onclick="location.href='write.jsp'">글쓰기</button>
				<!-- 여기에 게시글 테이블에서 몇개인지 쓰시오 -->
				<hr
					style="width: 80%; height: 5px; border: none; background-color: yellow;">
				<table width="80%">
					<thead>
						<tr class="table-group-divider">
							<th scope="col">말머리</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<th scope="row" style="color: red">공지</th>
							<td><a href='project/notice3.jsp' class="link-danger">공지3</a></td>
							<td>관리자</td>
							<td>2022-12-01 17:01:59</td>
						</tr>
						<tr>
							<th scope="row" style="color: red">공지</th>
							<td><a href='project/notice2.jsp' class="link-danger">공지2</a></td>
							<td>관리자</td>
							<td>2022-12-01 12:02:40</td>
						</tr>
						<tr>
							<th scope="row" style="color: red">공지</th>
							<td><a href='project/notice1.jsp' class="link-danger">공지1</a></td>
							<td>관리자</td>
							<td>2022-12-01 01:37:01</td>
						</tr>

						<%
						for (int k = 0; k < boards.size(); k++) {
							BoardBean board = boards.get(k);
						%>
						<tr>

							<th scope="row"><%=k%></th>
							<td><a href="board.jsp?idx=<%=board.getBoardID()%>"><%=board.getBoardTitle()%></a></td>
							<td><%=board.getUserID()%></td>
							<td><%=board.getBoardTime()%></td>
						</tr>

						<%
						}
						%>

					</tbody>
				</table>
				<hr
					style="width: 80%; height: 5px; border: none; background-color: yellow;">

				<form>
					<div class="form-group row">
						<div class="col">
							<select name="search">
								<option value="title" selected>제목</option>
								<option value="user">글쓴이</option>
							</select>
						</div>
						<div class="col">
							<input class="form-control" type="text" placeholder="검색어를 입력하세요"
								aria-label="default input example" name="search1">
						</div>
						<div class="col">
							<button type="button" class="btn btn-outline-warning"
								onclick="location.href='Main.jsp'">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>