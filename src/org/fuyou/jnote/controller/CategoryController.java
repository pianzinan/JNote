package org.fuyou.jnote.controller;

import java.util.ArrayList;
import java.util.List;

import org.fuyou.jnote.bean.Constants;
import org.fuyou.jnote.model.Article;

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
public class CategoryController extends BaseController
{
	public static final String ROUTE = "/";
	
	public void category()
	{
		int cid = getParaToInt(0,0);
		int page = getParaToInt(1,1);
		
		List<Object> params = new ArrayList<Object>();
		
		StringBuffer select = new StringBuffer("select * ");
		StringBuffer from = new StringBuffer("from ");
		from.append(Article.TABLE_NAME).append(" ");
		from.append(" where ");
		from.append(" 1=1 ");
		
		if(cid > 0 )
		{
			from.append(" and ").append(Article.COL_CATEGORY_ID).append("=? ");
			params.add(cid);
		}

		
		from.append(" and ").append(Article.COL_STATUS).append("=? ");
		params.add(Article.STATUS_PUBLISH);
		
		from.append(" order by ");
		from.append(Article.COL_POST_TIME).append(" desc ");
		
		
		Page<Article> pages = Article.dao.paginate(page, Constants.pageSize,select.toString(), from.toString(),params.toArray());
		setAttr("page", pages);
		setAttr("categoryId", cid);
		render("/index.html");
	}
	
	public void index()
	{
		category();
	}
	


	public static String categoryName(Integer id)
	{
		return categorysName.get(id);
	}
}
