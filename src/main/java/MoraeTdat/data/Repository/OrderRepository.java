package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Order;
import MoraeTdat.data.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order,Long> {

}
