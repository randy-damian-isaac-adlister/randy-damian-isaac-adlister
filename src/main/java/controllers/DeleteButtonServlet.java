package controllers;

import dao.DaoFactory;
import models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profile/delete")
public class DeleteButtonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        System.out.println(request.getParameter("ad-id-delete"));
        Ad ad = DaoFactory.getAdsDao().findAdById(Long.parseLong(request.getParameter("ad-id")));
        DaoFactory.getAdsDao().deleteAd(ad);
        response.sendRedirect("/profile");
    }
}
