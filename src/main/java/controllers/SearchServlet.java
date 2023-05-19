package controllers;

import dao.DaoFactory;
import models.Ad;
import dao.MySQLAdsDao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;


@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        request.setAttribute("adsByTile", DaoFactory.getAdsDao().searchAdsByTitle(search)); // Perform the search
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }
}







//@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/search")
//public class SearchServlet extends HttpServlet {
//    private MySQLAdsDao adsDao;
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String search = request.getParameter("search");
//        List<Ad> ads = adsDao.search(search);  // Perform the search
//        request.setAttribute("ads", ads);
//        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
//    }
//    private List search(String search) {
//        return null;
//    }
//
//
//}