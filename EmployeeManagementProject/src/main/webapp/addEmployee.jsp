<%
if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
}
%>



<!DOCTYPE html>
<html>
<head>
<title>Add Employee</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: #f4f6f9;
}
.container-box {
    max-width: 500px;
    margin: 60px auto;
    padding: 30px;
    background: white;
    border-radius: 15px;
    box-shadow: 0px 5px 20px rgba(0,0,0,0.1);
}
</style>
</head>

<body>

<div class="container-box">

<h3 class="text-center mb-4">Add Employee</h3>

<form action="employee" method="post">

<input type="hidden" name="action" value="insert">

<input type="text" name="name" class="form-control mb-3" placeholder="Enter Name" required>
<input type="email" name="email" class="form-control mb-3" placeholder="Enter Email" required>
<input type="text" name="department" class="form-control mb-3" placeholder="Enter Department" required>
<input type="number" name="salary" class="form-control mb-3" placeholder="Enter Salary" required>

<button class="btn btn-success w-100">Add Employee</button>

</form>

<a href="index.jsp" class="btn btn-secondary w-100 mt-3">Back</a>

</div>

</body>
</html>