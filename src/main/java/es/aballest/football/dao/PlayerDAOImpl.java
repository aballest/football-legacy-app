package es.aballest.football.dao;

import es.aballest.football.entity.Player;
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
public class PlayerDAOImpl implements PlayerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Player> getPlayers() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Player> cq = cb.createQuery(Player.class);
        Root<Player> root = cq.from(Player.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public void deletePlayer(int id) {
        Session session = sessionFactory.getCurrentSession();
        Player team = session.byId(Player.class).load(id);
        session.delete(team);
    }

    @Override
    public void savePlayer(Player thePlayer) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(thePlayer);
    }

    @Override
    public Player getPlayer(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Player thePlayer = currentSession.get(Player.class, theId);
        return thePlayer;
    }

    @Override
    public List<Player> getPlayersByTeamId(int teamId) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();

        CriteriaQuery<Player> cq = cb.createQuery(Player.class);

        Root<Player> root = cq.from(Player.class);

        Predicate teamPredicate = cb.equal(root.get("team").get("id"), teamId);
        cq.where(teamPredicate);

        Query query = session.createQuery(cq);

        return query.getResultList();
    }
}
