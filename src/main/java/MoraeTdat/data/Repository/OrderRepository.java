package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order,Long> {
}
