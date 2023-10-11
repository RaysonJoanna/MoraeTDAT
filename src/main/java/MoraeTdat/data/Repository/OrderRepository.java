package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Orders,Integer> {

    @Transactional
    @Modifying
    @Query(value = "insert into orders (ordernum, productnum, productname, productprice, productoption," +
            "ordername, orderphone, orderemail, deliverzcode, delivername, orderdate, amount, deliverphone, deliveraddr, userid) values " +
            "(?,?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?)",nativeQuery = true)
    void putOrder(int ordernum,int productnum, String productname,int productprice, String productoption,
                  String ordername, String orderphone, String orderemail, int deliverzcode, String delivername, int amount, String deliveraddr, String deliverphone,String userid);

    @Query(value = "SELECT * from Orders where userid=?",nativeQuery = true)
    List<Orders> getOrderById(String id);

    @Query(value = "SELECT * from Orders where ordernum=? LIMIT 1",nativeQuery = true)
    Orders getOrderDaepyoBynum(int ordernum);

    @Query(value="SELECT DISTINCT ordernum FROM orders where userid=? ORDER BY ordernum LIMIT 3", nativeQuery = true)
    List<Integer> getDaepyoOrders(String id);

    @Query(value="SELECT IFNULL(MAX(ordernum), 0)+1 FROM orders", nativeQuery = true)
    int createOrdernum();


}
