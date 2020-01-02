<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1 0001
  Time: 下午 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
</head>
<body>
    <form action="${path}/test/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="file" ><be/>
        <input type="submit" value="上传">
    </form>


</body>
</html>
