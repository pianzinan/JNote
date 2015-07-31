package org.fuyou.jnote.controller;

import java.util.ArrayList;
import java.util.Date;
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
	
	public void postArticle()
	{
		if(!isLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		
		boolean draft = getParaToBoolean("draft", false);
		Integer id = getParaToInt("id",null);
		String title = getPara("title", null);
		String tags = getPara("tags", "");
		String captcha = getPara("captcha", "");
		int categoryId = getParaToInt("categoryId", 0);

		int editor = getParaToInt("editor", -1);
		

		String content = null;
		if(editor == Article.CONTENT_TYPE_MARKDOWN)
		{
			content = getPara("markdown", null);
			
		}else if(editor == Article.CONTENT_TYPE_UMEDITOR)
		{
			content = getPara("umeditor", null);
		}
		


		Article article = null;
		
		if(id != null)
		{
			article = Article.dao.findById(id);
			
		}else
		{
			article = new Article();
		}
		
		article.set(Article.COL_CONTENT_TYPE, editor);
		article.set(Article.COL_CONTENT, content);
		article.set(Article.COL_CATEGORY_ID, categoryId);
		article.set(Article.COL_TITLE, title);
		article.set(Article.COL_POST_TIME, new Date());
		article.set(Article.COL_TAGS, tags);
		article.set(Article.COL_STATUS, Article.STATUS_PUBLISH);
		
		if(draft)
		{
			article.set(Article.COL_STATUS, Article.STATUS_DRAFT);
		}
		
		setAttr("article", article);
		
		getPara("content", null);
		
		if(StringUtils.isEmptyOrNull(title))
		{
			setError("Please input title");
			
		}else if(title.length()>256)
		{
			setError("Title max length 256");
			
		}else if(categoryId<=0)
		{
			setError("No category");
			
		}else if(StringUtils.isEmptyOrNull(tags))
		{
			setError("Please input tags,split by ,");
			
		}else if(StringUtils.isEmptyOrNull(content))
		{
			setError("Please write something");
			
		}else if(editor!=Article.CONTENT_TYPE_MARKDOWN && editor!=Article.CONTENT_TYPE_UMEDITOR)
		{
			setError("Please select a editor");
			
		}else if(!validateCaptcha(captcha))
		{
			setError("captcha error");
			
		}else
		{
			
			if(id == null)
			{
				if(article.save())
				{//新建
			        
			        if(!draft)
			        {//新建的话清除数据
			        	removeAttr("article");
				        setSuccess("Publish success");
				        
			        }else
			        {
				        setSuccess("Save draft success");
			        }
					
				}else
				{
					setError("Save error");
				}
				
			}else if(id != null)
			{
				if(article.update())
				{//更新
			        
			        if(!draft)
			        {//新建的话清除数据
			        	removeAttr("article");
				        setSuccess("Update and publish success");
				        
			        }else
			        {
				        setSuccess("Save draft success");
			        }
					
				}else
				{
					setError("Save error");
				}
		        
			}
		}
		
		render("/admin/article_new.html");
	}
	
	public void updateArticle()
	{
		if(!isLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		int id = getParaToInt("id", -1);
		
		Article article = Article.dao.findById(id);
		setAttr("article", article);
		render("/admin/article_new.html");
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
			from.append(Article.COL_TITLE).append(" like ? or ");
			from.append(Article.COL_CONTENT).append(" like ? ");
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
