trigger ContactTrigger on Contact (after insert,after update,after delete,before insert,before update,after undelete) {

//Roll up Summary field 

If(trigger.isAfter)
{
List<Contact>contactList= new List<Contact>();
Set<Id>accountSetId= new Set<Id>();

if(trigger.isDelete)
contactList=trigger.old;
else
contactList=trigger.new;

For(Contact con : contactList)
{
if(con.accountId != null)
accountSetId.add(con.accountId);

if(trigger.isUpdate)
{
Contact oldcontact=trigger.oldmap.get(con.Id);
if(con.accountId != oldcontact.accountId)
accountSetId.add(oldcontact.accountId);
}

}
//List<Account>updateAccountList= new List<Account>();
//solution1

/*
List<Account>accountList=[select ID,Number_Of_Contact__c,(select Id from Contacts) from Account where id in :accountSetId];

for(Account acc : accountList)
{

LIst<Contact>lstcontact=acc.Contacts;
if(lstcontact != null)
acc.Number_Of_Contact__c=lstcontact.size();
else
acc.Number_Of_Contact__c=0;

}

update accountList;
*/

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




//Contact duplicate check based on Email
if(trigger.isBefore || trigger.isundelete)
{

List<Contact> contactList= new List<Contact>();
Set<String>newEmailset= new Set<String>();
Set<String>existingEmailset= new Set<String>();

if(trigger.isbefore && (trigger.isInsert || trigger.isUpdate))
contactList=Trigger.new;
else if(trigger.isAfter &&
 trigger.IsUndelete)
contactList=Trigger.new;

For(Contact con : contactList)
{
if(trigger.isInsert || trigger.isUndelete)
{
if(con.Email != null)
newEmailset.add(con.Email);
}
else if (trigger.isupdate)
{
Contact oldcontact=trigger.oldmap.get(con.Id);
if(oldcontact.Email != con.Email)
newEmailset.add(con.Email);
}
}

List<Contact> existingContact=[select Id,Email from Contact where Email != null and Email in : newEmailset];

For(Contact con : existingContact)
{
existingEmailset.add(con.Email);
}

For(Contact con : contactList)
{
if(existingEmailset.contains(con.Email))
con.Email.addError('Duplicate email is not allowed');
else
existingEmailset.add(con.Email);
}

}

}