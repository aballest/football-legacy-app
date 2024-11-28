package es.aballest.football.dao;

import es.aballest.football.entity.Team;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class TeamDAOImpl implements TeamDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Team> getTeams() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Team> cq = cb.createQuery(Team.class);
        Root<Team> root = cq.from(Team.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public void deleteTeam(int id) {
        Session session = sessionFactory.getCurrentSession();
        Team team = session.byId(Team.class).load(id);
        session.delete(team);
    }

    @Override
    public void saveTeam(Team theTeam) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(theTeam);
    }

    @Override
    public Team getTeam(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Team theTeam = currentSession.get(Team.class, theId);
        return theTeam;
    }
}
