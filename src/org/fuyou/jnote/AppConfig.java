package org.fuyou.jnote;

import org.beetl.ext.jfinal.BeetlRenderFactory;
import org.fuyou.jnote.controller.ArticleController;
import org.fuyou.jnote.controller.CategoryController;
import org.fuyou.jnote.model.Article;
import org.fuyou.jnote.model.Category;
import org.fuyou.jnote.model.Comment;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;

/**   
 * @Title: AppConfig.java 
 * @Package org.fuyou.jnote 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Wild Coder
 * @email 1023400273@qq.com 
 * @date 2015年7月29日 上午11:45:40 
 * @version V1.0   
 */
public class AppConfig extends JFinalConfig
{
	private static final Logger logger = Logger.getLogger(AppConfig.class);

	public void configConstant(Constants me)
	{
		loadPropertyFile("app_config.txt");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setMainRenderFactory(new BeetlRenderFactory());
		
		org.fuyou.jnote.bean.Constants.db_url = getProperty("db_url");
		org.fuyou.jnote.bean.Constants.db_user = getProperty("db_user");
		org.fuyou.jnote.bean.Constants.db_pwd = getProperty("db_pwd");
		org.fuyou.jnote.bean.Constants.charset = getProperty("charset");
		org.fuyou.jnote.bean.Constants.contextPath = getProperty("contextPath");
		org.fuyou.jnote.bean.Constants.pageSize = getPropertyToInt("pageSize",20);
		
		logger.info("db_url = "+org.fuyou.jnote.bean.Constants.db_url);
		logger.info("db_user = "+org.fuyou.jnote.bean.Constants.db_user);
		logger.info("db_pwd = "+org.fuyou.jnote.bean.Constants.db_pwd);
		logger.info("charset = "+org.fuyou.jnote.bean.Constants.charset);
		logger.info("pageSize = "+org.fuyou.jnote.bean.Constants.pageSize);
		logger.info("contextPath = "+org.fuyou.jnote.bean.Constants.contextPath);

	}

	public void configHandler(Handlers arg0)
	{

	}

	public void configInterceptor(Interceptors arg0)
	{

	}

	public void configPlugin(Plugins me)
	{
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(org.fuyou.jnote.bean.Constants.db_url, org.fuyou.jnote.bean.Constants.db_user, org.fuyou.jnote.bean.Constants.db_pwd);
		me.add(c3p0Plugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		arp.setShowSql(getPropertyToBoolean("showSql"));
		arp.addMapping(Category.TABLE_NAME, Category.class);
		arp.addMapping(Article.TABLE_NAME, Article.class);
		arp.addMapping(Comment.TABLE_NAME, Comment.class);
		me.add(arp);
	}

	public void configRoute(Routes me)
	{
		me.add(ArticleController.ROUTE, ArticleController.class);
		me.add(CategoryController.ROUTE, CategoryController.class);
	}

}
