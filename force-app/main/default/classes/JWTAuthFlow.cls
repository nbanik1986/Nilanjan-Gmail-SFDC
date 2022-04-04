public class JWTAuthFlow {
    @AuraEnabled
    
    public static string createJWT(String iss,String sub,String aud,String endpoint)
    {
        /*StaticResource jwtprivate=[select Id,body from StaticResource where name='JWT_Private_key' limit 1];
        String privateKey=jwtprivate.body.tostring();
        
        JSONGenerator jsonheader=JSON.createGenerator(false);
        jsonheader.writeStartObject();
        jsonheader.writeStringField('alg', 'RS256');
         jsonheader.writeStringField('typ', 'JWT');
        jsonheader.writeEndObject();
        String encodedheader=EncodingUtil.base64Encode(Blob.valueOf(jsonheader.getAsString()));
        
        JSONGenerator jsonBody=JSON.createGenerator(false);
        jsonBody.writeStartObject();
        jsonBody.writeStringField('iss', iss);
        jsonBody.writeStringField('sub', sub);
        jsonBody.writeStringField('aud', aud);
        jsonBody.writeNumberField('exp', DateTime.now().addMinutes(3).getTime());
        jsonBody.writeEndObject();
        String encodedBody=EncodingUtil.base64Encode(Blob.valueOf(jsonBody.getAsString()));
\
        String jwtRequest=encodedheader+'.'+encodedBody;
        
        Blob key=Encodingutil.base64Decode(privateKey);
        Blob rs256sig=Crypto.sign('RSA-SHA256', Blob.valueOf(jwtRequest), key);
        String signature=Encodingutil.base64Encode(rs256sig);
        signature=signature.replace('+','-');
         signature=signature.replace('/','_');
        String signedJwRequest=jwtRequest+'.'+signature;
        system.debug('signedJwRequest:'+signedJwRequest);
        String payload='grant_type= urn:ietf:params:oauth:grant-type:jwt-bearer';
        payload +='&assertion='+signedJwRequest;
        Http h= new Http();
        HttpRequest req=new Httprequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('content-type', 'application/x-www-form-urlencoded');
        req.setBody(payload);
        Httpresponse res=h.send(req);
        system.debug('res::'+res.getStatusCode());
         system.debug('res::'+res.getBody());
        if(res.getStatusCode() == 200)
        {
          Map<String,Object> mapTokenresponse =(Map<string,object>)JSON.deserializeUntyped(res.getBody()) ;
            system.debug('access_token:'+ (string)mapTokenresponse.get('access_token'));
            return (string)mapTokenresponse.get('access_token'); 
        }
        return res.getBody();
*/
    
        
 Auth.JWT jwt= new Auth.JWT();
jwt.setIss(iss);
jwt.setSub(sub);
jwt.setAud(aud);

MAp<String,object> claims= new Map<string,object>();
claims.put('exp',system.now().getTime());
jwt.setAdditionalClaims(claims);
    
    Auth.JWS jws= new Auth.JWS(jwt,'salesforceJWTCert');
    string token=jws.getCompactSerialization();
    string tokenEndpoint='https://nilanjan-dev-ed.my.salesforce.com/services/oauth2/token';
    
    Auth.JWTBearerTokenExchange bearer = new Auth.JWTBearerTokenExchange(endpoint, jws);
        
        //Get the access token
        String accessToken = bearer.getAccessToken();
    system.debug('bearer token:'+accessToken);
        return accessToken;
    }

}