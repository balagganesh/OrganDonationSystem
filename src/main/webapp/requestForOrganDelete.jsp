<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String mobilenumber = request.getParameter("mobilenumber");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("DELETE FROM organrequest WHERE mobilenumber=?");
    ps.setString(1, mobilenumber);
    ps.executeUpdate();
    response.sendRedirect("requestForOrgan.jsp?msg=deleted");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("requestForOrgan.jsp?msg=error");
}
%>
