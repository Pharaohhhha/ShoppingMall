package logintest;

import com.dio.guimei.dao.wt_dao.AdminDao;
import com.dio.guimei.vo.wt.Admin;
import org.junit.Before;
import org.junit.Test;

/**
 * @author 王涛
 * @Created by WT on 2018/8/31.
 */
public class AdminDaoTest {
    AdminDao dao = null;

    @Before
    public void setUp() throws Exception {
        this.dao = new AdminDao();
    }
//    @Test
//    public void testLogin(){
//        System.out.println(dao.login(new Admin(null,"Johnson","11111a")));
//    }

}
