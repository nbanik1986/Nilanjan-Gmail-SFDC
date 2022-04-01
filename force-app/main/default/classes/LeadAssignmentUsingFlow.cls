Public class LeadAssignmentUsingFlow {


@invocableMethod(label='Lead Assignment using flow')
Public static void LeadAssign(List<Id>LeadIds)
{
Database.DMLOptions dmo= new Database.DMLOptions();
dmo.assignmentRuleHeader.useDefaultRule=true;

Lead lead=[select Id from Lead where id in :LeadIds];
lead.setOptions(dmo);
update lead;

}

}