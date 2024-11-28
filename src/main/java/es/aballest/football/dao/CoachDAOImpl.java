package es.aballest.football.dao;

import es.aballest.football.entity.Coach;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class CoachDAOImpl implements CoachDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Coach> getCoaches() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Coach> cq = cb.createQuery(Coach.class);
        Root<Coach> root = cq.from(Coach.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public void deleteCoach(int id) {
        Session session = sessionFactory.getCurrentSession();
        Coach team = session.byId(Coach.class).load(id);
        session.delete(team);
    }

    @Override
    public void saveCoach(Coach theCoach) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(theCoach);
    }

    @Override
    public Coach getCoach(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Coach theCoach = currentSession.get(Coach.class, theId);
        return theCoach;
    }

    @Override
    public Coach getCoachByTeamId(int teamId) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();

        CriteriaQuery<Coach> cq = cb.createQuery(Coach.class);

        Root<Coach> root = cq.from(Coach.class);

        Predicate teamPredicate = cb.equal(root.get("team").get("id"), teamId);
        cq.where(teamPredicate);

        Query query = session.createQuery(cq);

        return (Coach) query.getSingleResult();
    }
}
