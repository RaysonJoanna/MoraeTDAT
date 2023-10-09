package MoraeTdat.data.Repository;

import MoraeTdat.data.Entity.Heart;
import org.graalvm.compiler.nodes.calc.IntegerTestNode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface HeartRepository extends JpaRepository<Heart, Integer>{

    @Query(value = "SELECT * from heart where userid=?", nativeQuery = true)
    List<Heart> getHeartList(String userid);

    @Transactional
    @Modifying
    @Query(value="DELETE from heart where userid=?", nativeQuery = true)
    void deleteAll(String userid);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM heart WHERE productnum =? and userid=?", nativeQuery = true)
    void deletePart(int number, String userid);


}
