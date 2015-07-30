package org.fuyou.jnote.controller;

import java.util.ArrayList;
import java.util.List;

import org.fuyou.jnote.bean.Constants;
import org.fuyou.jnote.bean.User;
import org.fuyou.jnote.model.Article;
import org.fuyou.jnote.model.Comment;
import org.fuyou.jnote.util.StringUtils;

import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

public class AdminController extends BaseController
{
	private static final Logger logger = Logger.getLogger(AdminController.class);
	public static final String ROUTE = "/admin";
	
	public void createArticle()
	{
		if(!isLogin())
		{
			redirect("/admin/login");
			return;
		}

		String type = getPara("type", null);
		
		if(StringUtils.isEmptyOrNull(type))
		{
			render("/admin/article_new.html");
			return;
		}
	}
	
	public void deleteArticle()
	{
		if(!isLogin())
		{
			redirect("/admin/login");
			return;
		}

		int aid = getParaToInt("id", 0);
		
		boolean  ret = Article.dao.deleteById(aid);
		if(ret)
		{
			Db.update("delete from "+Comment.TABLE_NAME+" where "+Comment.COL_ARTICLE_ID+"=?", aid);
			
		}else
		{
			setAttr("error", "delete faild");
		}
		
		articles();
	}
	
	public void articles()
	{
		if(!isLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		int categoryId = getParaToInt("categoryId", 0);
		String keywords = getPara("keywords", null);
		int pageNumber = getParaToInt("page", 1);
		int pageSize = getParaToInt("pageSize", Constants.pageSize);

		setAttr("categoryId", categoryId);
		setAttr("keywords", keywords);
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		
		List<Object> params = new ArrayList<Object>();
		
		StringBuffer select = new StringBuffer("select * ");
		StringBuffer from = new StringBuffer("from ");
		from.append(Article.TABLE_NAME).append(" ");
		from.append(" where ");
		from.append(" 1=1 ");
		
		if(categoryId > 0 )
		{
			from.append(" and ").append(Article.COL_CATEGORY_ID).append("=? ");
			params.add(categoryId);
		}
		
		if(!StringUtils.isEmptyOrNull(keywords))
		{

			from.append(" and (");
			from.append(Article.COL_NAME).append(" like ? or ");
			from.append(Article.COL_HTML).append(" like ? ");
			from.append(" ) ");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
		}
		
		from.append(" order by ");
		from.append(Article.COL_POST_TIME).append(" desc ");
		
		
		Page<Article> page = Article.dao.paginate(pageNumber, pageSize,select.toString(), from.toString(),params.toArray());
		
		setAttr("page", page);
		render("/admin/articles.html");
	}
	
	
	public void index()
	{
		if(!isLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		render("/admin/starter.html");
	}

	private boolean isLogin()
	{
		return true;// getSession().getAttribute("user") != null;
	}
	

	public void logout()
	{
		getSession().removeAttribute("user");
		redirect("/admin/login");
	}
	
	public void login()
	{
		String username = getPara("username", "");
		String password = getPara("password", "");
		String captcha = getPara("captcha", "");

		setAttr("username", username);
		
		
		if(StringUtils.isEmptyOrNull(username) && StringUtils.isEmptyOrNull(password))
		{
			
		}else if(StringUtils.isEmptyOrNull(username))
		{
			setAttr("error", "Please input username");
			
		}else if(StringUtils.isEmptyOrNull(password))
		{
			setAttr("error", "Please input password");
			
		}else if(StringUtils.isEmptyOrNull(captcha))
		{
			setAttr("error", "Please input captcha");
			
		}else if(!validateCaptcha(captcha))
		{
			setAttr("error", "captcha error");
			
		}else
		{
			if(username.equals(Constants.username) && password.equals(Constants.password))
			{
				User user = new User();
				user.setUsername(username);
				user.setPassword(password);
				getSession().setAttribute("user", user);
				redirect("/admin");
				return;
				
			}else
			{
				setAttr("error", "username or password error");
				
			}
		}
		
		render("/admin/login.html");
	}
}
