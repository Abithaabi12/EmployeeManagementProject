<%@ page import="com.emp.model.Employee" %>
<%
Employee e = (Employee) request.getAttribute("emp");
%>

<!DOCTYPE html>
<html>
<head>
<title>Update</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h2>Update Employee</h2>

<form action="employee" method="post">

<input type="hidden" name="action" value="update">
<input type="hidden" name="id" value="<%=e.getId()%>">

<input type="text" name="name" value="<%=e.getName()%>" class="form-control mb-3">
<input type="email" name="email" value="<%=e.getEmail()%>" class="form-control mb-3">
<input type="text" name="department" value="<%=e.getDepartment()%>" class="form-control mb-3">
<input type="number" name="salary" value="<%=e.getSalary()%>" class="form-control mb-3">

<button class="btn btn-success">Update</button>
<a href="<%=request.getContextPath()%>/employee?action=list" class="btn btn-secondary">Back</a>

</form>

</body>
</html>