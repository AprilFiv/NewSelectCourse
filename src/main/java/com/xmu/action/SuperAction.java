
package com.xmu.action;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 所有ACTION类的父类，方便使用request,response
 *
 */
public class SuperAction extends ActionSupport implements ServletResponseAware ,ServletRequestAware,ServletContextAware{
	
  private static final long  serialVersionUID = 1L;
  protected HttpServletRequest request;
  protected HttpServletResponse response;
  protected HttpSession session;
  protected ServletContext application;
  
	public void setServletContext(ServletContext application)
  {
		this.application = application;
  }

  public void setServletResponse(HttpServletResponse response)
  {
	  
	  this.response = response;
  }
  
  public void setServletRequest(HttpServletRequest request)
  {
	  this.request = request ;
      this.session = this.request.getSession();
  }



}
