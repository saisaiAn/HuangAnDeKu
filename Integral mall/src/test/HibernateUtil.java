package test;



import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;

public class HibernateUtil {
	private static Configuration configuration;
	private static SessionFactory sessionFactory;
	static {
		try {
			configuration=new Configuration().configure();
			sessionFactory=configuration.buildSessionFactory();
		} catch (HibernateException e) {
			System.out.println("Util异常");
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
	}
	private HibernateUtil() {}
	public static Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	public static Session openSession() {
		return sessionFactory.openSession();
	}
	
}	
