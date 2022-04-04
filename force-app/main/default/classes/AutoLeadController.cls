Public class AutoLeadController{

Public List<String>leadIdsSet{get;set;}
Public List<Lead> selectedLeadRecords{get;set;}

public AutoLeadController(ApexPages.StandardsetController setController)
{
    //added by nilanjan modified
leadIdsSet= new List<String>();
selectedLeadRecords=(Lead[])setController.getselected();
For(sObject obj :setController.getselected() ){
leadIdsSet.add((string)obj.get('Id'));

}

system.debug('lead ids:'+leadIdsSet);
selectedLeadRecords=[select ID,Email,Name,Company,Phone,Rating from Lead where id in :leadIdsSet];

}

}