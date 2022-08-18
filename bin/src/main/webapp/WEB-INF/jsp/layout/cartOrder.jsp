<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車</title>
</head>
<body>
<h1>購物車頁面測試</h1>
<table class="table table-bordered">
						<thead>
							<tr>
								<th width="150">
									<label class="checked-label"><input type="checkbox" class="check-all"><i></i> 全选</label>
								</th>
								<th width="300">商品信息</th>
								<th width="150">单价</th>
								<th width="200">数量</th>
								<th width="200">现价</th>
								<th width="80">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr th:each="list:${carList}">
								<th scope="row">
									<label class="checked-label"><input type="checkbox"><i></i>
										<div class="img">![在这里插入图片描述]()</div>
									</label>
								</th>
								<td>
									<div class="name ep3" th:text="${list.value.shangpin.name}"></div>
									颜色分类：<div th:text="${list.value.shangpin.color}"></div>尺码：<div th:text="${list.value.shangpin.size}"></div>
								</td>
								<td th:text="${list.value.shangpin.price}">¥20.0</td>
								<td>
									<div class="cart-num__box">
										<input type="button" class="sub" value="-">
										<input type="text" class="val" value="1" maxlength="2">
										<input type="button" class="add" value="+">
									</div>
								</td>
								<td th:text="${list.value.shangpin.price}"></td>
<!-- 								//这里删除按钮可获得对应的id，具体删除就是删除对应session中的键值对就可以了。 -->
								<td><a th:onclick="caonima([[${list.value.shangpin.id}]])">删除</a></td>
							</tr>
						</tbody>
					</table>
</body>
</html>