package MoraeTdat.Controller;

import MoraeTdat.Service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping(value="/MoraeTDAT/shop/cartpage")
public class CartController {

    final CartService cartService;

    @Autowired
    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @RequestMapping(value="", method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView cartpage(ModelAndView mav,
                                 @SessionAttribute(value = "loginID") String userid,
                                 @RequestParam(value="gubun",required = false) String gubun,
                                 @RequestBody(required = false) Map<String,Object> deleteData){

        mav.setViewName("cart");

        if(gubun!=null && gubun.equals("all-delete")){
            cartService.deleteAll(userid);
        } else if(gubun!=null && gubun.equals("part-delete")){
            String nums = (String)deleteData.get("deleteData");
            String num[] = nums.split(",");

            for(int i =0 ; i<num.length; i++){
                int number = Integer.parseInt(num[i]);
                cartService.deletePart(number,userid);
            }
        }

        mav.addObject("cartlist",cartService.getCartList(userid));

        return mav;
    }

    @RequestMapping(value="/all-delete", method=RequestMethod.GET)
    public ModelAndView cartAllDelete(ModelAndView mav){


        return mav;
    }


}
