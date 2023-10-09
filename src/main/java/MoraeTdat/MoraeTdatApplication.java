package MoraeTdat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "MoraeTdat.data.Repository")
public class MoraeTdatApplication {

	public static void main(String[] args) {
		SpringApplication.run(MoraeTdatApplication.class, args);
	}

}
