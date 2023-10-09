package MoraeTdat.data.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Cart {

    @Id
    @Column
    private int productnum;

    @Column(nullable = false)
    private String productname;

    @Column(nullable = false)
    private int productprice;

    @Column
    private String productoption;

    @Column(nullable = false)
    private String userid;

    @Column(nullable = false)
    private LocalDate cartdate;

    @Column
    private int amount;

    @Column(nullable = false)
    private String mainphoto;

}


