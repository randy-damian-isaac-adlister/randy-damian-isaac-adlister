package dao;

import models.User;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);

    void editUser(User user);

    User findByID(String parameter);
}
