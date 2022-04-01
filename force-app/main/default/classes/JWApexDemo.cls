public class JWApexDemo{


public JWApexDemo()
{

Auth.JWT jwt= new Auth.JWT();
jwt.setIss('3MVG9ZL0ppGP5UrC8jaYhrR2eItkxVG_TLR7.yCv47xjTu5tKL3Nqbm4N4lSZu1ZOxteUA8D82xE4vCpfGARG');
jwt.setSub('banik.nilanjan@tcs.com');
jwt.setAud('https://login.salesforce.com');

MAp<String,object> claims= new Map<string,object>();
claims.put('exp',system.now().getTime());
jwt.setAdditionalClaims(claims);
    
    Auth.JWS jws= new Auth.JWS(jwt,'salesforceJWTCert');
    string token=jws.getCompactSerialization();
    string tokenEndpoint='https://nilanjan-dev-ed.my.salesforce.com/services/oauth2/token';
    
    Auth.JWTBearerTokenExchange bearer = new Auth.JWTBearerTokenExchange(tokenEndpoint, jws);
        
        //Get the access token
        String accessToken = bearer.getAccessToken();
    system.debug('bearer token:'+accessToken);
    
}



}