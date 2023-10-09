package MoraeTdat.Controller;

import MoraeTdat.Service.UserService;
import MoraeTdat.data.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/MoraeTDAT/login")
public class LoginController {

    final UserService userService;
    @Autowired
    public LoginController(UserService userService) {
        this.userService = userService;
    }

    //로그인 화면
    @RequestMapping(value="", method= RequestMethod.GET)
    public ModelAndView login(ModelAndView mav) {
        mav.setViewName("login");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/process", method= RequestMethod.POST)
    public Map<String,Object> loginprocess(ModelAndView mav,
                                           @RequestBody Map<String,Object> logInfo,
                                           HttpServletRequest request) {
        //클라이언트에 넘길 데이터 담을 맵
        Map<String,Object> login = new HashMap<>();

        boolean login_status = userService.confirmLogin(logInfo);
        User loginUser = userService.findUserById((String)logInfo.get("id"));

        HttpSession session = request.getSession();

        session.setMaxInactiveInterval(60*60);
        session.setAttribute("loginUser",loginUser);
        session.setAttribute("loginID",(String)logInfo.get("id"));

        if(login_status) {
            login.put("login", true);
            login.put("id", logInfo.get("id"));
        } else
            login.put("login",false);

        return login;
    }

    @RequestMapping(value="/find-id", method= RequestMethod.GET)
    public ModelAndView findID(ModelAndView mav) {
        mav.setViewName("findID");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/finding", method= RequestMethod.POST)
    public Map<String,Object> finding(ModelAndView mav, @RequestBody Map<String,Object> findData) {

        Map<String,Object>finding = new HashMap<>();

        String useremail = (String)findData.get("email");
        String userphone = (String)findData.get("phone");

        String userid = "";

        if(userService.findUserByEmailPhone(useremail,userphone) != null) {
            userid = userService.findUserByEmailPhone(useremail, userphone).getUserid();
        }

        finding.put("userid",userid);

        return finding;
    }

    @RequestMapping(value="/find-pw", method= RequestMethod.GET)
    public ModelAndView findPW(ModelAndView mav) {
        mav.setViewName("findPW");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/findingPW", method= RequestMethod.POST)
    public Map<String,Object> findingPW(ModelAndView mav, @RequestBody Map<String,Object> findData) {

        Map<String,Object>finding = new HashMap<>();

        String userid = (String)findData.get("userid");
        String userphone = (String)findData.get("userphone");
        String userpw = "";

        if(userService.findUserById(userid) != null) {
            userpw = userService.findUserById(userid).getUserpw();
        }

        finding.put("userpw",userpw);

        return finding;
    }


}
