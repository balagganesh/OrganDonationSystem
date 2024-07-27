<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ include file="header.html" %>
<!DOCTYPE html>
<html lang="en">
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
<div class="container">
<%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
%>
        <center><font color="green" size="5">Successfully Updated</font></center>
<%
    } else if ("invalid".equals(msg)) {
%>
        <center><font color="red" size="5">Something Went Wrong.. Please Try Again..</font></center>
<%
    }
%>
<%
    int id = 1;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT MAX(id) FROM donor");
        if (rs.next()) {
            id = rs.getInt(1) + 1;
        }
%>
        <h1 style="color:red;">Donor Id: <%= id %></h1>
<%
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1 style='color:red;'>Error retrieving donor ID</h1>");
    }
%>
    <form action="addNewDonorAction.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <h2>Name</h2>
        <input type="text" name="name" placeholder="Enter Name" required>
        <hr>
        <h2>Father Name</h2>
        <input type="text" name="father" placeholder="Enter Father Name" required>
        <hr>
        <h2>Mother Name</h2>
        <input type="text" name="mother" placeholder="Enter Mother Name" required>
        <hr>
        <h2>Mobile Number</h2>
        <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
        <hr>
        <h2>Gender</h2>
        <select name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Others">Others</option>
        </select>
        <hr>
        <h2>Email</h2>
        <input type="email" name="email" placeholder="Enter Email" required>
        <hr>
        <h2>Organ</h2>
        <select name="organ" required>
            <option value="Kidney">Kidney</option>
            <option value="Liver">Liver</option>
            <option value="Lungs">Lungs</option>
            <option value="Heart">Heart</option>
            <option value="Pancreas">Pancreas</option>
            <option value="Intestines">Intestines</option>
            <option value="Hand">Hand</option>
            <option value="Face">Face</option>
        </select>
        <hr>
        <h2>Address</h2>
        <input type="text" name="address" placeholder="Enter Address" required>
        <br>
        <center><button type="submit" class="button">Save</button></center>
    </form>
</div>
<br><br><br><br>
<h3><center>Organ Donation System..</center></h3>
<h3><center>Created by..</center></h3>
<h3><center>Balaganesh</center></h3>
</body>
</html>
