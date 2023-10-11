package MoraeTdat.Controller;

import MoraeTdat.Service.CheckoutService;
import MoraeTdat.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import MoraeTdat.Service.MoraeService;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
;

@Controller
@RequestMapping("/MoraeTDAT")
public class MoraeController {
	
	final MoraeService moraeService;
	final UserService userService;
	final CheckoutService checkoutService;
	
	@Autowired
	public MoraeController(MoraeService moraeService, UserService userService, CheckoutService checkoutService) {
		this.moraeService = moraeService;
		this.userService = userService;
		this.checkoutService = checkoutService;
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

	//모래 화면
	@GetMapping ("/morae")
	public ModelAndView aboutMorae(ModelAndView mav) {
		mav.setViewName("AboutMorae");
		return mav;
	}

	//contact us 화면
	@GetMapping ("/contact")
	public ModelAndView contact(ModelAndView mav) {
		mav.setViewName("contactus");
		return mav;
	}

}
