package MoraeTdat.data.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
public class Order {

    @Id
    private Long productnum;

    @Column(nullable = false)
    private String productName;

    @Column(nullable = false)
    private Long productprice;

    private String productoption;

    @Column(nullable = false)
    private String ordername;

    @Column(nullable = false)
    private String orderphone;

    @Column(nullable = false)
    private String orderemail;

    @Column(nullable = false)
    private int deliverzcode;

    @Column(nullable = false)
    private String deliveraddr;

    @Column(nullable = false)
    private String delivename;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private String ordernum;

    @Column(nullable = false)
    private Date orderdate;

}
