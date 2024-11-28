package es.aballest.football.service;

import es.aballest.football.entity.Team;

import java.util.List;

public interface TeamService {

    public List<Team> getTeams();

    public void saveTeam(Team theTeam);

    public Team getTeam(int theId);

    public void deleteTeam(int theId);

}
