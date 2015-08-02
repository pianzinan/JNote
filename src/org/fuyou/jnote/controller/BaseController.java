package org.fuyou.jnote.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.fuyou.jnote.bean.Constants;
import org.fuyou.jnote.model.Category;
import org.fuyou.jnote.model.Config;
import org.fuyou.jnote.util.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.ext.render.CaptchaRender;
import com.jfinal.log.Logger;

/**
 * @Title: BaseController.java
 * @Package org.fuyou.jnote.controller
 * @Description: TODO(用一句话描述该文件做什么)
 * @author Wild Coder
 * @email 1023400273@qq.com
 * @date 2015年7月29日 下午12:39:15
 * @version V1.0
 */
public class BaseController extends Controller
{
	private static final Logger logger = Logger.getLogger(BaseController.class);
	private static List<Category> categorys = new ArrayList<Category>();
	protected static Map<Integer, String> categorysName = new HashMap<Integer, String>();
	protected static Map<String, String> settings = new HashMap<String, String>();
	
	
	
	/**
	 * 随机码生成字典
	 */
	private static final String randomKey = "randomKey";
	public void captcha()
	{
		CaptchaRender img = new CaptchaRender(randomKey);
		render(img);

	}
	
	/**
	 * 校验验证码
	 * @param code
	 * @return
	 */
	protected boolean validateCaptcha(String code)
	{
		if(code == null)
		{
			return false;
		}
		return CaptchaRender.validate(this, code.toUpperCase(), randomKey);
	}
	
	protected void fetchParams()
	{
		Enumeration<String> names = getParaNames();
        Map<String, Object> params = new HashMap<String, Object>();
        while(names.hasMoreElements())
        {
            String key = names.nextElement();
            params.put(key,getPara(key));
        }
		
		if(settings.size()<=0)
		{
			refreshSettings();
		}

		String domain = settings.get("domain");
		
		if(!StringUtils.isEmptyOrNull(domain) && !isAdminLogin())
		{
			setAttr("ctx", "http://"+domain);
			
		}else
		{
			setAttr("ctx", getRequest().getContextPath());
			
		}
		
        setAttr("params", params);
		setAttr("categorys", getCategorys(false));
		setAttr("settings", settings);
	}

	@Override
	public void render(String view)
	{
		fetchParams();
		super.render("/WEB-INF/views" + view);
	}
	
	protected void setError(String error)
	{
		setAttr("error", error);
	}

	
	protected void setSuccess(String success)
	{
		setAttr("success", success);
	}

	public static List<Category> getCategorys(boolean forceRefresh)
	{
		if (categorys.size() > 0 && !forceRefresh)
		{
			return categorys;
		}

		categorys = Category.dao.find("select * from " + Category.TABLE_NAME);
		
		categorysName.clear();
		
		for(Category category:categorys)
		{
			categorysName.put(category.getInt(Category.COL_ID), category.getStr(Category.COL_NAME));
		}
		
		return categorys;
	}


	protected boolean isAdminLogin()
	{
		return  getSession().getAttribute("user") != null;
	}
	
	
	protected void refreshSettings()
	{
		settings.clear();

		settings.put("note_name", Config.loadValue("note_name"));
		settings.put("domain", Config.loadValue("domain"));
		settings.put("meta_keywords", Config.loadValue("meta_keywords"));
		settings.put("meta_description", Config.loadValue("meta_description"));
		settings.put("html_head", Config.loadValue("html_head"));
	}
	
	public void setHtmlTitle(String html_title)
	{
		html_title = StringUtils.escapeHtml(html_title);
		setAttr("html_title", html_title);
	}
	
	public void setHtmlKeywords(String html_keywords)
	{
		html_keywords = StringUtils.escapeHtml(html_keywords);
		setAttr("html_keywords", html_keywords);
	}
	
	public void setHtmlDescription(String html_description)
	{
		if(html_description.length()>100)
		{
			html_description = StringUtils.escapeHtml(html_description.substring(0, 100));
			
		}else
		{
			html_description = StringUtils.escapeHtml(html_description);
			
		}
		setAttr("html_description", html_description);
	}
	
}
