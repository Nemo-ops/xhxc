package com.fh.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.nio.charset.Charset;

public class BombUtils {
    /**
     * 向指定 URL 发送POST方法的请求
     * @param url 发送请求的 URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String params) {
    	HttpClient httpClient = null;
    	HttpPost postMethod = null;
    	HttpResponse response = null;
    	try {
			httpClient = HttpClients.createDefault();
			postMethod = new HttpPost(url);//传入URL地址
            //设置请求头
			postMethod.addHeader("Content-type", "application/json; charset=utf-8");
			postMethod.addHeader("X-Bmob-Application-Id", "c7a4e28fada2080cb1b795658e04ae10");
			postMethod.addHeader("X-Bmob-REST-API-Key", "29b10936ef420c929962159010d79694");
			//传入请求参数
			postMethod.setEntity(new StringEntity(params, Charset.forName("UTF-8")));
			response = httpClient.execute(postMethod);//获取响应
			int statusCode = response.getStatusLine().getStatusCode();
			System.out.println("HTTP Status Code:" + statusCode);
			if (statusCode != HttpStatus.SC_OK) {
				System.out.println("HTTP请求未成功！HTTP Status Code:" + response.getStatusLine());
			}
			HttpEntity httpEntity = response.getEntity();
			String reponseContent = EntityUtils.toString(httpEntity);
			EntityUtils.consume(httpEntity);//释放资源
			System.out.println("响应内容：" + reponseContent);
			return reponseContent;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }    
}