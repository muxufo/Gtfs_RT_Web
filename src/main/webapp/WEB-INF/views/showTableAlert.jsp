<%@ page import="com.nicolas.model.Model" %><%--
  Created by IntelliJ IDEA.
  User: David
  Date: 2017-04-05
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/resources/jsp/head.jsp" %>


    <title>Feed alert</title>
</head>
<body>
<meta http-equiv="refresh" content="30">
<script>
    setTimeout(function(){
        window.location.reload(1);
    }, 30000);
</script>
<table id="example" class="display" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th>active_period</th>
        <th>informed_entity</th>
        <th>cause</th>
        <th>effect</th>
        <th>url</th>
        <th>header_text</th>
        <th>description_text</th>
    </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < Model.getActive_period().size(); i += 1) { %>
    <tr>
        <% if (Model.getActive_period().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getActive_period().get(i)%>
        </td>
        <%} %>

        <% if (Model.getInformed_entity().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getInformed_entity().get(i)%>
        </td>
        <%} %>

        <% if (Model.getCause().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getCause().get(i)%>
        </td>
        <%} %>

        <% if (Model.getEffect().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getEffect().get(i)%>
        </td>
        <%} %>

        <% if (Model.getUrl_alert().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getUrl_alert().get(i)%>
        </td>
        <%} %>

        <% if (Model.getHeader_text().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getHeader_text().get(i)%>
        </td>
        <%} %>

        <% if (Model.getDescription_text().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getDescription_text().get(i)%>
        </td>
        <%} %>

    </tr>
        <% } %>

</table>
<%@include file="/resources/jsp/body.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/TableDataTable.js"></script>
<%--<script src="${pageContext.request.contextPath}/resources/js/Timer.js"></script>--%>
</body>
</html>
