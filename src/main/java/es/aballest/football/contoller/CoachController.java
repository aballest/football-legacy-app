package es.aballest.football.contoller;

import es.aballest.football.entity.Coach;
import es.aballest.football.service.CoachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/coach")
public class CoachController {

    @Autowired
    private CoachService coachService;

    @GetMapping("/list")
    public String listCoaches(Model theModel) {
        List<Coach> theCoaches = coachService.getCoaches();
        theModel.addAttribute("coaches", theCoaches);
        return "list-coaches";
    }

    @GetMapping("/showForm")
    public String showFormForAdd(Model theModel) {
        Coach theCoach = new Coach();
        theModel.addAttribute("coach", theCoach);
        return "coach-form";
    }

    @PostMapping("/saveCoach")
    public String saveCoach(@ModelAttribute("coach") Coach theCoach) {
        coachService.saveCoach(theCoach);
        return "redirect:/coach/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("coachId") int theId,
                                    Model theModel) {
        Coach theCoach = coachService.getCoach(theId);
        theModel.addAttribute("coach", theCoach);
        return "coach-form";
    }

    @GetMapping("/delete")
    public String deleteTeam(@RequestParam("coachId") int theId) {
        coachService.deleteCoach(theId);
        return "redirect:/coach/list";
    }
}
