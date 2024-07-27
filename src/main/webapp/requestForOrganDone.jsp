<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String mobilenumber = request.getParameter("mobilenumber");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE organrequest SET status='completed' WHERE mobilenumber=?");
    ps.setString(1, mobilenumber);
    ps.executeUpdate();
    response.sendRedirect("requestForOrgan.jsp?msg=done");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("requestForOrgan.jsp?msg=error");
}
%>
