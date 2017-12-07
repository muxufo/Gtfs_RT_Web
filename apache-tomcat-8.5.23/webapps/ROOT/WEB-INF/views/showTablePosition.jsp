<%@ page import="com.google.transit.realtime.GtfsRealtime" %>
<%@ page import="com.google.transit.realtime.GtfsRealtime.FeedEntity" %>
<%@ page import="com.google.transit.realtime.GtfsRealtime.FeedMessage" %>
<%@ page import="com.nicolas.model.Model" %>
<%@ page import="java.net.URL" %>
<%--
  Created by IntelliJ IDEA.
  User: Nicolas
  Date: 2017-04-04
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%@include file="/resources/jsp/head.jsp" %>

    <title>Position Feed</title>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTWVzS7N8wgrUZP3s5UkQh1MKBj7wC1VE"
            type="text/javascript"></script>
</head>
<body>
<%--<meta http-equiv="refresh" content="30"/>--%>
<%--<div class="alert alert-info" id="timer">--%>
    <%--&lt;%&ndash;<strong>Warning : </strong> This page will refresh in 30 seconds !&ndash;%&gt;--%>
<%--</div>--%>

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
        <th>Position</th>
        <th>current_stop_sequence</th>
        <th>stop_id</th>
        <th>current_status</th>
        <th>timestamp</th>
        <th>congestion_level</th>
        <th>occupacy_level</th>
    </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < Model.getVehicle().size(); i += 1) { %>
    <tr>
        <% if (Model.getTrip().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getTrip().get(i)%>
        </td>
        <%} %>

        <% if (Model.getVehicle().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getVehicle().get(i)%>
        </td>
        <%} %>

        <% if (Model.getPosition().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getPosition().get(i)%>
        </td>
        <%} %>

        <% if (Model.getCurrent_stop_sequence().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getCurrent_stop_sequence().get(i)%>
        </td>
        <%} %>

        <% if (Model.getStop_id().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getStop_id().get(i)%>
        </td>
        <%} %>

        <% if (Model.getCurrent_status().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getCurrent_status().get(i)%>
        </td>
        <%} %>

        <% if (Model.getTimestampPose().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getTimestampPose().get(i)%>
        </td>
        <%} %>

        <% if (Model.getCongestion_level().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getCongestion_level().get(i)%>
        </td>
        <%} %>

        <% if (Model.getOccupacy_level().isEmpty()) { %>
        <td></td>
        <% } else {%>
        <td><%=Model.getOccupacy_level().get(i)%>
        </td>
        <%} %>
    </tr>
        <% } %>

</table>

<div id="map" style="height: 90%; width: 90%;margin: auto;"></div>

<script>
    const locations = [];
    const bounds = new google.maps.LatLngBounds();
    const image = "/resources/icons/bus1.svg";
    const map = new google.maps.Map(document.getElementById('map'), {
        zoom: 1,
        center: new google.maps.LatLng(0, 0),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    const infowindow = new google.maps.InfoWindow();
    /**
     * Initialisation des markers
     */
    <%
    URL urlPosition = new URL(Model.getUrlPositionStatic());
    FeedMessage feed = GtfsRealtime.FeedMessage.parseFrom(urlPosition.openStream());
    for(FeedEntity entity : feed.getEntityList() ) {%>
    locations.push([<%= Model.getLabel(entity)%>, <%=Model.getLatitude(entity)%>, <%=Model.getLongitude(entity)%>]);
    <%} %>

    let marker, i;
    for (i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map,
            icon: image
        });
        bounds.extend(marker.position);
        google.maps.event.addListener(marker, 'click',
            (function (marker, i) {
                return function () {
                    infowindow.setContent(String(locations[i][0]));
                    infowindow.open(map, marker);
                }
            })(marker, i));
    }
    map.fitBounds(bounds);
</script>
<%@include file="/resources/jsp/body.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/TableDataTable.js"></script>
<%--<script src="${pageContext.request.contextPath}/resources/js/Timer.js"></script>--%>
</body>
</html>
