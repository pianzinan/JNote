package org.fuyou.jnote.util;

import org.apache.commons.lang.StringEscapeUtils;
import org.pegdown.PegDownProcessor;

public class StringUtils
{
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
		
		text = StringEscapeUtils.unescapeHtml(text);
		return text;
	}

	public static String escapeHtml(String text)
	{
		if (text == null)
		{
			return "";
		}

		text = StringEscapeUtils.escapeHtml(text);

		return text;
	}

}
