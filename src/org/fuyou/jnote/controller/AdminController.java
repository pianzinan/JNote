package org.fuyou.jnote.controller;

import com.jfinal.log.Logger;

public class AdminController extends BaseController
{
	private static final Logger logger = Logger.getLogger(AdminController.class);
	public static final String ROUTE = "/admin";

	public void index()
	{
		render("/admin/starter.html");
	}
}
