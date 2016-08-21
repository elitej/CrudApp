package usersdata.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import usersdata.dao.UserDao;
import usersdata.model.UsersEntity;

import java.util.List;

/**
 * Created by xande_000 on 16.08.2016.
 */
@Service
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(UsersEntity user) {
        userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(UsersEntity user) {
        userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        userDao.removeUser(id);
    }

    @Override
    @Transactional
    public UsersEntity getUserById(int id) {
        return userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<UsersEntity> getUsersByName(String name) {
        return userDao.getUsersByName(name);
    }

    @Override
    @Transactional
    public List<UsersEntity> getAllUsers(Integer page, int limitResultsPerPage) {
        return userDao.getAllUsers(page, limitResultsPerPage);
    }
}
