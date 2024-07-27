<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"], select {
    border: none;
    background: silver;
    height: 50px;
    font-size: 16px;
    margin-left: 35%;
    padding: 15px;
    width: 33%;
    border-radius: 25px;
}

#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 55%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even) {background-color: #f2f2f2;}

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
<div class="container">
<br>
<%
String msg = request.getParameter("msg");
if ("invalid".equals(msg)) {
%>
    <center><font color="red" size="5">Something Went Wrong..! Try Again..!</font></center>
<%
} else if ("valid".equals(msg)) {
%>
    <center><font color="green" size="5">Successfully Updated</font></center>
<%
}
%>
<form action="manageStockAction.jsp" method="post">
<div class="form-group">
    <center><h2>Select Organ</h2></center>
    <select name="organ">
        <option value="Kidney">Kidney</option>
        <option value="Liver">Liver</option>
        <option value="Lungs">Lungs</option>
        <option value="Heart">Heart</option>
        <option value="Pancreas">Pancreas</option>
        <option value="Intestines">Intestines</option>
        <option value="Hand">Hand</option>
        <option value="Face">Face</option>
    </select>
    <center><h2>Select Increase / Decrease</h2></center>
    <select name="indec">
        <option value="inc">Increase</option>
        <option value="dec">Decrease</option>
    </select>
    <center><h2>Counts</h2></center>
    <input type="text" placeholder="Enter Counts" name="count">
    <center><button type="submit" class="button">Save</button></center>
</div>
</form>
<br>
<center>
<table id="customers">
<tr>
<th>Organ</th>
<th>Count</th>
</tr>
<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM stock");
    while (rs.next()) {
%>
<tr>
    <td><%= rs.getString("organ") %></td>
    <td><%= rs.getInt("count") %></td>
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
<h3><center>Balaganesh</center></h3></div>
</body>
</html>
