package MoraeTdat.Controller;

import MoraeTdat.Service.InquiryService;
import MoraeTdat.data.Entity.Inquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/MoraeTDAT/admin/inquiry")
public class AdminInquiryController {

    final InquiryService inquiryService;

    @Autowired
    public AdminInquiryController(InquiryService inquiryService) {
        this.inquiryService = inquiryService;
    }

    @RequestMapping(value="", method = RequestMethod.GET)
    public ModelAndView inquiry(ModelAndView mav){
 List<Inquiry> list = inquiryService.getAllInquiry();

        mav.addObject("inquirylist",inquiryService.getAllInquiry());
        mav.setViewName("admin_inquiry");
        return mav;
    }

    @RequestMapping(value="/view", method = RequestMethod.GET)
    public ModelAndView inquiryView(ModelAndView mav,
                                    @RequestParam String inquirynum){

        Inquiry inquiry = inquiryService.getInquiry(inquirynum);

        mav.addObject("inquiry",inquiry);
        mav.setViewName("admin_inquiryView");
        return mav;
    }

    @RequestMapping(value="/delete", method = RequestMethod.GET)
    public String inquiryDelete(@RequestParam String num){

        int inquirynum = Integer.parseInt(num);

        inquiryService.deleteByInquirynum(inquirynum);

        return "redirect:/MoraeTDAT/admin/inquiry";
    }

    @ResponseBody
    @RequestMapping(value="/reply", method = RequestMethod.POST)
    public Map<String,Object> inquiryReply(ModelAndView mav,
                                           @RequestBody Map<String,Object>reply){
        Map<String,Object> replyFinish = new HashMap<>();

        String answercontent = (String)reply.get("content");
        int inquirynum = Integer.parseInt((String)reply.get("inquirynum"));

        inquiryService.addReply(answercontent,inquirynum);

        replyFinish.put("reply",true);

        return replyFinish;
    }

}
