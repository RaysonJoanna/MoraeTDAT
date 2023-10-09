package MoraeTdat.Controller;

import MoraeTdat.Service.HeartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping(value="/MoraeTDAT/shop/heartpage")
public class HeartController {

    final HeartService heartService;

    @Autowired
    public HeartController(HeartService heartService) {
        this.heartService = heartService;
    }

    @RequestMapping(value="", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView heartpage(ModelAndView mav,
                                  @SessionAttribute(value = "loginID") String userid,
                                  @RequestParam(value="gubun",required = false) String gubun,
                                  @RequestBody(required = false) Map<String,Object> deleteData){

        mav.setViewName("heartlist");

        if(gubun!=null && gubun.equals("all-delete")){
            heartService.deleteAll(userid);
        } else if(gubun!=null && gubun.equals("part-delete")){
            String nums = (String)deleteData.get("deleteData");
            String num[] = nums.split(",");

            for(int i =0 ; i<num.length; i++){
                int number = Integer.parseInt(num[i]);
                heartService.deletePart(number,userid);
            }
        }


        mav.addObject("heartlist",heartService.getHeartList(userid));

        return mav;
    }



}
