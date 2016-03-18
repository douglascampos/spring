<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>Lista de produtos</title>
</head>
<body>

	${success}

   <table>
     <tr>
       <td>Titulo</td>
       <td>Valores</td>
     </tr>
     <c:forEach items="${products}" var="product">
       <tr>
         <td>${product.title}</td>
         <td>
           <c:forEach items="${product.prices}" 
             var="price">
             [${price.value} - ${price.bookType}]
           </c:forEach>
         </td>
         <td>
			<img alt="Imagem do livro" src="${product.summaryPath}">
         </td>
       </tr>
     </c:forEach>
   </table>

</body>
</html>