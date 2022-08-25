<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${buy }" var="d">
		<div>

			<div class="col">
				<div class="card">

					<div class="headline">餐點名稱: ${d.dish.dishName }</div>
					<div>價格: ${d.dish.dishPrice } 數量: ${d.q } 總價: ${d.dish.dishPrice*d.q} </div>
					

				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>