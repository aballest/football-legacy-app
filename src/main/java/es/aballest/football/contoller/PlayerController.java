package es.aballest.football.contoller;

import es.aballest.football.entity.Player;
import es.aballest.football.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/player")
public class PlayerController {

    @Autowired
    private PlayerService playerService;

    @GetMapping("/list")
    public String listPlayers(Model theModel) {
        List<Player> thePlayers = playerService.getPlayers();
        theModel.addAttribute("players", thePlayers);
        return "list-players";
    }

    @GetMapping("/listByTeam")
    public String listPlayersByTeam(@RequestParam("teamId") int teamId, Model theModel) {
        List<Player> thePlayers = playerService.getPlayersByTeamId(teamId);
        theModel.addAttribute("players", thePlayers);
        theModel.addAttribute("teamId", teamId);
        return "list-players";
    }

    @GetMapping("/showForm")
    public String showFormForAdd(Model theModel) {
        Player thePlayer = new Player();
        theModel.addAttribute("player", thePlayer);
        return "player-form";
    }

    @PostMapping("/savePlayer")
    public String savePlayer(@ModelAttribute("player") Player thePlayer, @RequestParam(value = "teamId", required = false) Integer teamId) {
        playerService.savePlayer(thePlayer);
        if (teamId != null) {
            return "redirect:/player/listByTeam?teamId=" + teamId;
        } else {
            return "redirect:/player/list";
        }
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("playerId") int theId, @RequestParam(value = "teamId", required = false) Integer teamId,
                                    Model theModel) {
        Player thePlayer = playerService.getPlayer(theId);
        theModel.addAttribute("player", thePlayer);
        System.out.println("Team ID: " + teamId);
        if (teamId != null) {
            System.out.println("Team ID: " + teamId);
            theModel.addAttribute("teamId", teamId);
        }
        return "player-form";
    }

    @GetMapping("/delete")
    public String deleteTeam(@RequestParam("playerId") int theId) {
        playerService.deletePlayer(theId);
        return "redirect:/player/list";
    }
}
