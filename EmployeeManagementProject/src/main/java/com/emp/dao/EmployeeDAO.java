package com.emp.dao;

import java.sql.*;
import java.util.*;
import com.emp.model.Employee;

public class EmployeeDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/employee_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // ADD
    public void insertEmployee(Employee emp) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO employees(name,email,department,salary) VALUES(?,?,?,?)");
        ps.setString(1, emp.getName());
        ps.setString(2, emp.getEmail());
        ps.setString(3, emp.getDepartment());
        ps.setDouble(4, emp.getSalary());
        ps.executeUpdate();
    }

    // VIEW
    public List<Employee> getAllEmployees() throws Exception {
        List<Employee> list = new ArrayList<>();
        Connection con = getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM employees");

        while (rs.next()) {
            list.add(new Employee(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("department"),
                rs.getDouble("salary")
            ));
        }
        return list;
    }

    // DELETE
    public void deleteEmployee(int id) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM employees WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    // GET BY ID
    public Employee getEmployee(int id) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM employees WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return new Employee(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("department"),
                rs.getDouble("salary")
            );
        }
        return null;
    }

    // UPDATE
    public void updateEmployee(Employee emp) throws Exception {
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE employees SET name=?, email=?, department=?, salary=? WHERE id=?");
        ps.setString(1, emp.getName());
        ps.setString(2, emp.getEmail());
        ps.setString(3, emp.getDepartment());
        ps.setDouble(4, emp.getSalary());
        ps.setInt(5, emp.getId());
        ps.executeUpdate();
    }

    // SEARCH
    public List<Employee> searchEmployee(String name) throws Exception {
        List<Employee> list = new ArrayList<>();
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM employees WHERE name LIKE ?");
        ps.setString(1, "%" + name + "%");

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            list.add(new Employee(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("department"),
                rs.getDouble("salary")
            ));
        }
        return list;
    }
}