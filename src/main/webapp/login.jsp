<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background: skyblue;
}
.card {
    margin-top: 100px;
    border-radius: 15px;
}
</style>
</head>

<body>

<div class="container">
<div class="card p-4 col-md-4 mx-auto shadow">

<h3 class="text-center">Employee Login</h3>

<form action="<%=request.getContextPath()%>/login" method="post">

    <input type="text" name="username" placeholder="Username" required class="form-control mb-3">

    <input type="password" name="password" placeholder="Password" required class="form-control mb-3">

    <button class="btn btn-primary w-100">Login</button>

</form>

<% if(request.getParameter("error")!=null){ %>
<p class="text-danger text-center mt-2">Invalid Username or Password</p>
<% } %>
<a href="register.jsp" class="btn btn-link w-100 mt-2">Create Account</a>

</div>
</div>

</body>
</html>