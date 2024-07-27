<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String father = request.getParameter("father");
String mother = request.getParameter("mother");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String address = request.getParameter("address");


if (id == null || name == null || father == null || mother == null || mobilenumber == null || email == null || address == null) {
    response.sendRedirect("editDeleteList.jsp?msg=invalid");
} else {
    Connection con = null;
    PreparedStatement ps = null;
    try {
        con = ConnectionProvider.getCon();
        ps = con.prepareStatement("UPDATE donor SET name=?, fathername=?, mothername=?, mobilenumber=?, email=?, address=? WHERE id=?");
        ps.setString(1, name);
        ps.setString(2, father);
        ps.setString(3, mother);
        ps.setString(4, mobilenumber);
        ps.setString(5, email);
        ps.setString(6, address);
        ps.setInt(7, Integer.parseInt(id));  // Convert id to int
        
        int result = ps.executeUpdate();
        if (result > 0) {
            response.sendRedirect("editDeleteList.jsp?msg=valid");
        } else {
            response.sendRedirect("editDeleteList.jsp?msg=invalid");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("editDeleteList.jsp?msg=invalid");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
