package org.fuyou.jnote.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.fuyou.jnote.bean.Constants;
import org.fuyou.jnote.bean.User;
import org.fuyou.jnote.model.Article;
import org.fuyou.jnote.model.Category;
import org.fuyou.jnote.model.Comment;
import org.fuyou.jnote.model.Config;
import org.fuyou.jnote.util.StringUtils;

import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

public class AdminController extends BaseController
{
	private static final Logger logger = Logger.getLogger(AdminController.class);
	public static final String ROUTE = "/admin";
	
	private static final int MENU_ARTICLE = 1;
	private static final int MENU_COMMENTS = 2;
	private static final int MENU_SETTING = 3;
	private static final int MENU_CATEGORYS = 4;
	
	
	public void settings()
	{
		setMenu(MENU_SETTING);
		
		if(isParaExists("key"))
		{
			
			String key = getPara("key");
			if("password".equalsIgnoreCase(key))
			{
				updatePasswod();
				
				
			}else if("settings".equalsIgnoreCase(key))
			{
				updateSettings();
			}
			
			setAttr("key", key);
		}
		
		refreshSettings();
		render("/admin/settings.html");
	}
	
	
	private void updateSettings()
	{
		Config.saveValue("note_name", getPara("note_name"));
		Config.saveValue("meta_keywords", getPara("meta_keywords"));
		Config.saveValue("meta_description", getPara("meta_description"));
		Config.saveValue("html_head", getPara("html_head"));
		Config.saveValue("domain", getPara("domain"));
		setSuccess("Update success");
	}
	
	private void updatePasswod()
	{
		String oldPassword = getPara("oldPassword");
		String password = getPara("password");
		String password2 = getPara("password2");
		
		if(StringUtils.isEmptyOrNull(oldPassword))
		{
			setError("Please input old password");
			
		}else if(StringUtils.isEmptyOrNull(password))
		{
			setError("Please input new password");
			
		}else if(StringUtils.isEmptyOrNull(password2))
		{
			setError("Please input new password again");
			
		}else if(!password2.equals(password))
		{
			setError("Two times the new password is not consistent");
			
		}else
		{
			String oldP = Config.loadValue("password");
			if(oldPassword.equals(oldP))
			{
				Config.saveValue("password", oldP);
				setSuccess("Change password success");
				
			}else
			{
				setError("Old password error");
			}
		}
		
	}
	
	public void postArticle()
	{
		if(!isAdminLogin())
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
		

		if(!isParaExists("editor"))
		{
			render("/admin/article_new.html");
			return;
		}
		
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
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		int id = getParaToInt("id", -1);
		
		Article article = Article.dao.findById(id);
		setAttr("article", article);
		render("/admin/article_new.html");
	}

	
	public void updateCategory()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		int id = getParaToInt("id", -1);
		
		Category category = Category.dao.findById(id);
		setAttr("category", category);
		render("/admin/category_new.html");
	}
	

	
	public void postCategory()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		
		Integer id = getParaToInt("id",null);
		String name = getPara("name", null);
		String captcha = getPara("captcha", null);

		Category category = null;
		
		if(id != null)
		{
			category = Category.dao.findById(id);
			
		}else
		{
			category = new Category();
		}
		
		setAttr("category", category);
		
		if(!isParaExists("id") || !isParaExists("name") || !isParaExists("captcha"))
		{
			render("/admin/category_new.html");
			return;
		}

		if(StringUtils.isEmptyOrNull(name))
		{
			setError("Please input name");
			
		}else if(!validateCaptcha(captcha))
		{
			setError("captcha error");
			
		}else
		{
			category.set(Category.COL_NAME, name);
			
			if(id == null)
			{
				if(category.save())
				{//新建
					categorys();
					return;
					
				}else
				{
					setError("Save error");
				}
				
			}else if(id != null)
			{
				if(category.update())
				{//更新
					categorys();
					return;
					
				}else
				{
					setError("Save error");
				}
			}
		}
		
		render("/admin/category_new.html");
	}
	
	public void deleteArticle()
	{
		if(!isAdminLogin())
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
	
	
	
	
	public void categorys()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}
		setMenu(MENU_CATEGORYS);
		getCategorys(true);
		render("/admin/categorys.html");
	}
	
	public void articles()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		setMenu(MENU_ARTICLE);
		
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
		from.append(Article.COL_ID).append(" desc ");
		
		
		Page<Article> page = Article.dao.paginate(pageNumber, pageSize,select.toString(), from.toString(),params.toArray());
		
		setAttr("page", page);
		render("/admin/articles.html");
	}


	
	public void deleteComment()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}

		int aid = getParaToInt("id", 0);
		
		boolean  ret = Comment.dao.deleteById(aid);
		if(!ret)
		{
			setAttr("error", "delete faild");
		}
		
		comments();
	}

	/**
	 * 删除分类
	 */
	public void deleteCategory()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}

		int aid = getParaToInt("id", 0);
		
		boolean  ret = Category.dao.deleteById(aid);
		if(!ret)
		{
			setAttr("error", "delete faild");
		}
		
		categorys();
	}
	
	public void comments()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}
		setMenu(MENU_COMMENTS);
		
		Integer aid = getParaToInt("aid", null);
		String keywords = getPara("keywords", null);
		int pageNumber = getParaToInt("page", 1);
		int pageSize = getParaToInt("pageSize", Constants.pageSize);

		setAttr("aid", aid);
		setAttr("keywords", keywords);
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		
		List<Object> params = new ArrayList<Object>();
		
		StringBuffer select = new StringBuffer("select "+Comment.TABLE_NAME+".*,");
		select.append(Article.TABLE_NAME).append(".").append(Article.COL_TITLE).append(" ");
		StringBuffer from = new StringBuffer("from ");
		from.append(Comment.TABLE_NAME).append(" INNER JOIN ");
		from.append(Article.TABLE_NAME).append(" on ");
		from.append(Article.TABLE_NAME).append(".").append(Article.COL_ID).append(" = ");
		from.append(Comment.TABLE_NAME).append(".").append(Comment.COL_ARTICLE_ID).append(" ");
		from.append(" where ");
		from.append(" 1=1 ");
		
		if(aid != null )
		{
			from.append(" and ").append(Comment.COL_ARTICLE_ID).append("=? ");
			params.add(aid);
		}
		
		if(!StringUtils.isEmptyOrNull(keywords))
		{

			from.append(" and (");
			from.append(Comment.COL_CONTACT).append(" like ? or ");
			from.append(Comment.COL_MESSAGE).append(" like ? or ");
			from.append(Comment.COL_USERNAME).append(" like ? ");
			from.append(" ) ");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
		}
		
		from.append(" order by ");
		from.append(Comment.COL_ID).append(" desc ");
		
		
		Page<Comment> page = Comment.dao.paginate(pageNumber, pageSize,select.toString(), from.toString(),params.toArray());
		
		setAttr("page", page);
		render("/admin/comments.html");
	}
	
	
	public void index()
	{
		if(!isAdminLogin())
		{
			redirect("/admin/login");
			return;
		}
		
		render("/admin/starter.html");
	}

	public void logout()
	{
		getSession().removeAttribute("user");
		redirect("/admin/login");
	}
	
	public void login()
	{
		String password = getPara("password", "");
		String captcha = getPara("captcha", "");

		
		if(StringUtils.isEmptyOrNull(password))
		{
			
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
			if(password.equals(Config.loadValue("password")))
			{
				User user = new User();
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
	
	
	private void setMenu(int m)
	{
		setAttr("menuId", m);
	}
}
