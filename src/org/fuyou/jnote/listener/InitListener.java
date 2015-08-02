package org.fuyou.jnote.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.fuyou.jnote.util.FileUtils;
import org.fuyou.jnote.util.StringUtils;

public class InitListener implements ServletContextListener
{
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent contextEvent)
	{
	}

	@Override
	public void contextInitialized(ServletContextEvent contextEvent)
	{
		System.out.println("contextInitialized");
		Properties properties = new Properties();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;

		try
		{
			properties.load(getClass().getResourceAsStream("/app_config.txt"));
			String db_url = properties.getProperty("db_url");
			String db_user = properties.getProperty("db_user");
			String db_pwd = properties.getProperty("db_pwd");

			conn = DriverManager.getConnection(db_url, db_user, db_pwd);
			st = conn.createStatement();
			rs = st.executeQuery("show tables");

			Set<String> tables = new HashSet<String>();

			while (rs.next())
			{
				tables.add(rs.getString(1));
			}
			
			if (tables.size() == 0)
			{// 表结构不完整
				String []sqls = FileUtils.loadString(getClass().getResourceAsStream("/jnote.sql"), "UTF-8").split(";");
				for(String sql:sqls)
				{
					if(!StringUtils.isEmptyOrNull(sql))
					{
						System.out.println(sql);
						st.addBatch(sql);
					}
				}
				
				st.executeBatch();

			} else if (tables.size() != 4)
			{
				System.err
						.println("Database tables are incorrect,you must delete all table and setup again!");
			}

		} catch (Exception e)
		{
			e.printStackTrace();

		} finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (st != null)
			{
				try
				{
					st.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			if (conn != null)
			{
				try
				{
					conn.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
	}

	public static void main(String[] args)
	{
		new InitListener().contextInitialized(null);
	}
}
