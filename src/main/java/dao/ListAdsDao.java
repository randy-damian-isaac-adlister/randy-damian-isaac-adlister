package dao;

import models.Ad;

import java.util.ArrayList;
import java.util.List;

public class ListAdsDao implements Ads {
    private List<Ad> ads;

    public List<Ad> all() {
        if (ads == null) {
            ads = generateAds();
        }
        return ads;
    }

    public Long insert(Ad ad) {
        // make sure we have ads
        if (ads == null) {
            ads = generateAds();
        }
        // we'll assign an "id" here based on the size of the ads list
        // really the dao would handle this
        ad.setId((long) ads.size());
        ads.add(ad);
        return ad.getId();
    }

    @Override
    public List<Ad> getUserAds(long id) {
        List<Ad> userAds = new ArrayList<>();
        for (Ad ad : all()) {
            if (ad.getUserId() == id) {
                userAds.add(ad);
            }
        }
        return userAds;
    }

    public List<Ad> searchAdsByTitle(String title) {
        List<Ad> userAds = new ArrayList<>();
        for (Ad ad : all()) {
            if (ad.getTitle().contains(title)){
                userAds.add(ad);
            }
        }
        return userAds;
    }

    @Override
    public List<Ad> searchAdsByLocation(String location) {
        List<Ad> userAds = new ArrayList<>();
        for (Ad ad : all()) {
            if (ad.getLocation().contains(location)) {
                userAds.add(ad);
            }
        }
        return userAds;
    }

    @Override
    public List<Ad> searchAdsBySalary(String salary) {
        List<Ad> userAds = new ArrayList<>();
        for (Ad ad : all()) {
            if (ad.getSalary().contains(salary)) {
                userAds.add(ad);
            }
        }
        return userAds;
    }

    @Override
    public List<Ad> searchAdsByJob_type(String Job_type) {
        List<Ad> userAds = new ArrayList<>();
        for (Ad ad : all()) {
            if (ad.getJob_type().contains(Job_type)) {
                userAds.add(ad);
            }
        }
        return userAds;
    }
    @Override
    public List<Ad> searchAdsByShift(String shift) {
        List<Ad> userAds = new ArrayList<>();
        for (Ad ad : all()) {
            if (ad.getShift().contains(shift)) {
                userAds.add(ad);
            }
        }
        return userAds;
    }

    @Override
    public List<Ad> searchAdsByDescription(String description) {
        List<Ad> userAds = new ArrayList<>();
        for (Ad ad : all()) {
            if (ad.getDescription().contains(description)) {
                userAds.add(ad);
            }
        }
        return userAds;
    }
    @Override
    public void editAd(Ad ad) {

    }

    @Override
    public Ad findAdById(long adId) {
        for(Ad ad : all()){
            if(ad.getId() == adId){
                return ad;
            }
        }
        return null;
    }

    @Override
    public void deleteAd(Ad ad) {
        ads.remove(ad);

    }

    private List<Ad> generateAds() {
        List<Ad> ads = new ArrayList<>();
        ads.add(new Ad(
                1,
                1,
                "playstation for sale",
                "This is a slightly used playstation"
        ));
        ads.add(new Ad(
                2,
                1,
                "Super Nintendo",
                "Get your game on with this old-school classic!"
        ));
        ads.add(new Ad(
                3,
                2,
                "Junior Java Developer Position",
                "Minimum 7 years of experience required. You will be working in the scripting language for Java, JavaScript"
        ));
        ads.add(new Ad(
                4,
                2,
                "JavaScript Developer needed",
                "Must have strong Java skills"
        ));
        return ads;
    }
}
