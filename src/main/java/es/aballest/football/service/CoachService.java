package es.aballest.football.service;

import es.aballest.football.entity.Coach;

import java.util.List;

public interface CoachService {

    public List<Coach> getCoaches();

    public void saveCoach(Coach theCoach);

    public Coach getCoach(int theId);

    public void deleteCoach(int theId);

    public Coach getCoachByTeamId(int teamId);

}
