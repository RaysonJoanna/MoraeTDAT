package MoraeTdat.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import MoraeTdat.Service.MoraeService;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/MoraeTDAT")
public class MoraeController {
	
	final MoraeService moraeService;
	
	@Autowired
	public MoraeController(MoraeService moraeService) {
		this.moraeService = moraeService;
	}

	@RequestMapping(value="/home", method= RequestMethod.GET)
	public ModelAndView main(ModelAndView mav) {
		mav.setViewName("/home");

		return mav;
	}

	@RequestMapping(value="/logout", method= RequestMethod.GET)
	public ModelAndView logout(ModelAndView mav, HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.invalidate();

		mav.addObject("logout",true);
		mav.setViewName("/login");

		return mav;
	}


	//마이페이지 화면
	@GetMapping("/mypage")
	public String mypage() {
		
		return "mypage";
	}
	

	//모래 화면
	@GetMapping ("/morae")
	public String aboutMorae() {
		
		return "AboutMorae";
	}

	//모래 화면
	@GetMapping ("/contact")
	public String contact() {

		return "contactus";
	}

}
