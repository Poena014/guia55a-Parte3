

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <style>
            div {
                width: 900px;
                margin: auto;
                font-family: "Arial";
            }
            
            .error{
                color:red;
                font-style: italic;
                font-weight: bolder;
            }
           
            
            tr > td{
                width: 100px ;
                
            }
            tr > th{
                width: 200px;
                text-align: left;
            }
            
            .btnAceptar{
                width: 80%;
            }
            
            .btnAceptar:hover{
                background-color: gray;
                color: white;
            }
        </style>
    </head>
    <body>
        <div>
            
            <h2>Entrar a biblioteca</h2>
            <c:if test="${not empty param.msg}">
                <p class="error">Error: ${param.msg}</p>
            </c:if>
            
            <form name="login" action="validar.jsp" method="post">
                <table>
                    <tr>
                        <th> 
                            <label for="usuario">Login</label>
                        </th>
                        <td> <input name="usuario" id="usuario" type="input"></td>
                    </tr>
                    <tr>
                        <th>
                            <label for="contra">Contraseña</label>
                            
                        </th>
                        <td>
                            <input type="password" name="contra" id="contra">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input class="btnAceptar" value="Login" type="submit">
                        </td>
                    </tr>
                </table>
            </form>
            
        </div>
    </body>
</html>
