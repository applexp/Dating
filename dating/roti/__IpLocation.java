package roti;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class __IpLocation {

	private String city;
	private String state;
	private String country;
	private String postcode;
	private String geolocation;
	private String ip;

	private static String LINK = "http://ip-api.com/json/";

	public __IpLocation(String ip){

		HttpResponse response = null;
		String jsonbody = null;

		String url = LINK + ip; 

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);



		try {

			response = client.execute(request);
			jsonbody = IOUtils.toString(response.getEntity().getContent(), "UTF-8");

			JsonParser jsonParser = new JsonParser();
			JsonElement jsonElement = jsonParser.parse(jsonbody);
			
			if (jsonElement.isJsonObject()) {
	            JsonObject location = jsonElement.getAsJsonObject();

	            country = location.get("country").getAsString();
				state = location.get("regionName").getAsString();
				city = location.get("city").getAsString();
				postcode = location.get("zip").getAsString();
				String lat = location.get("lat").getAsString();
				String lon = location.get("lon").getAsString();
				geolocation = lat + ","+ lon;
	        }
			 
		}catch (java.lang.ArrayIndexOutOfBoundsException | java.lang.NullPointerException ex){

			city = "";
			state = "";
			country = "";
			postcode = "";
			geolocation = "0,0";
			
			//System.out.println("error: " +city+" - " + state+" - "+ country);

		}catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getCity(){
		return city;
	}
	public String getState(){
		return state;
	}
	public String getCountry(){
		return country;
	}
	public String getPostcode(){
		return postcode;
	}
	public String getGeoLocation(){
		return geolocation;
	}
}
