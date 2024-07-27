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
<center>
<table id="customers">
<tr>
<th>Name</th>
<th>Mobile Number</th>
<th>Email</th>
<th>Organ</th>
</tr>
<tr>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from organrequest where status ='completed'");
	while(rs.next()){
		%>
		<td><%=rs.getString(1) %>
		<td><%=rs.getString(2) %>
		<td><%=rs.getString(3) %>
		<td><%=rs.getString(4) %>
		</tr>
		<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
</center>




</center>
<br>
<br>
<br>
<br>
<h3><center>Organ Donation System..</center></h3>
<h3><center>Created by..</center></h3>
<h3><center>Balaganesh</center></h3>
</body>
</html>