<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>Cadastro de produtos</title>
</head>
<body>
	<form method="post" action="<c:url value="/products" />">
		<div>
			<label for="title">Título</label> <input id="title" name="title"
				type="text" />
		</div>
		<div>
			<label for="description">Descrição</label>
			<textarea id="description" name="description" rows="10" cols="20">
		</textarea>
		</div>
		<div>
			<label for="pages">Número de páginas</label> <input id="pages"
				name="pages" type="text" />
		</div>
		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${bookType}">${bookType}</label> <input
					type="text" name="prices[${status.index}].value"
					id="price_${bookType}" /> <input type="hidden"
					name="prices[${status.index}].bookType" value="${bookType}" />
			</div>
		</c:forEach>

		<div>
			<input type="submit" value="Enviar">
		</div>

	</form>

</body>
</html>