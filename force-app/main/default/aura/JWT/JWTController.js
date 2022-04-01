({
	getAccessToken : function(component, event, helper) {
       // alert('hi');
         var action = component.get("c.createJWT");
        action.setParams({ "iss" : component.get("v.iss"),
                          "sub" : component.get("v.sub"),
                          "aud" : component.get("v.aud"),
                          "endpoint" : component.get("v.endpoint")
                         });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert('success');
                component.set("v.baccesstoken", true);
                component.set("v.jwtaccesstoken", response.getReturnValue());
            }
            else {
                alert('error');
                console.log("Failed with state: " + state);
            }
        });
		 $A.enqueueAction(action);
	}
})