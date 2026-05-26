<%@ page session="true" %>
<%
    // Destroy session
    session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<title>Logout</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: lightblue;
}
.card {
    margin-top: 120px;
    border-radius: 15px;
}
</style>

</head>

<body>

<div class="container">
<div class="card col-md-4 mx-auto p-4 text-center shadow">

<h3>Logged Out Successfully</h3>

<p class="mt-3">You have been logged out</p>

<a href="login.jsp" class="btn btn-primary mt-3">Login Again</a>

</div>
</div>

</body>
</html>