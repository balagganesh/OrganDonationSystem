<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<center>
<table id="customers">
<tr>
<th>Name</th>
<th>Mobile Number</th>
<th>Email</th>
<th>Organ</th>
<th>Done</th>
<th>Delete</th>
</tr>
<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM organrequest WHERE status = 'pending'");
    while (rs.next()) {
%>
<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("mobilenumber") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("organ") %></td>
    <td><a href="requestForOrganDone.jsp?mobilenumber=<%= rs.getString("mobilenumber") %>">Done</a></td>
    <td><a href="requestForOrganDelete.jsp?mobilenumber=<%= rs.getString("mobilenumber") %>">Delete</a></td>
</tr>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
</table>
</center>
<br>
<br>
<br>
<br>
<h3><center>Organ Donation System..</center></h3>
<h3><center>Created by..</center></h3>
<h3><center>Balaganesh</center></h3></body>
</html>
