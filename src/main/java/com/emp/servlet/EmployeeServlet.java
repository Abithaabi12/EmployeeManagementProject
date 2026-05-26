package com.emp.servlet;

import com.emp.dao.EmployeeDAO;
import com.emp.model.Employee;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {

    EmployeeDAO dao = new EmployeeDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String action = req.getParameter("action");

            if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.deleteEmployee(id);
                res.sendRedirect(req.getContextPath() + "/employee?action=list");
            }
            else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Employee emp = dao.getEmployee(id);
                req.setAttribute("emp", emp);
                req.getRequestDispatcher("updateEmployee.jsp").forward(req, res);
            }
            else {
                // ALWAYS load data safely
                List<Employee> list = dao.getAllEmployees();

                System.out.println("SIZE: " + list.size()); // DEBUG

                req.setAttribute("list", list);
                req.getRequestDispatcher("viewEmployees.jsp").forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("ERROR: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {
            if ("insert".equals(action)) {
                Employee emp = new Employee();
                emp.setName(req.getParameter("name"));
                emp.setEmail(req.getParameter("email"));
                emp.setDepartment(req.getParameter("department"));
                emp.setSalary(Double.parseDouble(req.getParameter("salary")));
                dao.insertEmployee(emp);
            }
            else if ("update".equals(action)) {
                Employee emp = new Employee();
                emp.setId(Integer.parseInt(req.getParameter("id")));
                emp.setName(req.getParameter("name"));
                emp.setEmail(req.getParameter("email"));
                emp.setDepartment(req.getParameter("department"));
                emp.setSalary(Double.parseDouble(req.getParameter("salary")));
                dao.updateEmployee(emp);
            }

            res.sendRedirect(req.getContextPath() + "/employee?action=list");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}