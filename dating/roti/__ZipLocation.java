package roti;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;




import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

import com.json.parsers.JSONParser;
import com.json.parsers.JsonParserFactory;

public class __ZipLocation {

	private String zipcode;
	private String countryCode;
	private String city;
	private String state;
	private Double longitude;
	private Double latitude;

	public __ZipLocation(String zipcode, String country) throws UnsupportedEncodingException{

		this.zipcode = zipcode;
		this.countryCode = getCountryCode(country);

		String base_url = "http://maps.googleapis.com/maps/api/geocode/json?";

	
		String url = base_url + "address=" + zipcode + "&sensor=false&components=country:" + countryCode; 

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);
		//request.addHeader("User-Agent", "Mozilla/5.0");

		HttpResponse response = null;

		try {

			response = client.execute(request);


			String jsonbody = null;

			jsonbody = IOUtils.toString(response.getEntity().getContent(), "UTF-8");

			//System.out.println(jsonbody);

			JsonParserFactory factory = JsonParserFactory.getInstance();
			JSONParser parser = factory.newJsonParser();
			Map jsonMap = parser.parseJson(jsonbody);

			if(isZipcode(country)){

				List a = (List) jsonMap.get("results");
				Map b = (Map) a.get(0);
				List c = (List) b.get("address_components");

				if(c.size() <= 1){
					city = "";
				}else if((c.size() == 5 && country.equals("United States"))){
					Map d = (Map) c.get(1);
					city = (String) (d.get("long_name"));
				}else{
					Map d = (Map) c.get(2);
					city = (String) (d.get("long_name"));
				}
				state = getACorrectState(country, c);
				//System.out.println(name);
				
				Map geometry = (Map) b.get("geometry");
				Map location = (Map) geometry.get("location");
				longitude = Double.parseDouble((String)location.get("lng"));
				latitude = Double.parseDouble((String) location.get("lat"));
				
			}else{
				System.out.println(country);
				state = country;
				city= "";
			}
			
		} catch (IllegalStateException | IOException e) {
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
	
	public Double getLat() {
		return latitude;
	}
	
	public Double getLongitude() {
		return longitude;
	}

	public String getACorrectState(String country, List c){

		String state = "";

		if(c.size() == 5){

			Map e = (Map) c.get(3);
			state = (String) (e.get("long_name"));

		}else if((c.size() == 4 && country.equals("Taiwan"))){

			Map e = (Map) c.get(3);
			state = (String) (e.get("long_name"));

		}else if(c.size() >= 6){
			Map e = (Map) c.get(4);
			state = (String) (e.get("long_name"));
		}

		return state;
	}
	
	public String getCountryCode(String country){

		String cCode = "";

		if(country.equals("United States")){
			cCode = "US";
		}else if(country.equals("Canada")){
			cCode = "CA";
		}else if(country.equals("China")){
			cCode = "CN";
		}else if(country.equals("Taiwan")){
			cCode = "TW";
		}else if(country.equals("Hong Kong")){
			cCode = "HK";
		}else if(country.equals("Macao")){
			cCode = "MO";
		}else if(country.equals("Singapore")){
			cCode = "SG";
		}else if(country.equals("Malaysia")){
			cCode = "MY";
		}else if(country.equals("South Korea")){
			cCode = "KR";
		}else if(country.equals("Japan")){
			cCode = "JP";
		}else if(country.equals("India")){
			cCode = "IN";
		}else if(country.equals("United Kingdom")){
			cCode = "UK";
		}else if(country.equals("Germany")){
			cCode = "DE";
		}else if(country.equals("France")){
			cCode = "FR";
		}else if(country.equals("Italy")){
			cCode = "IT";
		}else if(country.equals("Spain")){
			cCode = "ES";
		}else if(country.equals("Russia")){
			cCode = "RU";
		}else if(country.equals("Australia")){
			cCode = "AU";
		}else if(country.equals("New Zealand")){
			cCode = "NZ";
		}else if(country.equals("Brazil")){
			cCode = "BR";
		}else if(country.equals("Mexico")){
			cCode = "MX";
		}

		return cCode;

	}
	
	public boolean isZipcode(String country){
		
		boolean isPostcode = true;
		
		if(country.equals("Macau"))
			isPostcode = false;
		else if(country.equals("Hong Kong"))
			isPostcode = false;
		
		return isPostcode;
		
	}

}
