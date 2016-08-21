package usersdata.dao;

import usersdata.model.UsersEntity;

import java.util.List;

/**
 * Created by xande_000 on 16.08.2016.
 */
public interface UserDao {
    void addUser(UsersEntity user);
    void updateUser(UsersEntity user);
    void removeUser(int id);
    UsersEntity getUserById(int id);
    List<UsersEntity> getUsersByName(String name);
    List<UsersEntity> getAllUsers(Integer page, int limitResultsPerPage);

}
