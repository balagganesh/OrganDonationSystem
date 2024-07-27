<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
String organ = request.getParameter("organ");
String incdec = request.getParameter("indec"); // Corrected parameter name
String count = request.getParameter("count");

try {
    int count1 = Integer.parseInt(count);
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    if (incdec.equals("inc")) {
        st.executeUpdate("UPDATE stock SET count = count + " + count1 + " WHERE organ = '" + organ + "'");
    } else if (incdec.equals("dec")) {
        st.executeUpdate("UPDATE stock SET count = count - " + count1 + " WHERE organ = '" + organ + "'");
    }
    response.sendRedirect("manageStock.jsp?msg=valid");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("manageStock.jsp?msg=invalid");
}
%>
