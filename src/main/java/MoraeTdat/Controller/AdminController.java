package MoraeTdat.Controller;

import MoraeTdat.Service.AdminLoginService;
import MoraeTdat.data.Entity.User;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/MoraeTDAT/admin")
public class AdminController {

    private String admin_ID = "MoraeTDATadmin";
    private String admin_PW = "MoraeSuperCute";

    final AdminLoginService adminLoginService;

    @Autowired
    public AdminController(AdminLoginService adminLoginService) {
        this.adminLoginService = adminLoginService;
    }

    //관리자 로그인 화면으로 이동
    @RequestMapping(value="", method= RequestMethod.GET)
    public ModelAndView login(ModelAndView mav) {
        mav.setViewName("admin");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/login-process", method= RequestMethod.POST)
    public ModelAndView loginprocess(ModelAndView mav,
                                     @RequestParam String adminID,
                                     @RequestParam String adminPW) {
        if(adminID.equals(admin_ID)){
            if(adminPW.equals(admin_PW)){
                mav.setViewName("admin_home");
            } else {
                mav.addObject("login",false);
            }
        } else {
            mav.addObject("login",false);
        }

        return mav;
    }

    //url로 접근 불가
    @RequestMapping(value="/login-process", method= RequestMethod.GET)
    public ModelAndView loginprocessNo(ModelAndView mav){
        mav.setViewName("admin");

        return mav;
    }

}