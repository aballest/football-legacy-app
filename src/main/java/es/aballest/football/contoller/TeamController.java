package es.aballest.football.contoller;

import es.aballest.football.entity.Team;
import es.aballest.football.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/team")
public class TeamController {

    @Autowired
    private TeamService teamService;

    @GetMapping("/list")
    public String listTeams(Model theModel) {
        List<Team> theTeams = teamService.getTeams();
        theModel.addAttribute("teams", theTeams);
        return "list-teams";
    }

    @GetMapping("/showForm")
    public String showFormForAdd(Model theModel) {
        Team theCustomer = new Team();
        theModel.addAttribute("team", theCustomer);
        return "team-form";
    }

    @PostMapping("/saveTeam")
    public String saveTeam(@ModelAttribute("team") Team theTeam) {
        teamService.saveTeam(theTeam);
        return "redirect:/team/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("teamId") int theId,
                                    Model theModel) {
        Team theTeam = teamService.getTeam(theId);
        theModel.addAttribute("team", theTeam);
        return "team-form";
    }

    @GetMapping("/delete")
    public String deleteTeam(@RequestParam("teamId") int theId) {
        teamService.deleteTeam(theId);
        return "redirect:/team/list";
    }
}
