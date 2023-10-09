package MoraeTdat.data.DTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class User {
    private Long usernum;

    private String userid;

    private String userpw;

    private String userphone;

    private String useremail;

    private int userzcode;

    private String useraddr;
}
