package MoraeTdat.data.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Heart {

    @Column(nullable = false)
    private String userid;

    @Id
    private int productnum;

    @Column(nullable = false)
    private String productname;

    @Column(nullable = false)
    private int productprice;

    @Column(nullable = false)
    private String mainphoto;

}
