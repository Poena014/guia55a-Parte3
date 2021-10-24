<%-- 
    Document   : prueba
    Created on : 10-23-2021, 06:31:42 PM
    Author     : moise
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%@ include file="fuentedatos.jsp" %>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
                SELECT * from libro;
            </sql:query>
    </body>
</html>
