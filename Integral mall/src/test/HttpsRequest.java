package test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

public class HttpsRequest {
	
	public static String httpsRequest(String requestUrl,String requestMethod,String outStr) throws Exception{

//	      ����	SSLContext
SSLContext  sslContext=SSLContext.getInstance("SSL","SunJSSE");
TrustManager[]tm={new MyX509TrustManager()};
//			��ʼ��
sslContext.init(null, tm, new java.security.SecureRandom());
//			��ȡsslSOCKETfactory����
SSLSocketFactory ssf=sslContext.getSocketFactory();

//���õ�ǰʵ��ʹ��sslSOCKETfactory
		
		
		
		StringBuffer buffer=null;	
		URL url=new URL(requestUrl);
		HttpsURLConnection conn=(HttpsURLConnection)url.openConnection();
		
      conn.setRequestMethod(requestMethod);
	   conn.setDoOutput(true);
		conn.setDoInput(true);
		conn.setSSLSocketFactory(ssf);
		conn.connect();
		
    if(outStr!=null){
			
			OutputStream os=conn.getOutputStream();
			os.write(outStr.getBytes("UTF-8"));
			os.close();
		
		}		
		

//		��ȡ����˵�����
		InputStream is=conn.getInputStream();
		InputStreamReader isr=new InputStreamReader(is,"utf-8");
		BufferedReader br=new BufferedReader(isr);
		  buffer=new StringBuffer();
		String line=null;
		while((line=br.readLine())!=null){ 
			buffer.append(line);
		}
		
		
		
		
		
//��ӡ����

			
		
		
		
		
		
		
		
		
		return buffer.toString();	
		
	}
	

	
}
