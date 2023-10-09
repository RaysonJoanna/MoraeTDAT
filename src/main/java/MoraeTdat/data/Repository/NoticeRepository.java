package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NoticeRepository extends JpaRepository<Notice,Integer> {

    @Query(value="SELECT * from notice order by regidate desc", nativeQuery = true)
    List<Notice> getNoticelist();

    @Query(value="Select * from notice where noticenum=?", nativeQuery = true)
    Notice getNotice(int noticenum);
}
