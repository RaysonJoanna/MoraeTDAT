package MoraeTdat.Controller;

import MoraeTdat.Service.CheckoutService;
import MoraeTdat.Service.ShopService;
import MoraeTdat.Service.UserService;
import MoraeTdat.data.Entity.Orders;
import MoraeTdat.data.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/MoraeTDAT/mypage")
public class MypageController {

    final UserService userService;
    final CheckoutService checkoutService;
    final ShopService shopService;

    @Autowired
    public MypageController(UserService userService, CheckoutService checkoutService, ShopService shopService) {
        this.userService = userService;
        this.checkoutService = checkoutService;
        this.shopService = shopService;
    }

    //마이페이지 화면
    @GetMapping("")
    public ModelAndView mypage(ModelAndView mav,
                               @SessionAttribute(value = "loginID") String userid) {

        User user = (User)userService.findUserById(userid);
        List<Integer> ordernums = (List<Integer>)checkoutService.getDaepyoOrders(userid);

        List<String> photolist = new ArrayList<>();
        List<Orders> orderlist = new ArrayList<>();

        for(int i=0; i<ordernums.size(); i++){
            int ordernum = ordernums.get(i);
            Orders order =checkoutService.getOrderDaepyoBynum(ordernum);
            orderlist.add(order);

            String photo = shopService.getProductBynum(order.getProductnum()).getMainphoto();
            photolist.add(photo);
        }
        mav.addObject("orderlist",orderlist);
        mav.addObject("photolist",photolist);
        mav.addObject("user",user);
        mav.setViewName("mypage");
        return mav;
    }

    @RequestMapping(value="/changePW", method = RequestMethod.GET)
    public ModelAndView changePW(ModelAndView mav){
        mav.setViewName("changePW");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/changefinish", method = RequestMethod.POST)
    public Map<String,Object> changefinish(@RequestBody Map<String,Object>change,
                                           @SessionAttribute(value = "loginID") String userid){

        Map<String,Object> changed = new HashMap<>();

        if(change.get("changedPW") != null){
            String changedPW = (String)change.get("changedPW");
            userService.updatePw(changedPW,userid);
        } else if(change.get("changedPhone")!=null){
            String changedPhone = (String)change.get("changedPhone");
            userService.updatePhone(changedPhone,userid);
        } else if(change.get("changedEmail")!=null){
            String changedEmail = (String)change.get("changedEmail");
            userService.updateEmail(changedEmail,userid);
        }

        changed.put("changed",true);

        return changed;
    }

    @RequestMapping(value="/changePhone", method = RequestMethod.GET)
    public ModelAndView changePhone(ModelAndView mav){
        mav.setViewName("changePhone");
        return mav;
    }

    @RequestMapping(value="/changeEmail", method = RequestMethod.GET)
    public ModelAndView changeEmail(ModelAndView mav){
        mav.setViewName("changeEmail");
        return mav;
    }

}
