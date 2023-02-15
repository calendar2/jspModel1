<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int seq = Integer.parseInt(request.getParameter("seq"));

MemberDto login = (MemberDto)session.getAttribute("login");
if(login == null) {
	%>
	<script>
		alert('로그인해주세요');
		location.href = "login.jsp";
	</script>
	<%
}

BbsDao dao = BbsDao.getInstance();
dao.readcount(seq);
BbsDto bbs = dao.getBbsInfo(seq);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>상세 글보기</h1>

<div align="center">
<table border="1">
<col width="200"><col width="400">
<tr>
	<th>작성자</th>
	<td>
		<%=bbs.getId() %>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<%=bbs.getTitle() %>
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td>
		<%=bbs.getWdate() %>
	</td>
</tr>
<tr>
	<th>조회수</th>
	<td>
		<%=bbs.getReadcount() %>
	</td>
</tr>
<tr>
	<th>답글정보</th>
	<td>
		<%=bbs.getRef() %>-<%=bbs.getStep() %>-<%=bbs.getDepth() %>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="15" cols="90"><%=bbs.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<button type="button" onclick="answerBbs(<%=bbs.getSeq() %>)">답글</button>
		<button type="button" onclick="location.href='bbslist.jsp'">글목록</button>
		<%
		if(bbs.getId().equals(login.getId())) {
		%>
		<button type="button" onclick="deleteBbs(<%=bbs.getSeq() %>)">삭제</button>
		<button type="button" onclick="updateBbs(<%=bbs.getSeq() %>)">수정</button>
		<%
		}
		%>
	</td>
</tr>
</table>
</div>

<script type="text/javascript">
function answerBbs(seq) {
	location.href = "answer.jsp?seq=" + seq;
}
function updateBbs(seq) {
	location.href = "updateBbs.jsp?seq=" + seq;
}
function deleteBbs(seq) {
	location.href = "deleteBbs.jsp?seq=" + seq;	//	update del=1
}
// readcount 증가
</script>

</body>
</html>