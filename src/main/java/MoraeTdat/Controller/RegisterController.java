package MoraeTdat.Controller;

import MoraeTdat.Service.UserService;
import MoraeTdat.data.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping( "/MoraeTDAT/register")
public class RegisterController {

    final UserService userService;

    @Autowired
    public RegisterController(UserService userService) {
        this.userService = userService;
    }

    //회원가입 화면으로 이동
    @RequestMapping(value="", method= RequestMethod.GET)
    public ModelAndView register(ModelAndView mav) {
        mav.setViewName("signup");

        return mav;
    }

    //회원가입 과정
    @ResponseBody
    @RequestMapping(value="/process", method= RequestMethod.POST)
    public Map<String,Object> registerProcess(ModelAndView mav, @RequestBody Map<String,Object> regiData) {

        Map<String,Object> registered = new HashMap<>() ;

        //회원가입한 회원 엔티티 설정
        User newuser = new User();

        newuser.setUserid((String)regiData.get("userid"));
        newuser.setUserpw((String)regiData.get("userpw"));
        newuser.setUserphone((String)regiData.get("userphone"));
        newuser.setUseremail((String)regiData.get("useremail"));
        newuser.setUserzcode(Integer.parseInt((String) regiData.get("userzcode")));
        newuser.setUseraddr((String)regiData.get("useraddr"));

        userService.insertNewUser(newuser);

        int success = userService.findUserByIdPW(newuser.getUserid(),newuser.getUserpw());

        if(success>0){
            registered.put("registered",true);
        }

        return registered;
    }

    //회원가입 아이디 중복 검사
    @ResponseBody
    @RequestMapping(value="/idtest", method= RequestMethod.POST)
    public Map<String,Object> idtest(ModelAndView mav, @RequestBody Map<String,Object> idtest) {
        Map<String,Object> result = new HashMap<>();

        boolean test =  userService.idTest((String) idtest.get("idtest"));

        String testResult= test? "OK" : "NO";

        result.put("test",testResult);

        mav.addObject(result);
        mav.setViewName("signup");

        return result;
    }


}
