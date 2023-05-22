package dao;

import models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // get a list of all the ads for a given user
    List<Ad> getUserAds(long id);

    List<Ad> searchAdsByTitle(String search);

    List<Ad> searchAdsByLocation(String location);

    List<Ad> searchAdsBySalary(String salary);

    List<Ad> searchAdsByJob_type(String job_type);

    List<Ad> searchAdsByShift(String shift);

    List<Ad> searchAdsByDescription(String description);
}
