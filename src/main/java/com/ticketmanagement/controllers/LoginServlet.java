package com.ticketmanagement.controllers;

import java.io.IOException;

import com.ticketmanagement.dao.UserDAO;
import com.ticketmanagement.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final int MAX_FAILED_ATTEMPTS = 5;
    private static final int LOCK_TIME_MINUTES = 15;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Email and password are required.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        email = email.trim();

        if (userDAO.isEmailExists(email) && userDAO.isAccountLocked(email)) {
            request.setAttribute("error",
                    "Your account is locked due to too many failed login attempts. Please try again after 15 minutes or reset your password.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.loginUser(email, password);

        if (user != null) {
            userDAO.resetFailedAttempts(email);

            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);

            if (user.isAdmin()) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }

        } else {
            if (userDAO.isEmailExists(email)) {
                int failedAttempts = userDAO.increaseFailedAttempts(email);
                int remainingAttempts = MAX_FAILED_ATTEMPTS - failedAttempts;

                if (failedAttempts >= MAX_FAILED_ATTEMPTS) {
                    userDAO.lockAccount(email, LOCK_TIME_MINUTES);

                    request.setAttribute("error",
                            "Too many wrong password attempts. Your account has been locked for 15 minutes.");
                } else {
                    request.setAttribute("error",
                            "Invalid email or password. Attempts remaining: " + remainingAttempts);
                }
            } else {
                request.setAttribute("error", "Invalid email or password.");
            }

            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}