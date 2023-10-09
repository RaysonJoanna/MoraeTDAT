package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface CartRepository extends JpaRepository<Cart,Integer> {

    @Query(value="SELECT * from cart where userid=?", nativeQuery = true)
    List<Cart> getCartList(String userid);

    @Transactional
    @Modifying
    @Query(value="DELETE from cart where userid=?", nativeQuery = true)
    void deleteAll(String userid);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM cart WHERE productnum =? and userid=?", nativeQuery = true)
    void deletePart(int number, String userid);

}
