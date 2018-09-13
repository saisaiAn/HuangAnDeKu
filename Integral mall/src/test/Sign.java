package test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;
//1：统一下单API  签名
public class Sign {
	
	public static String Sign(SortedMap<Object, Object> parameters,String Key){
	

	        StringBuffer sb = new StringBuffer();
				Set es = parameters.entrySet();
				Iterator<?> it = es.iterator();
				while (it.hasNext()) {
					@SuppressWarnings("rawtypes")
					Map.Entry entry = (Map.Entry) it.next();
					String k = (String) entry.getKey();
					Object v = entry.getValue();
					if (null != v && !"".equals(v) && !"sign".equals(k)
							&& !"key".equals(k)) {
						sb.append(k + "=" + v + "&");
					}
				}
		 
				
            sb.append("key="+Key);

				
				
				String sign= MD5.MD5Encode(sb.toString(),"UTF-8").toUpperCase();
		 
		 
		 return sign;
		
		
		
		
		
		
		
	}
	
	public static void main(String[] args) {
	
	}
	

}
