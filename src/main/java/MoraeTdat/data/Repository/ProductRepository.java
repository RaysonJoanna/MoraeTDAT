package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Cart;
import MoraeTdat.data.Entity.Heart;
import MoraeTdat.data.Entity.Product;
import jdk.vm.ci.meta.Value;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {

    @Query(value="SELECT * from product where category=?", nativeQuery = true)
    List<MoraeTdat.data.Entity.Product> shoplistByCategory(String category);

    @Query(value ="SELECT * from product where productnum=?", nativeQuery = true)
    Product getProductBynum(int productnum);

    @Transactional
    @Modifying
    @Query(value="INSERT INTO cart (productnum, productname, productprice, productoption, userid, cartdate, amount,mainphoto) values (:productnum, :productname, :productprice, :productoption, :userid, now(), :amount, :mainphoto)", nativeQuery = true)
    void addCartByProductnum(@Param("productnum") int productnum, @Param("productname") String productname, @Param("productprice") int productprice,
                             @Param("productoption") String productoption, @Param("userid") String userid,@Param("amount") int amount, @Param("mainphoto") String mainphoto);

    @Transactional
    @Modifying
    @Query(value="INSERT INTO heart (productnum, productname, productprice, userid, mainphoto) values (:productnum, :productname, :productprice, :userid, :mainphoto)", nativeQuery = true)
    void addHeartByProductnum(@Param("productnum") int productnum, @Param("productname") String productname,
                              @Param("productprice") int productprice, @Param("userid") String userid, @Param("mainphoto") String mainphoto);

    @Query(value="SELECT * FROM product WHERE productname LIKE %?1% AND category = ?2", nativeQuery = true)
    List<Product> searchByKeyword(String keyword, String category);

    @Query(value="SELECT * FROM product WHERE productname LIKE %?1% order by panmae desc LIMIT 9 ", nativeQuery = true)
    List<Product> searchByKeywordB(String keyword);

    @Query(value="SELECT * FROM product WHERE productname LIKE %?1% order by regidate desc LIMIT 9 ", nativeQuery = true)
    List<Product> searchByKeywordN(String keyword);

    @Query(value = "select count(*) from cart where productnum =?", nativeQuery = true)
    int isExistsProduct(int productnum);

    @Transactional
    @Modifying
    @Query(value = "update cart set amount = amount+?, productoption = ?  where productnum =?", nativeQuery = true)
    void updateAmount(int amount,String productoption, int productnum);

    @Query(value = "select count(*) from heart where productnum =?", nativeQuery = true)
    int checkHeart(int productnum);

    @Query(value="SELECT * from heart where userid=?", nativeQuery = true)
    List<Heart> getHeartList(String userid);

    @Query(value="SELECT * from product order by panmae desc  LIMIT 9", nativeQuery = true)
    List<Product> getBestList();

    @Query(value="SELECT * from product order by regidate desc LIMIT 9", nativeQuery = true)
    List<Product> getNewList();

    @Query(value="SELECT * from product where category=? order by panmae desc", nativeQuery = true)
    List<Product> orderHitList(String category);

    @Query(value="SELECT * from product where category=? order by productprice", nativeQuery = true)
    List<Product> orderLowpriceList(String category);

}
