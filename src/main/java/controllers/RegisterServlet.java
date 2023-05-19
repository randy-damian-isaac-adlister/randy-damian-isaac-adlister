package controllers;

import dao.DaoFactory;
import models.User;
import util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String company = request.getParameter("company");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        request.getSession().setAttribute("company", company);
        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("email", email);
        User existingUser = DaoFactory.getUsersDao().findByUsername(username);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        // condition to check if username already exists
        if (existingUser != null){
            out.println("<script type=\"text/javascript\">");
            out.println("let form = document.querySelector(\".form-register\")");
            out.println("let el = document.createElement('h4')");
            out.println("el.innerHTML = Error: username already exists");
            out.println("form.appendChild(el)");
            out.println("console.log(\"test\")");
            out.println("</script>");
            response.sendRedirect("/register");
            return;
        }

        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        User user = new User(username, email, password, company);

        // hash the password

        String hash = Password.hash(user.getPassword());

        user.setPassword(hash);

        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");

    }
}
