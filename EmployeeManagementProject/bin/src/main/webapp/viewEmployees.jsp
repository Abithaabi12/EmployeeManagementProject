<%@ page import="java.util.*,com.emp.model.Employee" %>

<!DOCTYPE html>
<html>
<head>
<title>Employees</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

<h2>Employee List</h2>

<table class="table table-bordered">

<tr class="table-dark">
<th>ID</th><th>Name</th><th>Email</th><th>Dept</th><th>Salary</th><th>Action</th>
</tr>

<%
List<Employee> list = (List<Employee>) request.getAttribute("list");

if(list != null && !list.isEmpty()){
    for(Employee e : list){
%>

<tr>
<td><%=e.getId()%></td>
<td><%=e.getName()%></td>
<td><%=e.getEmail()%></td>
<td><%=e.getDepartment()%></td>
<td><%=e.getSalary()%></td>

<td>
<a href="<%=request.getContextPath()%>/employee?action=edit&id=<%=e.getId()%>">
<a href="<%=request.getContextPath()%>/employee?action=delete&id=<%=e.getId()%>">
</td>
</tr>

<%
    }
} else {
%>

<tr>
<td colspan="6" class="text-center text-danger">No Employees Found</td>
</tr>

<%
}
%>

</table>

<a href="index.jsp" class="btn btn-secondary">Back</a>

</body>
</html>