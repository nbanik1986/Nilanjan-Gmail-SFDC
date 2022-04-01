Public class ContactTriggerHelper{


Public static void updateCount(List<Contact> contactList)
{

Set<Id>accountSetId= new Set<Id>();
For(Contact con : contactList)
{
if(con.accountId != null)
accountSetId.add(con.accountId);
}

//solution 2
Map<Id,Account> mapaccount= new Map<Id,Account>();

List<Contact> conList=[select ID,Accountid from Contact where accountId in :accountSetId];

For(Contact con : conList)
{

if(!mapaccount.containsKey(con.accountId))
mapaccount.put(con.AccountID, new Account(Id=con.accountId,Number_Of_Contact__c=1));
else
{

Account tempAccount=mapaccount.get(con.accountId);
tempAccount.Number_Of_Contact__c +=1;
mapaccount.put(con.AccountID,tempAccount);
}

}

update mapaccount.values();

}


}