Public class AutoConvertLeads{

@invocableMethod(label='custom lead convert')
Public static List<List<string>> LeadAssign(List<List<string>> leadIds){

LeadStatus convertedLeadStatus=[select Id,MasterLabel from LeadStatus where isConverted=true limit 1];
List<Database.LeadConvert> leadsToconvert= new List<Database.LeadConvert>();
List<String>leadIdsToconvert= leadIds.get(0);

For(String currentLead: leadIdsToconvert){
Database.LEadConvert leadConvert=new Database.LEadConvert();
leadConvert.setLeadId(currentLead);
leadConvert.setConvertedStatus(convertedLeadStatus.MasterLabel);
leadConvert.setDoNotCreateOpportunity(true);
leadsToconvert.add(leadConvert);
}
If(!leadsToconvert.isEmpty()){
Database.convertLead(leadsToconvert);

}

return leadIds;

}

}