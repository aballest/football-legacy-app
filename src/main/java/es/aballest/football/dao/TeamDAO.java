package es.aballest.football.dao;

import es.aballest.football.entity.Team;

import java.util.List;

public interface TeamDAO {

    public List<Team> getTeams();

    public void saveTeam(Team theTeam);

    public Team getTeam(int theId);

    public void deleteTeam(int theId);
}
