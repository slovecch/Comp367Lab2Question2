<%@ page import="java.time.LocalTime" %>
<html>
<head>
    <title>Welcome to COMP367</title>
</head>
<body>
    <%
        // Get the current time
        LocalTime currentTime = LocalTime.now();
        String greeting;

        // Determine the greeting based on the time of day
        if (currentTime.isBefore(LocalTime.NOON)) {
            greeting = "Good morning";
        } else {
            greeting = "Good afternoon";
        }

        String name = "Stefan Lovecchio"; 
    %>

    <h1><%= greeting %>, <%= name %><br> Welcome to COMP367!</h1>
</body>
</html>
