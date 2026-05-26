<%
if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f4f6f9;
}

/* Sidebar */
.sidebar {
    width: 240px;
    height: 100vh;
    position: fixed;
    background: linear-gradient(180deg,#1e3c72,#2a5298);
    color: white;
    padding-top: 20px;
}

.sidebar h4 {
    text-align: center;
    margin-bottom: 30px;
}

.sidebar a {
    display: block;
    color: white;
    padding: 12px 20px;
    text-decoration: none;
    transition: 0.3s;
}

.sidebar a:hover {
    background: rgba(255,255,255,0.2);
}

/* Content */
.content {
    margin-left: 240px;
    padding: 40px;
}

/* Cards */
.card-box {
    border-radius: 15px;
    padding: 25px;
    color: white;
    transition: 0.3s;
}

.card-box:hover {
    transform: translateY(-8px);
}

/* Gradient cards */
.card1 {
    background: linear-gradient(135deg,#36d1dc,#5b86e5);
}

.card2 {
    background: linear-gradient(135deg,#11998e,#38ef7d);
}

.card3 {
    background: linear-gradient(135deg,#fc4a1a,#f7b733);
}

/* Header */
.header {
    margin-bottom: 30px;
}

</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4> Admin Panel</h4>

    <a href="<%=request.getContextPath()%>/index.jsp"> Dashboard</a>
    <a href="<%=request.getContextPath()%>/addEmployee.jsp"> Add Employee</a>
    <a href="<%=request.getContextPath()%>/employee?action=list"> View Employees</a>
    <a href="<%=request.getContextPath()%>/logout.jsp"> Logout</a>
</div>

<!-- Main Content -->
<div class="content">

    <div class="header">
        <h2>Welcome, <%=session.getAttribute("user")%> </h2>
        <p class="text-muted">Employee Management Dashboard</p>
    </div>

    <div class="row g-4">

        <!-- Total Employees -->
        <div class="col-md-4">
            <div class="card-box card1 shadow">
                <h5>Total Employees</h5>
                <h2><%= application.getAttribute("count")==null ? 0 : application.getAttribute("count") %></h2>
            </div>
        </div>

        <!-- Departments -->
        <div class="col-md-4">
            <div class="card-box card2 shadow">
                <h5>Departments</h5>
                <h2>5</h2>
            </div>
        </div>

        <!-- Status -->
        <div class="col-md-4">
            <div class="card-box card3 shadow">
                <h5>Status</h5>
                <h2>Active</h2>
            </div>
        </div>

    </div>

</div>

</body>
</html>