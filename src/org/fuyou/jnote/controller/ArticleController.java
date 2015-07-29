package org.fuyou.jnote.controller;

import java.util.ArrayList;
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
		renderNull();
	}
	
	
	public void index()
	{
		int id = getParaToInt(0, -1);
		int page = getParaToInt(1, 1);
		Article article = Article.dao.findById(id);
		
		if(article == null)
		{
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
		
		
		Page<Comment> pages = Comment.dao.paginate(page, Constants.pageSize,select.toString(), from.toString(),params.toArray());
		setAttr("page", pages);
		
		setAttr("articleId", id);
		setAttr("article", article);
		render("/article.html");
	}
}
