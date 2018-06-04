package Utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

public class GetData {

	public static String getBooksData(String searchTerm){
		StringBuilder sb = new StringBuilder();
		try{
			URL url = new URL("https://itunes.apple.com/search?term=+"+URLEncoder.encode(searchTerm,"UTF-8")+"&entity=audiobook");
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = "";
			while((line = reader.readLine()) != null){
				sb.append(line);
			}
		}catch(MalformedURLException e){
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb.toString();
	}

	public static String getBooksLookup(String searchTerm){
		StringBuilder sb = new StringBuilder();
		try{
			URL url = new URL("https://itunes.apple.com/lookup?id=+"+URLEncoder.encode(searchTerm,"UTF-8"));
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = "";
			while((line = reader.readLine()) != null){
				sb.append(line);
			}
		}catch(MalformedURLException e){
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb.toString();
	}
}

