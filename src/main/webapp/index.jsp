<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen">
    <style>
        .mySlides { display: none; }

        input[type="text"], input[type="mail"] {
            border: none;
            background: silver;
            height: 50px;
            font-size: 16px;
            margin-left: 2%;
            padding: 15px;
        }

        .button1 {
            /* Add your button styles here */
        }
    </style>
</head>
<body>

<div class="header">
    <a href="#default" class="logo"><img class="logo" src="adminlogo.jpg"></a>
    <div class="header-right">
        <a class="active" href="index.jsp">Home</a>
        <a href="adminLogin.jsp">Admin Login</a>
    </div>
</div>

<div style="max-width:100%">
    <img class="mySlides" src="welcomeslide2.jpg">
    <img class="mySlides" src="organdonation slide2.jpg">
</div>

<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) { myIndex = 1 }
        x[myIndex - 1].style.display = "block";
        setTimeout(carousel, 2000); // Change image every 2 seconds
    }
</script>

<br>
<%
String msg = request.getParameter("msg");
if ("valid".equals(msg)) {
%>
    <center><font color="red" size="5">Form Submitted Successfully.. You will get notified within 24 hours..</font></center>
<%
}
if ("invalid".equals(msg)) {
%>
    <center><font color="red" size="5">Invalid Data..! Please Try Again..!</font></center>
<%
}
%>
<center>
    <h1>Enter Your Details to Request for Organ</h1>
    <form action="indexFormAction.jsp" method="post">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="text" name="mobilenumber" placeholder="Enter Mobile Number" required>
        <input type="mail" name="email" placeholder="Enter email" required>
        <input type="text" name="organ" placeholder="Enter Organ" required>
        <button class="button1"><span>Submit</span></button>
    </form>
</center>

<br><br>

<div class="row1">
    <div class="container">
        <br>
        <br>
    </div>
</div>
<h3><center>Organ Donation System..</center></h3>
<h3><center>Created by..</center></h3>
<h3><center>Balaganesh</center></h3>
</body>
</html>
