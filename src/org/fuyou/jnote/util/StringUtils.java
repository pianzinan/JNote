package org.fuyou.jnote.util;

import org.apache.commons.lang.StringEscapeUtils;
import org.fuyou.jnote.controller.ArticleController;
import org.pegdown.PegDownProcessor;

import com.jfinal.log.Logger;

public class StringUtils
{
	private static final Logger logger = Logger.getLogger(ArticleController.class);
	
	public static String markdown2HTML(String markdown)
	{
		if(isEmptyOrNull(markdown))
		{
			return "";
		}
		
		return new PegDownProcessor().markdownToHtml(markdown);
	}
	
	public static boolean isEmptyOrNull(String txt)
	{
		return txt == null || txt.trim().length()<=0;
	}
	
	public static String unescapeHtml(String text)
	{
		if (text == null)
		{
			return "";
		}
		
		logger.info(text);
		text = StringEscapeUtils.unescapeHtml(text);
		logger.info(text);
		return text;
	}

	public static String escapeHtml(String text)
	{
		if (text == null)
		{
			return "";
		}

		logger.info(text);
		text = StringEscapeUtils.escapeHtml(text);
		logger.info(text);

		return text;
	}
}
