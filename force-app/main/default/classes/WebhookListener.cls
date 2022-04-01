@RestResource(urlmapping='/github/webhook/v2/*')
global class WebhookListener{

@HttpGet

global static string doGet()
{

return '{"message":"Public api access"}';
}


@HttpPost
global static void doPost()
{
    //Added by Nilanjan

RestResponse response=RestContext.response;
String requestbody=RestContext.request.requestbody.tostring();
system.debug('resquestbody:'+ requestbody);
response.addHeader('Content-type','application/json');
response.statuscode=200;
response.responsebody=Blob.valueOf('{"success":true,"event" : "unknown"}');
//response.responsebody=Blob.valueOf(requestbody);
}


}