<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
				+" case when grade = 'A' then 'VIP' when grade = 'B' then '일반' else '직원' end as grade, city"
				+" from member_tbl_02"
				+" order by custno";
				
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
	function checkDel(custno) {
		msg="삭제하시겠습니까?";
		if(confirm(msg)!=0){
			location.href="delete.jsp?d_custno="+custno;
			alert("삭제되었습니다.");
		}else{
			alert("삭제가 취소되었습니다.")
			return;
		}
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
<section class='section'>
	<h2>회원목록조회/수정</h2>
	<table class="table_line">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
<%while(rs.next()){ %>
		<tr>
			<td><a href="update.jsp?click_custno=<%= rs.getString("custno") %>">
			<!-- update.jsp에 매개변수명 click_custno를 선언, 매개변수 값으로는 회원번호를 오라클에서 읽어들인 값을 저장 -->
			<%= rs.getString("custno") %><!-- 오라클에서 읽어들인 회원번호 출력 -->
			</a> </td>
			<td><%= rs.getString("custname") %></td>
			<td><%= rs.getString("phone") %></td>
			<td><%= rs.getString("address") %></td>
			<td><%= rs.getString("joindate") %></td>
			<td><%= rs.getString("grade") %></td>
			<td><%= rs.getString("city") %></td>
			<td>
			 <input  type="button" value="수정" onclick="javascript:location.href='update.jsp?click_custno=<%= rs.getString("custno") %>'">
			 <input  type="button" value="삭제" onclick="checkDel(<%= rs.getString("custno") %>);">
			</td>
		</tr> <%} %>
	</table>
</section>
</body>
</html>