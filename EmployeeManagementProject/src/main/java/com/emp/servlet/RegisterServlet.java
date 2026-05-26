package com.emp.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee_db", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username,password) VALUES(?,?)");

            ps.setString(1, user);
            ps.setString(2, pass);

            ps.executeUpdate();

            // Redirect to login after register
            res.sendRedirect(req.getContextPath() + "/login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}