package usersdata.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import usersdata.model.UsersEntity;

import java.util.List;

/**
 * Created by xande_000 on 16.08.2016.
 */
@Repository
public class UserDaoImpl implements UserDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void addUser(UsersEntity user) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void updateUser(UsersEntity user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public void removeUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        UsersEntity user = getUserById(id);
        if (user != null)
            session.delete(user);
    }

    @Override
    public UsersEntity getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return (UsersEntity) session.get(UsersEntity.class, id);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<UsersEntity> getUsersByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM UsersEntity WHERE name = :name");
        query.setParameter("name", name);
        return (List<UsersEntity>) query.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<UsersEntity> getAllUsers(Integer page, int limitResultsPerPage) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from UsersEntity");
        query.setFirstResult((page - 1) * limitResultsPerPage);
        query.setMaxResults(limitResultsPerPage);
        return query.list();
    }
}
