package es.aballest.football.service;

import es.aballest.football.dao.PlayerDAO;
import es.aballest.football.entity.Player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlayerServiceImpl implements PlayerService {

    @Autowired
    private PlayerDAO playerDAO;

    @Override
    @Transactional
    public List<Player> getPlayers() {
        return playerDAO.getPlayers();
    }

    @Override
    @Transactional
    public void savePlayer(Player thePlayer) {
        playerDAO.savePlayer(thePlayer);
    }

    @Override
    @Transactional
    public Player getPlayer(int theId) {
        return playerDAO.getPlayer(theId);
    }

    @Override
    @Transactional
    public void deletePlayer(int theId) {
        playerDAO.deletePlayer(theId);
    }

    @Override
    @Transactional
    public List<Player> getPlayersByTeamId(int teamId) {
        return playerDAO.getPlayersByTeamId(teamId);
    }
}
