<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Nicolas
  Date: 2017-04-03
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="webjars/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
<html>
<head>
    <title>GTFS-RT</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="alert alert-info">
                Testing feeds one by one
            </div>

            <form:form method="POST" class="form-inline" action="showTablePosition">
                <div class="form-group">
                    <label for="urlPosition">Url position :</label>
                </div>
                <div class="form-group mx-sm-3">
                    <form:input type="url" id="urlPosition" class="form-control" placeholder="position url"
                                path="urlPosition"/>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
            </form:form>


            <form:form method="POST" class="form-inline" action="showTableTripUpdate">
                <div class="form-group">
                    <label for="urlTrip">Url updates  :</label>
                </div>
                <div class="form-group mx-sm-3">
                    <form:input type="url" id="urlTrip" class="form-control" placeholder="trip url"
                                path="urlTrip"/>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
            </form:form>

            <form:form method="POST" class="form-inline" action="showTableAlert">
                <div class="form-group">
                    <label for="urlAlert"> Url of alerts  :</label>
                </div>
                <div class="form-group mx-sm-3">
                    <form:input type="url" id="urlAlert" class="form-control" placeholder="alert url"
                                path="urlAlert"/>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
            </form:form>
        </div>
        <div class="col">
            <div class="alert alert-info">
                For testing multiples feeds at the same time
            </div>
            <form:form method="POST" action="showTableTripUpdatePosition">
                <table>
                    <tr>
                        <td><form:label path="urlPosition">UrlPosition</form:label></td>
                        <td><form:input path="urlPosition"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="urlTrip">UrlTrip</form:label></td>
                        <td><form:input path="urlTrip"/></td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-primary">Send</button>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="webjars/jquery/3.2.1/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
<script src="webjars/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</body>
</html>
