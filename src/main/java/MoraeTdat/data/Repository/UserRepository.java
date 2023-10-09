package MoraeTdat.data.Repository;

import MoraeTdat.data.DTO.Product;
import MoraeTdat.data.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO user (userid, userpw, userphone, useremail, userzcode, useraddr) VALUES " +
            "(:#{#user.userid}, :#{#user.userpw}, :#{#user.userphone}, :#{#user.useremail}, :#{#user.userzcode}, :#{#user.useraddr})", nativeQuery = true)
    void insertNewUser(User user);

    @Query(value="SELECT COUNT(*) from user where userid=? and userpw=?", nativeQuery = true)
    int findUserByIdPW(String id, String pw);

    @Query(value="SELECT COUNT(*) from user where userid=?", nativeQuery = true)
    int idTest(String id);

    @Query(value="SELECT * from user where userid=?", nativeQuery = true)
    User findUserById(String id);

    @Query(value = "Select * from user where useremail=? and userphone=?", nativeQuery = true)
    User findUserByEmailPhone(String email, String phone);
}
