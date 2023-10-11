package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface NoticeRepository extends JpaRepository<Notice,Integer> {

    @Query(value="SELECT * from notice order by regidate desc", nativeQuery = true)
    List<Notice> getNoticelist();

    @Query(value="Select * from notice where noticenum=?", nativeQuery = true)
    Notice getNotice(int noticenum);

    @Transactional
    @Modifying
    @Query(value = "DELETE from notice where noticenum=?", nativeQuery = true)
    void deleteByNoticenum(int noticenum);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO notice (regidate,title,content) values(now(),?,?)", nativeQuery = true)
    void createNotice(String title, String content);

    @Transactional
    @Modifying
    @Query(value = "update notice set regidate=now(),title=?,content=? where noticenum=?", nativeQuery = true)
    void updateNotice(String title, String content, int noticenum);
}
