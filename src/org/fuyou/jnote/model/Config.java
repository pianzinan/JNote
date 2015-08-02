package org.fuyou.jnote.model;

import com.jfinal.plugin.activerecord.Model;

public class Config extends Model<Config>
{
	private static final long serialVersionUID = 1L;
	
	public static final Config dao = new Config();
	
	public static final String TABLE_NAME = "t_config";
	
	public static final String COL_KEY = "key";
	public static final String COL_VALUE = "value";
	
	public static void saveValue(String key,String value)
	{
		Config config = dao.findById(key);
		
		if(config == null)
		{
			config = new Config();
			config.set(COL_KEY, key);
			config.set(COL_VALUE, value);
			config.save();
			
		}else
		{
			config.set(COL_VALUE, value);
			config.update();
		}
		
	}
	
	public static String loadValue(String key)
	{
		Config config = dao.findById(key);
		
		if(config == null)
		{
			return null;
		}
		
		return config.getStr(COL_VALUE);
	}

}
