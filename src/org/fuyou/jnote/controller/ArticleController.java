package org.fuyou.jnote.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.fuyou.jnote.bean.Constants;
import org.fuyou.jnote.model.Article;
import org.fuyou.jnote.model.Comment;

import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Page;

/**   
 * @Title: ArticleController.java 
 * @Package org.fuyou.jnote.controller 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Wild Coder
 * @email 1023400273@qq.com 
 * @date 2015年7月29日 下午12:31:18 
 * @version V1.0   
 */
public class ArticleController extends BaseController
{
	private static final Logger logger = Logger.getLogger(ArticleController.class);
	public static final String ROUTE = "/article";
	
	
	public void comment()
	{
		int article_id = getParaToInt("article_id", 0);
		String name = getPara("name", "anonymous").trim();
		String contact = getPara("contact", "").trim();
		String captcha = getPara("captcha", "").trim();
		String message = getPara("message", "").trim();
		
		Article article = Article.dao.findById(article_id);
		
		if(article_id<=0 || article == null)
		{
			setAttr("error", "error");
			setAttr("name", name);
			setAttr("contact", contact);
			setAttr("message", message);
			
		}else if(message == null || message.length()<=0)
		{
			setAttr("error", "Please input message");
			setAttr("name", name);
			setAttr("contact", contact);
			setAttr("message", message);
			
		}else if(message.length()>1024)
		{
			setAttr("error", "message max length is 1024");
			setAttr("name", name);
			setAttr("contact", contact);
			setAttr("message", message);
			
		}else if(name!=null && name.length()>64)
		{
			setAttr("error", "name max length is 64");
			setAttr("name", name);
			setAttr("contact", contact);
			setAttr("message", message);
			
		}else if(contact!=null && contact.length()>64)
		{
			setAttr("error", "contact max length is 64");
			setAttr("name", name);
			setAttr("contact", contact);
			setAttr("message", message);
			
		}else if(!validateCaptcha(captcha))
		{
			setAttr("error", "Captcha error");
			setAttr("name", name);
			setAttr("contact", contact);
			setAttr("message", message);
			
		}else
		{
			Comment comment = new Comment();
			comment.set(Comment.COL_ARTICLE_ID, article_id);
			comment.set(Comment.COL_CONTACT, contact);
			comment.set(Comment.COL_MESSAGE, message);
			comment.set(Comment.COL_POST_TIME, new Date());
			comment.set(Comment.COL_USERNAME, name);
			
			if(comment.save())
			{
				setAttr("success", "success");
			}
			
		}
		
		renderPage(article_id, 1);
	}
	
	private void renderPage(int id,int commentPage)
	{
		Article article = Article.dao.findById(id);
		
		if(article == null)
		{
			logger.info("article id "+id+" not found");
			renderError(404);
			return;
		}
		
		if(article.getInt(Article.COL_STATUS)!=Article.STATUS_PUBLISH && !isAdminLogin())
		{//不是发布状态且又是非管理员
			logger.info("article id "+id+" not found");
			renderError(404);
			return;
		}
		
		List<Object> params = new ArrayList<Object>();
		
		StringBuffer select = new StringBuffer("select * ");
		StringBuffer from = new StringBuffer("from ");
		from.append(Comment.TABLE_NAME).append(" ");
		from.append(" where ");
		from.append(" 1=1 ");
		
		from.append(" and ").append(Comment.COL_ARTICLE_ID).append("=? ");
		params.add(id);

		from.append(" order by ");
		from.append(Comment.COL_POST_TIME).append(" asc ");
		
		
		Page<Comment> pages = Comment.dao.paginate(commentPage, Constants.pageSize,select.toString(), from.toString(),params.toArray());
		setAttr("page", pages);
		
		setAttr("articleId", id);
		setAttr("article", article);
		render("/article.html");
	}
	
	
	public void index()
	{
		int id = getParaToInt(0, -1);
		int page = getParaToInt(1, 1);
		renderPage(id, page);
	}
}
