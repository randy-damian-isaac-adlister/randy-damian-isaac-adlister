package controllers;

import dao.DaoFactory;
import models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ads/edit")
public class EditAdServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Ad ad = DaoFactory.getAdsDao().findAdById(Long.parseLong(req.getParameter("ad-id")));
        ad.setTitle(req.getParameter("title"));
        ad.setLocation(req.getParameter("location"));
        ad.setSalary(req.getParameter("salary"));
        ad.setJob_type(req.getParameter("job_type"));
        ad.setShift(req.getParameter("shift"));
        ad.setDescription(req.getParameter("description"));

        System.out.println(ad.getJob_type());
        DaoFactory.getAdsDao().editAd(ad);
        resp.sendRedirect("/profile");
    }
}
