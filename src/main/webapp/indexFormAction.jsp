<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String name = request.getParameter("name");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String organ = request.getParameter("organ");
String status = "Pending";
try {
    Connection con = ConnectionProvider.getCon();
    if (con != null) {
        PreparedStatement ps = con.prepareStatement("INSERT INTO organrequest (name, mobilenumber, email, organ, status) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, mobilenumber);
        ps.setString(3, email);
        ps.setString(4, organ);
        ps.setString(5, status);
        ps.executeUpdate();
        response.sendRedirect("index.jsp?msg=valid");
    } else {
        response.sendRedirect("index.jsp?msg=invalid");
    }
} catch (Exception e) {
    e.printStackTrace(); // Print the exception to server logs for debugging
    response.sendRedirect("index.jsp?msg=invalid");
}
%>
