package MoraeTdat.Controller;

import MoraeTdat.Service.InquiryService;
import MoraeTdat.data.Entity.Inquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/MoraeTDAT/inquiry")
public class InquiryController {
    
    final InquiryService inquiryService;

    @Autowired
    public InquiryController(InquiryService inquiryService) {
        this.inquiryService = inquiryService;
    }

    //문의사항
    @GetMapping("")
    public ModelAndView inquiry(ModelAndView mav) {
        List<Inquiry> userlist = new ArrayList<>();

        userlist = inquiryService.getUserInquiries();

        mav.addObject("userlist",userlist);
        mav.setViewName("inquiry");
        return mav;
    }

    @GetMapping("/write")
    public ModelAndView inquiryWrite(ModelAndView mav) {
        mav.setViewName("inquiryWrite");

        return mav;
    }


    //문의사항 남기기 과정
    @RequestMapping(value = "/write-process", method = RequestMethod.POST)
    public ModelAndView inquiryWriteProcess(ModelAndView mav,
                               @SessionAttribute(value = "loginID") String userid,
                               @RequestBody Map<String,Object> inquiryData) {

        String title = (String)inquiryData.get("title");
        String naeyong = (String)inquiryData.get("naeyong");

        inquiryService.addInquiry(title,naeyong,userid);

        mav.setViewName("inquiry");
        return mav;
    }

    @RequestMapping(value="/view",method = RequestMethod.GET)
    public ModelAndView inquiryView(ModelAndView mav,
                                    @SessionAttribute(value="loginID")String userid,
                                    @RequestParam String inquirynum){

        Inquiry inquiry = inquiryService.getInquiry(inquirynum);

        mav.addObject("inquiry",inquiry);
        mav.setViewName("inquiryView");

        return mav;
    }
}
