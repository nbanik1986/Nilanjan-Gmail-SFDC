public class TwilioService{



public static List<TwilioService.InputWrapper> run(List<TwilioService.InputWrapper> code)
{

sendSMS(code.get(0));
return code;

}

Public static void sendSMS(TwilioService.InputWrapper input)
{
string url=System.Label.TWILIO_URL+'/2010-04-01/Accounts/'+system.Label.TWILIO_ACCOUNT_SID+'/Messages.json';
Blob headerValue=Blob.valueOf(System.Label.TWILIO_ACCOUNT_SID+':'+System.Label.TWILIO_AUTH_TOKEN);
string authorizationHeader='BASIC '+ Encodingutil.base64encode(headerValue);
string body='From='+Encodingutil.urlencode(System.Label.TWILIO_PHONE,'UTF-8')+'&Body='+EncodingUtil.urlEncode('Code:'+input.code,'UTF-8')+'&To='+Encodingutil.urlEncode('+91'+input.phone,'UTF-8');
HttpRequest req= new HttpRequest();
req.setMethod('POST');
req.setEndPoint(url);
req.setHeader('Authorization',authorizationHeader);
req.setHeader('Content-type','application/x-www-form-urlencoded');
req.setBody(body);
Http h = new Http();
HttpResponse res =h.send(req);
system.debug('response:'+ res.getBody());
system.debug('response:'+ res.getStatusCode());
}

public class InputWrapper{

@invocableVariable(label='verify code')
public string code;
@invocableVariable(label='user Phone')
public string phone;

}

}