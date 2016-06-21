package com.huangtl.framework.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.huangtl.framework.bean.RequestDataBean;
import com.huangtl.framework.bean.ResponseDataBean;
import com.huangtl.framework.utils.SpringContextUtil;

/**
 * 描述： 请求统一入口
 * 创建人:黄廷柳 
 * 创建日期：2016年1月27日 上午11:20:22
 **/
@Controller
@RequestMapping("/base")
public class BaseController {

	private static final Logger log = Logger.getLogger(BaseController.class);
	
	/**
	 * 
	 * TODO 前台请求调用方法，拥有跳转页面，可能有传值
	 * 作者：黄廷柳
	 * 2016年1月27日下午3:12:41
	 */
	@RequestMapping(value = "/{service}/{method}")
	public String base(@PathVariable String service,@PathVariable String method, HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception{

		
		Object bean = null;
		Method m = null;
		
		//封装requestDataBean
		RequestDataBean requestDataBean = new RequestDataBean(request, response);
		
		//通过上下文获取实例bean,前台访问/base/login/toLogin,则访问loginService的toLogin方法
		try {
			bean = SpringContextUtil.getBean(service+"Service");
		} catch (NoClassDefFoundError e) {
			// TODO: handle exception
			log.error("访问："+service+"/"+method+"......."+service+"Service不存在");
			return "error404";
		} catch (Exception e) {
			// TODO: handle exception
			log.error("访问："+service+"/"+method+"出现异常!");
			return "error404";
		}
		
		//获取实例class
		Class<?> c = bean.getClass();
		//根据方法名与参数获取实例方法，可能抛出NoSuchMethodException
		try {
			m = c.getDeclaredMethod(method,RequestDataBean.class);
		} catch (NoSuchMethodException e) {
			// TODO: handle exception
			log.error("访问："+service+"/"+method+"......."+service+"Service中"+method+"方法不存在");
			return "error404";
		}
		
		//执行实例方法，放回封装bean
		ResponseDataBean responseDataBean = (ResponseDataBean) m.invoke(bean,requestDataBean);
		//保存返回值，前台可以获取
		model.addAttribute("responseDataBean",responseDataBean);
		
		//返回跳转页
		return responseDataBean.getPage(); 
		
//		有两种方式向前台传值（参数为map返回ModelAndView）,这里不推荐参数用Map的这种方式
		//第一种
//		model.put("list", list);
//		ModelAndView mav = new ModelAndView("login", model);
//		return mav;
		//第二种
//		本方法有Model model参数
//		直接model.addAttribute("list", list);
//		return String类型表示返回页面目录
		
		
		//相应service配置RequestMapping时可通过下方访问，但是多次一举，因为可以直接访问
//		System.out.println("base..."+"forward:/"+service+"/"+method);
//		request.setAttribute("requestPath", service);
//		return "forward:/"+service+"/"+method;
	}
	
	
	/**
	 * TODO ajax请求统一调用接口
	 * 作者：黄廷柳
	 * 2016年1月27日下午5:04:10
	 */
	@RequestMapping(value = "/ajax/{service}/{method}")
	public @ResponseBody Object ajax(@PathVariable String service,@PathVariable String method, HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception{
		
		Object bean = null;
		Method m = null;
		
		//封装requestDataBean
		RequestDataBean requestDataBean = new RequestDataBean(request, response);
		
		//通过上下文获取实例bean,前台访问/base/login/toLogin,则访问loginService的toLogin方法
		try {
			bean = SpringContextUtil.getBean(service+"Service");
		} catch (NoClassDefFoundError e) {
			// TODO: handle exception
			log.error("访问："+service+"/"+method+"......."+service+"Service不存在");
			return RequestDataBean.NOTFOUND;
		} catch (Exception e) {
			// TODO: handle exception
			log.error("ajax访问："+service+"/"+method+"出现异常!");
			return RequestDataBean.NOTFOUND;
		}
		
		//获取实例class
		Class<?> c = bean.getClass();
		//根据方法名与参数获取实例方法，可能抛出NoSuchMethodException
		try {
			m = c.getDeclaredMethod(method,RequestDataBean.class);
		} catch (NoSuchMethodException e) {
			// TODO: handle exception
			log.error("访问："+service+"/"+method+"......."+service+"Service中"+method+"方法不存在");
			return RequestDataBean.NOTFOUND;
		}
		//返回实例执行返回值存入封装bean
		ResponseDataBean responseDataBean = (ResponseDataBean) m.invoke(bean,requestDataBean);
		//保存返回值，前台可以获取
		model.addAttribute("responseDataBean",responseDataBean);
		return responseDataBean;
	}
	
	/**
	 * 
	 * TODO 页面跳转
	 * 作者：黄廷柳
	 * 2016年3月18日下午3:50:12
	 */
	@RequestMapping(value = "/page/{dir}/{page}")
	public String page(@PathVariable String dir,@PathVariable String page, HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception{
		return dir+"/"+page;
	}
	/**
	 * 
	 * TODO 页面跳转
	 * 作者：黄廷柳
	 * 2016年4月1日下午5:54:53
	 */
	@RequestMapping(value = "/page/{page}")
	public String page(@PathVariable String page, HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception{
		return page;
	}
	
	/**
	 * TODO 单文件上传
	 * @param imgFile 上传文件
	 * @return 返回文件名（保存至数据库的路径）
	 * 作者：黄廷柳
	 * 2016年6月21日上午10:39:33
	 */
	@RequestMapping(value = "/upload")
	@ResponseBody
	public String upload(@RequestParam MultipartFile imgFile, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		//uploadUrl的路径webapp/upload
		String uploadUrl = request.getSession().getServletContext().getRealPath("/")+"/upload/";
		String fileName = imgFile.getOriginalFilename();
		String type = fileName.substring(fileName.indexOf(".")+1);
		
		
		File dir = new File(uploadUrl);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		String targetFilePath = UUID.randomUUID().toString()+"."+type;
		//上传后的文件
		File targetFile = new File(uploadUrl+targetFilePath);
		if(!targetFile.exists()){
			targetFile.createNewFile();
		}
		
		//将文件转换到上传文件
		imgFile.transferTo(targetFile);
		
		return targetFilePath;
	}
	
	/**
	 * TODO 多文件上传
	 * @return 文件名称集合
	 * 作者：黄廷柳
	 * 2016年6月21日上午10:55:35
	 */
	@RequestMapping(value="/moreUpload")
	@ResponseBody
	public List<Object> moreUplaod(HttpServletRequest request){
		
		String uploadUrl = request.getSession().getServletContext().getRealPath("/")+"/upload/";		
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) request;
		List<MultipartFile> files = mreq.getFiles("file");
		
		File dir = new File(uploadUrl);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		List<Object> fileList = new ArrayList<Object>();
		for(MultipartFile f:files){
			String fileName = f.getOriginalFilename();
			String type = fileName.substring(fileName.indexOf(".")+1);
			String targetFilePath = UUID.randomUUID().toString()+"."+type;
			//上传后的文件
			File targetFile = new File(uploadUrl+targetFilePath);
				try {
					if(!targetFile.exists()){
						targetFile.createNewFile();
					}
					f.transferTo(targetFile);
					fileList.add(targetFilePath);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return fileList;
	}
	
}
