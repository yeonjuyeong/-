<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<% 
String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate, grade, city"
        + " from member_tbl_02"
        + " where custno = "
		+ request.getParameter("click_custno");
Connection conn = DBConnect.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="styleSheet" href="css/style.css">
<script type="text/javascript">
function checkValue() {
	if(!document.data.custname.value){
		alert("회원성명이 입력되지 않았습니다.");
			data.custname.focus
	}else if(!document.data.phone.value){
		alert("전화번호가 입력되지 않았습니다.");
		data.custname.focus
	}else if(!document.data.address.value){
		alert("주소가 입력되지 않았습니다.");
		data.custname.focus
	}else if(!document.data.joindate.value){
		alert("가입일자가 입력되지 않았습니다.");
		data.custname.focus
	}else if(!document.data.grade.value){
		alert("고객등급이 입력되지 않았습니다.");
		data.custname.focus
	}else if(!document.data.city.value){
		alert("도시코드가 입력되지 않았습니다.");
		data.custname.focus
	}
	alert("회원정보가 변경되었습니다.");
	return true;
	
}
</script>
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
	<h2>홈쇼핑 회원 정보 수정</h2>
	<form name="u_data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
		 <table class="table_line">
        <tr>
            <th>회원번호(자동발생)</th>
            <td><input type="text" name="custno" value="<%=rs.getString("custno") %>" readonly></td>
        </tr>
        <tr>
            <th>회원성명)</th>
            <td><input type="text" name="custname" value="<%=rs.getString("custname") %>"></td>
        </tr>
        <tr>
            <th>회원전화</th>
            <td><input type="text" name="phone" value="<%=rs.getString("phone") %>"></td>
        </tr>
        <tr>
            <th>회원주소</th>
            <td><input type="text" name="address" value="<%=rs.getString("address") %>"></td>
        </tr>
        <tr>
            <th>가입일자</th>
            <td><input type="text" name="joindate" value="<%=rs.getString("joindate") %>"></td>
        </tr>
        <tr>
            <th>고객등급[A:VIP,B:일반,C:직원]</th>
            <td><input type="text" name="grade" value="<%=rs.getString("grade") %>"></td>
        </tr>
        <tr>
            <th>도시코드</th>
            <td><input type="text" name="city" value="<%=rs.getString("city") %>"></td>
        </tr>
        <tr class="center">
            <td colspan="2">
                <input type="submit" value="수정">
                <input type="button" value="취소" onclick="location.href='join.jsp'">
                <input  type="button" value="삭제" onclick="checkDel(<%= rs.getString("custno") %>);">
            </td>
        </tr>
    </table>
	</form>
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>