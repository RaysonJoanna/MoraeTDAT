package MoraeTdat.Service;

import MoraeTdat.data.Entity.Notice;
import MoraeTdat.data.Repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class NoticeService {

    private final NoticeRepository noticeRepository;

    @Autowired
    public NoticeService(NoticeRepository noticeRepository) {
        this.noticeRepository = noticeRepository;
    }

    public List<Notice> getNoticelist(){ return noticeRepository.getNoticelist(); }

    public Notice getNotice(int noticenum) { return noticeRepository.getNotice(noticenum);
    }
}
