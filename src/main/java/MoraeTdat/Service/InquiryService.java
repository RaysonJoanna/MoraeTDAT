package MoraeTdat.Service;

import MoraeTdat.data.Entity.Inquiry;
import MoraeTdat.data.Repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class InquiryService {

    private final InquiryRepository inquiryRepository;

    @Autowired
    public InquiryService(InquiryRepository inquiryRepository) {
        this.inquiryRepository = inquiryRepository;
    }
    public void addInquiry(String title, String content, String userid){inquiryRepository.addInquiry(title,content,userid);};

    public List<Inquiry> getUserInquiries(){return inquiryRepository.getUserInquiries();}

    public Inquiry getInquiry(String inquirynum) { return inquiryRepository.getInquiry(inquirynum);
    }
}
