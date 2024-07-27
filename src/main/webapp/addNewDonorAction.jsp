<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%
    String name = request.getParameter("name");
    String father = request.getParameter("father");
    String mother = request.getParameter("mother");
    String mobilenumber = request.getParameter("mobilenumber");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String organ = request.getParameter("organ");
    String address = request.getParameter("address");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("INSERT INTO donor (name, fathername, mothername, mobilenumber, gender, email, organ, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, father);
        ps.setString(3, mother);
        ps.setString(4, mobilenumber);
        ps.setString(5, gender);
        ps.setString(6, email);
        ps.setString(7, organ);
        ps.setString(8, address);
        ps.executeUpdate();
        response.sendRedirect("addNewDonor.jsp?msg=valid");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("addNewDonor.jsp?msg=invalid");
    }
%>
