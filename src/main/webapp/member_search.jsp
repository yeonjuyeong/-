<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
    function checkValue2() {
        if(!document.data1.in_custno.value){
            alert("회원번호를 입력하세요.");
            document.data1.in_custno,focus();
            return false;
        }
        return true;
    }
</script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<header>
    <jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
    <jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
    <h2>회원조회</h2><br>
    <form name="data1" action="member_search_list.jsp" method="post" onsubmit="return checkValue2()">
        <table class="table_line">
            <tr>
                <th>회원 번호</th>
                <td><input type="text" name="in_custno" size="10">
                </td>
            </tr>
            <tr class="center">
                <td  colspan="2" >
                <input type="button" value="취소"  onclick = "location.href=' member_list.jsp'  ">
                <input type = "submit" value="조회" >
                </td>
            </tr>
        </table>
    </form>
</section>
</body>
</html>