package es.aballest.football.service;

import es.aballest.football.dao.CoachDAO;
import es.aballest.football.entity.Coach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CoachServiceImpl implements CoachService {

    @Autowired
    private CoachDAO coachDAO;

    @Override
    @Transactional
    public List<Coach> getCoaches() {
        return coachDAO.getCoaches();
    }

    @Override
    @Transactional
    public void saveCoach(Coach theCoach) {
        coachDAO.saveCoach(theCoach);
    }

    @Override
    @Transactional
    public Coach getCoach(int theId) {
        return coachDAO.getCoach(theId);
    }

    @Override
    @Transactional
    public void deleteCoach(int theId) {
        coachDAO.deleteCoach(theId);
    }

    @Override
    @Transactional
    public Coach getCoachByTeamId(int teamId) {
        return coachDAO.getCoachByTeamId(teamId);
    }
}
