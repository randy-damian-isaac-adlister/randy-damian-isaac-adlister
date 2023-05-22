package controllers;

import dao.DaoFactory;
import models.Ad;
import dao.MySQLAdsDao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("title");
        String location = request.getParameter("location");
        String salary = request.getParameter("salary");
        String job_type = request.getParameter("job_type");
        String shift = request.getParameter("shift");
        String description = request.getParameter("description");

        if (location.length() > 0) {
            List<Ad> adsByLocation = DaoFactory.getAdsDao().searchAdsByLocation(location);
            request.setAttribute("adsByLocation", adsByLocation);
        } else if (search.length() > 0) {
            List<Ad> adsByTitle = DaoFactory.getAdsDao().searchAdsByTitle(search);
            request.setAttribute("adsByTitle", adsByTitle);
        } else if (job_type.length() > 0) {
            List<Ad> adsByJob_type = DaoFactory.getAdsDao().searchAdsByJob_type(job_type);
            request.setAttribute("adsByJob_type", adsByJob_type);
        } else if (salary.length() >0) {
            List<Ad> adsBySalary = DaoFactory.getAdsDao().searchAdsBySalary(salary);
            request.setAttribute("adsBySalary", adsBySalary);
        } else if (shift.length() >0) {
            List<Ad> adsByShift = DaoFactory.getAdsDao().searchAdsByShift(shift);
            request.setAttribute("adsByShift", adsByShift);
        } else if (description.length() >0) {
            List<Ad> adsByDescription = DaoFactory.getAdsDao().searchAdsByDescription(description);
            request.setAttribute("adsByDescription", adsByDescription);
        }

//        System.out.println("Number of ads found by title: " + adsByTitle.size());
//        System.out.println("Number of ads found by location: " + adsByLocation.size());
//        System.out.println("Number of ads found by salary: " + adsBySalary.size());
//        System.out.println("Number of ads found by job type: " + adsByJob_type.size());
//        System.out.println("Number of ads found by shift: " + adsByShift.size());
//        System.out.println("Number of ads found by description: " + adsByDescription.size());

        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }
}