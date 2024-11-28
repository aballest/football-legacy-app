package es.aballest.football.dao;

import es.aballest.football.entity.Coach;

import java.util.List;

public interface CoachDAO {

    public List<Coach> getCoaches();

    public void saveCoach(Coach theCoach);

    public Coach getCoach(int theId);

    public void deleteCoach(int theId);

    public Coach getCoachByTeamId(int teamId);
}
