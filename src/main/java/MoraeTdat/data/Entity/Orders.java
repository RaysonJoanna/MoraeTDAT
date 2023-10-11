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
public class Orders {

    @Id
    private int productnum;

    @Column(nullable = false)
    private String productname;

    @Column(nullable = false)
    private int productprice;

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
    private String delivername;

    @Column(nullable = false)
    private int ordernum;

    @Column(nullable = false)
    private Date orderdate;

    @Column(nullable = false)
    private int amount;

    @Column(nullable = false)
    private String deliverphone;
}
