<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1,Integer.parseInt(request.getParameter("custno")));
	
	pstmt.setString(2, request.getParameter("custno"));
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(2, request.getParameter("address"));
	pstmt.setString(2, request.getParameter("joindate"));
	pstmt.setString(2, request.getParameter("grade"));
	pstmt.setString(2, request.getParameter("city"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원등록</title>
</head>
<body>

</body>
</html>