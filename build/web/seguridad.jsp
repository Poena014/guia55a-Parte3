<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:if test="${empty sessionScope.nivel}">
    <c:set var="nivel" value="-1" scope="session"/>
</c:if>
<c:if test="${sessionScope.nivel == 1 and standalone eq 'not'}">
    <c:choose>    
        <c:when test="${pageId eq 'Actualizar'}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="contexto"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:when>       
        <c:when test="${pageId eq 'Eliminar'}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="contexto"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:when>   
    </c:choose>
</c:if>
            
<c:if test="${sessionScope.nivel == 2 and standalone eq 'not'}">
    <c:choose>
        <c:when test="${pageId eq 'Insertar'}">
             <c:redirect url="error.jsp">
                <c:param name="tipo" value="contexto"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:when>    
    </c:choose>
</c:if>            
            


<c:if test="${empty standalone or standalone eq null or standalone eq 'yes'}">
    <c:redirect url="error.jsp">
        <c:param name="tipo" value="contexto"/>
        <c:param name="destino" value="index.jsp"/>
    </c:redirect>
</c:if>