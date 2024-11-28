package es.aballest.football.service;

import es.aballest.football.entity.Player;

import java.util.List;

public interface PlayerService {

    public List<Player> getPlayers();

    public void savePlayer(Player thePlayer);

    public Player getPlayer(int theId);

    public void deletePlayer(int theId);

    public List<Player> getPlayersByTeamId(int teamId);

}
