package controllers;

import dao.DaoFactory;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profile/edit")
public class ProfileEditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("user-id"));
        User user = DaoFactory.getUsersDao().findByID(request.getParameter("user-id"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setCompany_name(request.getParameter("company_name"));
        DaoFactory.getUsersDao().editUser(user);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/profile");
    }
}
