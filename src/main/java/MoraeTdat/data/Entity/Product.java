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
public class Product {

    @Id
    @Column
    private int productnum;

    @Column(nullable = false)
    private String mainphoto;

    @Column(nullable = false)
    private String detailphoto;

    @Column(nullable = false)
    private String productname;

    @Column(nullable = false)
    private int productprice;

    private String productoption;

    @Column(nullable = false)
    private String productdetail;

    @Column(nullable = false)
    private String category;

    @Column(nullable = false)
    private int panmae;

    @Column(nullable = false)
    private int amount;

    @Column(nullable = false)
    private Date regidate;
}
