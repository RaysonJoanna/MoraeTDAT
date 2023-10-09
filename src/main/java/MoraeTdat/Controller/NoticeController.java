package MoraeTdat.Controller;

import MoraeTdat.Service.NoticeService;
import MoraeTdat.data.Entity.Inquiry;
import MoraeTdat.data.Entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value="/MoraeTDAT/notice")
public class NoticeController {

    final NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @RequestMapping(value="", method= RequestMethod.GET)
    public ModelAndView notice(ModelAndView mav){

        List<Notice> noticelist = noticeService.getNoticelist();

        mav.addObject("noticelist",noticelist);
        mav.setViewName("notice");

        return mav;
    }

    @RequestMapping(value="/view",method = RequestMethod.GET)
    public ModelAndView noticeView(ModelAndView mav,
                                    @SessionAttribute(value="loginID")String userid,
                                    @RequestParam String noticenum){

        Notice notice = noticeService.getNotice(Integer.parseInt(noticenum));

        mav.addObject("notice",notice);
        mav.setViewName("noticeView");

        return mav;
    }


}
