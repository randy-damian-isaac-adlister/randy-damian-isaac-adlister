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
import java.util.regex.Pattern;

@WebServlet("/register")
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

        request.getSession().removeAttribute("emptyEmail");
        request.getSession().removeAttribute("emptyUsername");
        request.getSession().removeAttribute("emptyPassword");
        request.getSession().removeAttribute("noMatch");
        request.getSession().removeAttribute("emailError");

        User existingUser = DaoFactory.getUsersDao().findByUsername(username);

        if (email.isEmpty()) {
            String msg = "Email field must be filled";
            request.getSession().setAttribute("emptyEmail", msg);
            request.getSession().setAttribute("error", "has");
        }

        if (username.isEmpty()) {
            String msg = "Username field must be filled";
            request.getSession().setAttribute("emptyUsername", msg);
            request.getSession().setAttribute("error", "has");
        }

        if (password.isEmpty()) {
            String msg = "Password field must be filled";
            request.getSession().setAttribute("emptyPassword", msg);
            request.getSession().setAttribute("error", "has");
        }

        boolean passwordNoMatch = !password.equals(passwordConfirmation) || password.isEmpty();
        if (passwordNoMatch) {
            String msg = "Passwords must match";
            request.getSession().setAttribute("noMatch", msg);
            request.getSession().setAttribute("error", "has");
        }

        if (!emailIsValid(email)) {
            String msg = "Email must be valid format (ex. ...@gmail.com)";
            request.getSession().setAttribute("emailError", msg);
            request.getSession().setAttribute("error", "has");
        }

        if (!emailIsValid(email) || email.isEmpty() || username.isEmpty() || password.isEmpty() || passwordNoMatch || existingUser != null){
            response.sendRedirect("/register");
        }

        if (existingUser != null && !username.isEmpty()) {
            String msg = "This username is already being used";
            request.getSession().setAttribute("userExists", msg);
            request.getSession().setAttribute("error", "has");
        }

        if (emailIsValid(email) && !email.isEmpty() && !username.isEmpty() && !password.isEmpty() && !passwordNoMatch && existingUser == null){
            User user = new User(username, email, password, company);
            String hash = Password.hash(user.getPassword());
            user.setPassword(hash);
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        }


    }
    public static boolean emailIsValid (String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
                "[a-zA-Z0-9_+&*-]+)*@" +
                "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                "A-Z]{2,7}$";
        Pattern pat = Pattern.compile(emailRegex);
        if (email == null)
            return false;
        return pat.matcher(email).matches();
    }
}
