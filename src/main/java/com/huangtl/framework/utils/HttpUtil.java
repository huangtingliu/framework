package com.huangtl.framework.utils;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpUtil {
	/**
	 * 简单参数的post提交
	 * @param map
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public static String post(Map<String,String> map,String url) throws Exception{
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String jsonStr="";
        try {

            HttpPost httpPost = new HttpPost(url);

            httpPost.setEntity(new UrlEncodedFormEntity(getNameValues(map),"UTF-8"));
            CloseableHttpResponse response2 = httpclient.execute(httpPost);

            try {
                
                HttpEntity entity2 = response2.getEntity();
                jsonStr=EntityUtils.toString(entity2);

                EntityUtils.consume(entity2);
            } finally {
                response2.close();
            }
        } finally {
            httpclient.close();
          
        }
        return jsonStr;
        
    }
	
	
	public static String post(String content,String url) throws Exception{
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String jsonStr="";
        try {

            HttpPost httpPost = new HttpPost(url);

            //httpPost.setEntity(new UrlEncodedFormEntity(getNameValues(map),"UTF-8"));
            httpPost.setEntity(new StringEntity(content, "GBK")  );
            CloseableHttpResponse response2 = httpclient.execute(httpPost);

            try {
                
                HttpEntity entity2 = response2.getEntity();
                jsonStr=EntityUtils.toString(entity2);

                EntityUtils.consume(entity2);
            } finally {
                response2.close();
            }
        } finally {
            httpclient.close();
          
        }
        return jsonStr;
        
    }
	public static List<NameValuePair> getNameValues(Map<String,String> map){
		List <NameValuePair> nvps = new ArrayList <NameValuePair>();
		for(String key:map.keySet()){
			nvps.add(new BasicNameValuePair(key, map.get(key)));
		}
		return nvps;
				
	}
	public static void main(String[] x) throws Exception{
		Map<String, String> map=new HashMap<String, String>();
//		map.put("alias", "xxxx");
//		map.put("data", "dddd");
//		post(map,"http://localhost:3000/push/snedMessage");
		map.put("username", "w1234");
		map.put("password", "000000");
		System.out.println(post(map,"http://localhost:8002/member.php?mod=logging&action=login&loginsubmit=yes&infloat=yes&lssubmit=yes"));
	}
	
	
}

