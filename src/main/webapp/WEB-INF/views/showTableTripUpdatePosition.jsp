<%@ page import="com.nicolas.model.Model" %><%--
  Created by IntelliJ IDEA.
  User: David
  Date: 2017-04-05
  Time: 08:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/resources/jsp/head.jsp" %>
    <%@include file="/resources/jsp/body.jsp" %>
    <%--<script src="webjars/datatables/1.10.13/js/jquery.dataTables.js"></script>--%>
    <title>Trip update feed</title>
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
        <th>Trip</th>
        <th>Vehicle</th>
        <th>stop_time_update</th>
        <th>timestamp</th>
        <th>delay</th>

    </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < Model.getTripUpdate().size(); i += 1) { %>
    <tr>
        <% if (Model.getTripUpdate().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><a href="#" data-toggle="tooltip" data-placement="bottom" title="<%=Model.getPosition().get(i)%>"><%=Model.getTripUpdate().get(i)%></a>
        </td>
        <%} %>

        <% if (Model.getVehicleUpdate().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getVehicleUpdate().get(i)%>
        </td>
        <%} %>

        <% if (Model.getStopTimeUpdate().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getStopTimeUpdate().get(i)%>
        </td>
        <%} %>

        <% if (Model.getTimestampUpdate().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getTimestampUpdate().get(i)%>
        </td>
        <%} %>

        <% if (Model.getDelayUpdate().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getDelayUpdate().get(i)%>
        </td>
        <%} %>

    </tr>
        <% } %>

</table>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<script src="${pageContext.request.contextPath}/resources/js/TableDataTable.js"></script>
<%--<script src="${pageContext.request.contextPath}/resources/js/Timer.js"></script>--%>

</body>
</html>
