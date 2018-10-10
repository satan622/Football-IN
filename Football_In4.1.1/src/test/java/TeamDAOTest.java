import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.TeamVO;
import com.spring.persistence.TeamDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class TeamDAOTest {
	@Inject
	private TeamDAO dao;
	
	@Test
	public void testCreate() throws Exception{
		TeamVO team = new TeamVO();
		team.setMid("teamid");
		team.setTeamname("team이름");
		team.setLocation("서울");
		dao.create(team);
	}
}
