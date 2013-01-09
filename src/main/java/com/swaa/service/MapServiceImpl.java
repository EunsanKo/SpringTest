/**
 *
 */
package com.swaa.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import com.swaa.dwr.domain.Map;

/**
 * @author ¹é±â¼±(whiteship2000@gmail.com)
 *
 */
public class MapServiceImpl implements MapService {

	public String getGeoCode(Map map){
		
		
		try{
			String sUrl = "http://maps.google.com/maps/api/geocode/json?address="+URLEncoder.encode(map.getAddr(),"UTF-8")+"&sensor=true";
			/*http://maps.google.com/maps/api/geocode/json?address=%EC%97%AD%EC%82%BC%EB%8F%99&sensor=true
	    	http://maps.google.com/maps/api/geocode/json?address=%B0%A1%BB%EA%B5%BF&sensor=true
			 */		System.out.println(sUrl);
			InputStream in = new URL(sUrl).openStream();
			InputStreamReader isr = new InputStreamReader(in,"UTF-8");
			BufferedReader br = new BufferedReader(isr);
			String line = "";
			String jsonData = "";
			while((line=br.readLine())!=null){
				jsonData += line;
			}
			System.out.println(jsonData);
			
			return jsonData;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
		
	}

}
