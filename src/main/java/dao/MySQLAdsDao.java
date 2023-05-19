package dao;

import models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUsername(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM jobs");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO jobs(user_id, title,location, salary,job_type, shift,description) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getLocation());
            stmt.setString(4, ad.getSalary());
            stmt.setString(5, ad.getJob_type());
            stmt.setString(6, ad.getShift());
            stmt.setString(7, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("location"),
                rs.getString("salary"),
                rs.getString("job_type"),
                rs.getString("shift"),
                rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    public List<Ad> getUserAds(long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM jobs WHERE user_id = ?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public void editAd(Ad ad) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("UPDATE jobs SET title = ?, location = ?, salary = ?, job_type = ?, shift = ?, description = ? WHERE user_id = ?");
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getLocation());
            stmt.setString(3, ad.getSalary());
            stmt.setString(4, ad.getJob_type());
            stmt.setString(5, ad.getShift());
            stmt.setString(6, ad.getDescription());
            stmt.setLong(7, ad.getUserId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }
    public Ad findAdById(long adId){
        PreparedStatement stmt = null;
        try{
               stmt = connection.prepareStatement("SELECT * FROM jobs WHERE id = ?");
                stmt.setLong(1, adId);
                ResultSet rs = stmt.executeQuery();
                rs.next();
                return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

