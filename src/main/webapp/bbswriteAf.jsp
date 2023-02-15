<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	// 여기가 db에 입력해주는 jsp
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BbsDao dao = BbsDao.getInstance();
	
	boolean isS = dao.writeBbs(new BbsDto(id, title, content));
	if(isS){
		%>
		<script type="text/javascript">
		alert("추가되었습니다");
		location.href = "bbslist.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("다시 작성해주세요");
		location.href = "bbswrite.jsp";
		</script>
		<%
	}
%>

