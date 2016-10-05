package com.shoes.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;

public class UrlUtil {

	/**
	 * 用户访问方式 所有访问方式 ：0
	 */
	public final static int All_REFER = 0;

	/**
	 * 用户访问方式	直接进入 ：1
	 */
	public final static int DIRECT_REFER = 1;
	
	/**
	 * 用户访问方式	搜索引擎进入 ：2
	 */
	public final static int SEACHE_ENGINE_REFER = 2;
	
	/**
	 * 用户访问方式	站内引入（同域） ：3
	 */
	public final static int SITE_REFER = 3;
	
	/**
	 * 用户访问方式	站外引入（非同域、非搜索） ：4
	 */
	public final static int OUT_SITE_REFER = 4;
	
	/**
	 * 用户访问方式	同站来源（同站点） ：5
	 */
	public final static int SAME_SITE_REFER = 5;
	
	public static String encode(String str) {
		if (str == null || str.equals(""))
			return "";
		try {
			str = java.net.URLEncoder.encode(str, "GBK");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static String decode(String str) {
		if (str == null || str.equals(""))
			return "";
		try {
			str = java.net.URLDecoder.decode(str, "GBK");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static String encode(String str, String code) {
		if (str == null || str.equals(""))
			return "";
		try {
			str = java.net.URLEncoder.encode(str, code);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static String decode(String str, String code) {
		if (str == null || str.equals(""))
			return "";
		try {
			str = java.net.URLDecoder.decode(str, code);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	public static String escape(String src) {
		if (src == null || src.equals("")){
			return "";
		}
		int i;
		char j;
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length() * 6);
		for (i = 0; i < src.length(); i++) {
			j = src.charAt(i);
			if (Character.isDigit(j) || Character.isLowerCase(j)
					|| Character.isUpperCase(j))
				tmp.append(j);
			else if (j < 256) {
				tmp.append("%");
				if (j < 16)
					tmp.append("0");
				tmp.append(Integer.toString(j, 16));
			} else {
				tmp.append("%u");
				tmp.append(Integer.toString(j, 16));
			}
		}
		return tmp.toString();
	}

	public static String unescape(String src) {
		if (src == null || src.equals("")){
			return "";
		}
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(src
							.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(src
							.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}

	/**
	 * 获取域
	 */
	public static  String getDomain(String url){
		
		String content = "";
		if(!StringUtil.isEmpty(url))
		{
		
			Matcher matcher = StringUtil.getMatcherGroup(url, ".*?(\\w*?\\.(com|cn|net|org|biz|info|cc|tv))");
			while(matcher.find()){
				content = matcher.group(1);
			}
		}
		return content;
	}
	
	//参考链接http://www.114java.com/JAVAjiqiao/201007/2435.html
	/**
	 * 获取域名
	 */
	public static  String getServerName(String url){
		//Pattern p = Pattern.compile("[^//]*?\\.(com|cn|net|org|biz|info|cc|tv)", Pattern.CASE_INSENSITIVE);//获取url地址中的主域名
		////如果要得到 chinajavaworld.com/entry/4545/0/正则表达式最后加上 .* 即可.
		//Pattern.compile("[^//]*?\\.(com|cn|net|org|biz|info|cc|tv)", Pattern.CASE_INSENSITIVE);//取完整域名.
		//return StringUtil.getMatcherGroup(url, "[^//]*?\\.(com|cn|net|org|biz|info|cc|tv)",0);
		String content = "";
		if(!StringUtil.isEmpty(url))
		{
			//logger.info("getServerNameByPattern >>" +url );
			Matcher matcher = StringUtil.getMatcherGroup(url, "(?<=http://|https://|ftp://)([\\s\\S]*?\\.(com.cn|com|cn|net|org|biz|info|cc|tv))");
			while(matcher.find()){
				content = matcher.group();
			}
		}
		return content;
	}
	
	/**
	 * 获取目录
	 * @param url
	 * @return
	 * @version 2012-8-20 - 下午06:11:26
	 * @author wushubin
	 */
	public static  String getDirectory(String url){
		String content = "";
		if(!StringUtil.isEmpty(url))
		{
			Matcher matcher = StringUtil.getMatcherGroup(url, "(com|cn|net|org|biz|info|cc|tv)(\\/.*\\/)([^\\/]*)$");
			while(matcher.find()){
				content = matcher.group(2);
			}
		}
		return content;
	}
	
	/**
	 * 获取用户来源类型
	 * 直接进入 ：1
	 * 搜索引擎进入 ：2
	 * 站内引入（同域） ：3
	 * 站外引入（非同域、非搜索） ：4
	 * 同站来源（同站点） ：5
	 * @param referServer 来源站点
	 * @param serverName  访问站点
	 * 
	 * @return
	 */
	public static int getReferType(String referServer , String serverName){
		
		//说明 direct 见wt.js中的rs值定义
		if(StringUtil.isEmpty(referServer) ){
			//没有来源的表示直接访问
			return DIRECT_REFER;
		}
		else if(referServer.equals(serverName)){
			//同站访问（来源和当前访问站点相同，表示同站访问）
			return SAME_SITE_REFER;
		}
		else if(UrlUtil.getDomain(referServer).equals(UrlUtil.getDomain(serverName))){
			//站内访问（来源的域和当前访问站点的域相同，表示站内访问,如ask.39.net进入jbk.39.net）
			return SITE_REFER;
		}
		else {
				return OUT_SITE_REFER;
		}
	}
	
	/**
	 * 将url参数拆分为map
	 * @param queryString
	 * @return
	 */
	public static Map<String,String> queryStringToMap(String queryString) {
		if(null == queryString || "".equals(queryString)) {
			return null;
		}
		
		Map<String,String> m = new HashMap<String,String>();
		String[] strArray = queryString.split("&");
		for(int index = 0; index < strArray.length; index++) {
			String pair = strArray[index];
			if(null == pair || "".equals(pair)) {
				continue;
			}
			
			int indexOf = pair.indexOf("=");
			if(-1 != indexOf) {
				String k = pair.substring(0, indexOf);
				String v = pair.substring(indexOf+1, pair.length());
				if(null != k && !"".equals(k)) {
					m.put(k, v);
				}
			} else {
				m.put(pair, "");
			}
		}
		
		return m;
		
	}
	
	public static void main(String[] args) {
		String url = "http://t.news.21cn.com/tod.ay/79225_03.shtml/#top";
		System.out.println(getServerName(url));
		
		String sub = getDirectory(url);
		String[] m = sub.split("/");
		String newSub = "/";
		int max = 3;
		int loop = max > m.length ? m.length : max;
		for(int i = 0 ; i<loop ; i++){
			if(!m[i].equals("") && m[i].indexOf(".") == -1)
				newSub += m[i]+"/";
		}
		System.out.println(newSub);
		//System.out.println(getDomain(url));
		//System.out.println(getMaxPath(url));
		/*url = url.replaceFirst("^http(s)?://", "");//先过滤协议
		System.out.println(url);
		Matcher m = patternPath.matcher(url);
		if (m.find()) {
			System.out.println(m.group(1));
		}*/
	}
}
