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
public class Notice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int noticenum;

    @Column(nullable = false)
    private Date regidate;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String content;
}
