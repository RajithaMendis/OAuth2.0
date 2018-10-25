

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;
import org.apache.http.message.BasicNameValuePair;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Registration() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String authorization_code = request.getParameter("code");
		String tokenEndpoint ="https://graph.facebook.com/oauth/access_token";
        String grantType = "authorization_code";
        String redirectURI = "https://localhost:8443/oAuthWebApp/Registration";
        String clientID= "281055615852932";
        String clientSecret = "6f35e8017fbab24162d43c3c39044e36";
        String accessToken = null;
       
        //POST request
        HttpPost httpPostRequest = new HttpPost(tokenEndpoint +
                "?"+"grant_type=" + URLEncoder.encode(grantType,StandardCharsets.UTF_8.name()) +
                "&"+"code=" + URLEncoder.encode(authorization_code,StandardCharsets.UTF_8.name()) +
                "&"+"redirect_uri=" + URLEncoder.encode(redirectURI,StandardCharsets.UTF_8.name()) +
                "&"+"client_id=" + URLEncoder.encode(clientID,StandardCharsets.UTF_8.name()));
      
        // Authorization header with the application credentials
        String clientCredentials = clientID + ":" + clientSecret;
        String encodedCredentials = new String(Base64.encodeBase64(clientCredentials.getBytes()));
       
        httpPostRequest.setHeader("Authorization", "Basic " +encodedCredentials);
       
        //Generate access token request
        HttpClient client = new DefaultHttpClient();
        HttpResponse responseInPOST = client.execute(httpPostRequest);
        
        //Get access token response
        Reader accessTokenresponse = new InputStreamReader(responseInPOST.getEntity().getContent());
        BufferedReader buff = new BufferedReader(accessTokenresponse);
        String properties = buff.readLine();
        String responseArray[] = properties.split("&");
            for (String splittedResponse : responseArray) {
                 try {
                       JSONParser parser = new JSONParser();
                       Object obj = parser.parse(splittedResponse);
                       JSONObject jsonobj = (JSONObject) obj;
                       accessToken = jsonobj.get("access_token").toString();
                       System.out.println("Access token: " + accessToken);
                     } catch (ParseException e) {
                      System.out.println("parsing Responce Error!!" + e.getMessage());
                }

            }
            String resource_request = "https://graph.facebook.com/v2.8/me?fields=first_name,email,last_name,birthday,name,gender,hometown,location,age_range";
            httpPostRequest = new HttpPost(resource_request);
            httpPostRequest.addHeader("Authorization", "Bearer " + accessToken);
            List<NameValuePair> parameters = new ArrayList<NameValuePair>();
            parameters.add(new BasicNameValuePair("method", "get"));
            httpPostRequest.setEntity(new UrlEncodedFormEntity(parameters));
            responseInPOST = client.execute(httpPostRequest);

            buff = new BufferedReader(new InputStreamReader(responseInPOST.getEntity().getContent()));
            
            String val = buff.readLine();
            System.out.println("Feed data: " + val);
            JSONParser parser = new JSONParser();
            try {
				   JSONObject json = (JSONObject) parser.parse(val);
				   System.out.println("Hello"+json);

				    String first_name = (String) json.get("first_name");
		            String last_name = (String) json.get("last_name");
		            String name = (String) json.get("name");
		            String emailAddress = (String) json.get("email");
		            String birthday = (String) json.get("birthday");
		            String gender = (String) json.get("gender");
		            String id = (String) json.get("id");
		            
		            JSONObject hometown = (JSONObject) json.get("hometown");
		            String hometownname = (String) hometown.get("name");
		           
		            JSONObject location = (JSONObject) json.get("location");
		            String locationname = (String) location.get("name");
		            
		            JSONObject ageRange = (JSONObject) json.get("age_range");
		            System.out.println(ageRange);
		            long agerange = (Long) ageRange.get("min");
		           
			           
		            
		            request.setAttribute("first_name",first_name);
		            request.setAttribute("last_name",last_name);
		            request.setAttribute("name",name);
		            request.setAttribute("emailAddress",emailAddress);
		            request.setAttribute("birthday",birthday);
		            request.setAttribute("gender",gender);
		            request.setAttribute("hometownname",hometownname);
		            request.setAttribute("locationname",locationname);
		            request.setAttribute("agerange",agerange);
		            request.setAttribute("pwd",id);
		            
		            request.getRequestDispatcher("registrationPage.jsp").forward(request, response);
		           
		         
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            ((BufferedReader) client).close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  System.out.println("Login.Java: doPost method reached");
	}

}
