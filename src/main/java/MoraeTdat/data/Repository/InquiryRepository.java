package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Inquiry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;


public interface InquiryRepository extends JpaRepository<Inquiry,Integer> {

    @Transactional
    @Modifying
    @Query(value="INSERT INTO inquiry (regidate,title,content,userid) values(now(),:title,:content,:userid)", nativeQuery = true)
    void addInquiry(@Param("title")String title, @Param("content")String content, @Param("userid")String userid);

    @Query(value = "Select * from inquiry where userid != 'admin' order by regidate desc", nativeQuery = true)
    List<Inquiry> getUserInquiries();

    @Query(value="SELECT * from inquiry where inquirynum=?", nativeQuery = true)
    Inquiry getInquiry(String inquirynum);
}
