<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>Cadastro de produtos</title>
</head>
<body>

	<%-- <spring:hasBindErrors name="product">
		<ul>
			<c:forEach items="${errors.allErrors}" var="error">
				<li>
					<spring:message code="${error.code}" text="${error.defaultMessage}"/>
				</li>
			</c:forEach>
		</ul>
	</spring:hasBindErrors> --%>

	<form:form method="post" action="${spring:mvcUrl('PC#save').build()}" commandName="product" enctype="multipart/form-data">
		<div>
			<label for="title">Título</label>
			<form:input path="title"/>
			<form:errors path="title"/>
		</div>
		<div>
			<label for="description">  </label>
			<form:textarea path="description" rows="10" cols="20"/>
			<form:errors path="description"/>
		</div>
		<div>
			<label for="pages">Número de páginas</label> 
			<form:input path="pages" />
			<form:errors path="pages"/>
		</div>
		<div>
			<label for="releaseDate">Data de lançamento</label>
			<form:input path="releaseDate" type="date" />
			<form:errors path="releaseDate" />
		</div>
		<div>
			<label for="summary">Sumario do livro</label>
			<input type="file" name="summary" />
			<form:errors path="summaryPath" />
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

	</form:form>

</body>
</html>