<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    <style>
        input[type="text"], input[type="password"], input[type="email"], select, input[type="number"] {
            border: none;
            background: silver;
            height: 50px;
            font-size: 16px;
            padding: 15px;
            width: 60%;
            border-radius: 25px;
            margin-left: 20%;
        }
        h2, h1 {
            margin-left: 20%;
        }
        hr {
            width: 60%;
        }
    </style>
</head>
<body>
    <%
    String id = request.getParameter("id");
    if (id == null) {
        response.sendRedirect("editDeleteList.jsp?msg=invalid");
    }
    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM donor WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
    %>
    <div class="container">
        <form action="updateDonorAction.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <h2>Name</h2>
            <input type="text" value="<%= rs.getString("name") %>" name="name" required>
            <hr>
            <h2>Father Name</h2>
            <input type="text" value="<%= rs.getString("fathername") %>" name="father" required>
            <hr>
            <h2>Mother Name</h2>
            <input type="text" value="<%= rs.getString("mothername") %>" name="mother" required>
            <hr>
            <h2>Mobile Number</h2>
            <input type="number" value="<%= rs.getString("mobilenumber") %>" name="mobilenumber" required>
            <hr>
            <h2>Email</h2>
            <input type="email" value="<%= rs.getString("email") %>" name="email" required>
            <hr>
            <h2>Address</h2>
            <input type="text" value="<%= rs.getString("address") %>" name="address" required>
            <br>
            <center><button type="submit" class="button">Save</button></center>
        </form>
    </div>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    <br><br><br><br>
<h3><center>Organ Donation System..</center></h3>
<h3><center>Created by..</center></h3>
<h3><center>Balaganesh</center></h3></body>
</html>
