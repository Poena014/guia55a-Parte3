<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<c:set var="pageId" value="Index" />
<c:set var="standalone" value="not" />

<%@ include file="seguridad.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>

        <c:if test="${sessionScope.nivel eq 1}">
            <script>
                function agregar()
                {
                    var isbn = document.getElementsByName('isbn')[0].value;
                    var titulo = document.getElementsByName('titulo')[0].value;
                    var autor = document.getElementsByName('autor')[0].value;
                    var editorial = document.getElementsByName('editorial')[0].value;

                    if (isbn.toString().trim().length > 0 && titulo.toString().trim().length > 0 && autor.toString().trim().length > 0 && editorial.toString().trim().length > 0) {
                        location.href = "insert.jsp?isbn=" + isbn + "&titulo=" + titulo + "&autor=" + autor + "&editorial=" + editorial;
                    } else {
                        alert("Se Encontraron Campos Vacios");
                    }


                }
            </script>
        </c:if>

        <c:if test="${sessionScope.nivel eq 2}">
            <script>
                function actualizar(id)
                {
                    location.href = "frmupdate.jsp?id=" + id
                }
                function eliminar(id, isbn, titulo, autor, editorial)
                {
                    alert("Registro con el id:" + id + " se ha eliminado");
                    location.href = "delete.jsp?isbn=" + isbn + "&titulo=" + titulo + "&autor=" + autor + "&editorial=" + editorial + "&id=" + id;
                }
            </script>
        </c:if>


        <style>
            body{
                font-family: "Arial";
                width: 80%;
                margin: auto;
            }

            table{
                width: 80%;
                border-style: solid;
                border-width: 3px;
                padding: 5px 5px 5px 5px;
            }
            
        </style>
    </head>
    <body>

        <div>
            <%@ include file="header.jsp" %>
        </div>

        <div>


            <c:if test="${sessionScope.nivel eq 1}">
                <h1>Gestionar Libros</h1>
                <form>
                    <table class="tablaForm">
                        <tr>
                            <td>ISBN:</td>
                            <td><input type="text" name='isbn'></td>
                        </tr>
                        <tr>
                            <td>Titulo</td>
                            <td><input type="text" name='titulo'></td>
                        </tr>
                        <tr>
                            <td>Autor</td>
                            <td><input type="text" name='autor'></td>
                        </tr>
                        <tr>
                            <td>Editorial</td>
                            <td><input type="text" name='editorial'></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="button" value="Agregar" class="editar" colspan="2" style="text-align: center; width: 20%;" onclick="agregar();"></td>
                        </tr>
                    </table>
                </form>
            </c:if>


            <br>
            <br>
            <h2 style="font-style: italic">Listado de  Libros</h2>
            <sql:setDataSource var="fuente1" driver="org.mariadb.jdbc.Driver"
                               url="jdbc:mariadb://localhost:3308/biblioteca"
                               user="root"  password = ""/>
            <sql:query dataSource = "${fuente1}" var = "result">
                SELECT * from libro;
            </sql:query>
            <table>
                <tr>
                    <th>ISBN</th>
                    <th>Titulo</th>
                    <th>Autor</th>
                    <th>Editorial</th>
                        <c:if test="${sessionScope.nivel eq 2}">
                            <th colspan="2">Option</th>
                        </c:if>
                </tr>

                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td>
                            <c:out value = "${row.isbn}"/>
                        </td>
                        <td><c:out value = "${row.titulo}"/></td>
                        <td><c:out value = "${row.autor}"/></td>
                        <td><c:out value = "${row.editorial}"/></td>
                        <c:if test="${sessionScope.nivel eq 2}">
                            <td><input type="button" value="Eliminar" class="eliminar" onclick="eliminar('${row.id}', '${row.isbn}', '${row.titulo}', '${row.autor}', '${row.editorial}');"></td>
                            <td><input type="button" value="Actualizar" class="editar" onclick="actualizar('${row.id}');" > </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
