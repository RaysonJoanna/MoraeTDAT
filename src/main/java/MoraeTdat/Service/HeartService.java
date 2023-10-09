package MoraeTdat.Service;

import MoraeTdat.data.Entity.Heart;
import MoraeTdat.data.Repository.HeartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class HeartService {

    private final HeartRepository heartRepository;

    @Autowired
    public HeartService(HeartRepository heartRepository) {
        this.heartRepository = heartRepository;
    }

    public List<Heart> getHeartList(String userid){
        List<Heart> heartList = new ArrayList<>();

        heartList = heartRepository.getHeartList(userid);
        return heartList;
    }

    public void deleteAll(String userid){
        heartRepository.deleteAll(userid);
    }

    public void deletePart(int number, String userid){
        heartRepository.deletePart(number, userid);
    }



}
