package MoraeTdat.Service;


import MoraeTdat.data.Entity.User;
import MoraeTdat.data.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void insertNewUser(User user) {
        userRepository.insertNewUser(user);
    }

    public int findUserByIdPW(String id, String pw){
       int result = userRepository.findUserByIdPW(id,pw);

       return  result;
    }
    public boolean confirmLogin(Map<String, Object> logInfo) {
        boolean login = false;

        String checkId = (String)logInfo.get("id");
        String checkPw = (String)logInfo.get("pw");

        int confirm = userRepository.findUserByIdPW(checkId,checkPw);

        if(confirm>0){
            login = true;
        }

        return login;
    }

    public boolean idTest(String idtest) {
        boolean idTest = false;

        int test = userRepository.idTest(idtest);

        if(test<=0){
            idTest = true;
        }
        return idTest;
    }

    public User findUserById(String id){
        User user = new User();
        user = userRepository.findUserById(id);

        return user;
    }

    public User findUserByEmailPhone(String email, String phonenumber){
        return userRepository.findUserByEmailPhone(email,phonenumber);
    }

}
