package com.emp.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee_db", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=?");

            ps.setString(1, user);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            System.out.println("LOGIN BUTTON CLICKED");

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                res.sendRedirect(req.getContextPath() + "/index.jsp"); // ✅ FIX
            } else {
                res.sendRedirect(req.getContextPath() + "/login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}