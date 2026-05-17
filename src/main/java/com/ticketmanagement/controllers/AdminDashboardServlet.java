package com.ticketmanagement.controllers;

import java.io.IOException;
import java.util.List;

import com.ticketmanagement.dao.UserDAO;
import com.ticketmanagement.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (!loggedInUser.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        int totalUsers = userDAO.countAllUsers();
        int adminUsers = userDAO.countAdminUsers();
        int normalUsers = userDAO.countNormalUsers();
        int lockedUsers = userDAO.countLockedUsers();
        List<User> recentUsers = userDAO.getRecentUsers();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("adminUsers", adminUsers);
        request.setAttribute("normalUsers", normalUsers);
        request.setAttribute("lockedUsers", lockedUsers);
        request.setAttribute("recentUsers", recentUsers);

        request.getRequestDispatcher("/WEB-INF/pages/admin-dashboard.jsp").forward(request, response);
    }
}