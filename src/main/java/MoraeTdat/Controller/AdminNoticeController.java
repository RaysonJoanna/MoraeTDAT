package MoraeTdat.Controller;

import MoraeTdat.Service.NoticeService;
import MoraeTdat.data.Entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/MoraeTDAT/admin/notice")
public class AdminNoticeController {

    final NoticeService noticeService;

    @Autowired
    public AdminNoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView notice(ModelAndView mav){

        mav.setViewName("admin_notice");
        mav.addObject("noticelist",noticeService.getNoticelist());
        return mav;
    }

    @RequestMapping(value="/view",method = RequestMethod.GET)
    public ModelAndView noticeView(ModelAndView mav,
                                   @RequestParam String noticenum){

        Notice notice = noticeService.getNotice(Integer.parseInt(noticenum));

        mav.addObject("notice",notice);
        mav.setViewName("admin_noticeView");

        return mav;
    }

    @RequestMapping(value="/update", method = RequestMethod.GET)
    public ModelAndView updateView(ModelAndView mav,
                                   @RequestParam String num){

        Notice notice = noticeService.getNotice(Integer.parseInt(num));

        mav.addObject("notice",notice);
        mav.setViewName("admin_noticeUpdate");

        return mav;
    }

    @RequestMapping(value="/write", method = RequestMethod.GET)
    public ModelAndView write(ModelAndView mav){

        mav.setViewName("admin_noticeWrite");

        return mav;
    }

    @RequestMapping(value = "/update-process", method = RequestMethod.POST)
    public ModelAndView update(ModelAndView mav,
                               @RequestParam int noticenum,
                               @RequestParam String title,
                               @RequestParam String content){

        noticeService.updateNotice(title,content,noticenum);

        Notice notice = noticeService.getNotice(noticenum);
        mav.addObject("notice",notice);
        mav.setViewName("admin_noticeView");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(ModelAndView mav,
                               @RequestParam String num){

        noticeService.deleteByNoticenum(Integer.parseInt(num));
        mav.setViewName("admin_notice");
        mav.addObject("noticelist",noticeService.getNoticelist());

        return mav;
    }

    @RequestMapping(value="/write-process", method = RequestMethod.POST)
    public ModelAndView writeproces(ModelAndView mav,
                                    @RequestParam String title,
                                    @RequestParam String content){

        noticeService.createNotice(title,content);
        mav.setViewName("admin_notice");
        mav.addObject("noticelist",noticeService.getNoticelist());

        return mav;
    }

}
