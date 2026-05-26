<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: skyblue;
}
.card {
    margin-top: 80px;
    border-radius: 15px;
}
</style>

</head>

<body>

<div class="container">
<div class="card col-md-4 mx-auto p-4 shadow">

<h3 class="text-center mb-3">Register</h3>

<form action="register" method="post">

<input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

<input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

<button class="btn btn-success w-100">Register</button>

</form>

<a href="login.jsp" class="btn btn-link w-100 mt-2">Already have account? Login</a>

</div>
</div>

</body>
</html>