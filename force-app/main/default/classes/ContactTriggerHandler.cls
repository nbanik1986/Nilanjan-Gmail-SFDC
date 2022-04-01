public class ContactTriggerHandler implements  TriggerInterface{


public static void beforeInsert(List<sObject> newRecordList){


}

public static void afterInsert(List<sObject> newRecordList,Map<Id,sObject>newRecordMap){

List<Contact> contactList=(List<Contact>)newRecordList;
ContactTriggerHelper.updateCount(contactList);

}

public static void afterUpdate(Map<Id,sObject> oldRecordMap,Map<Id,sObject>newRecordMap){

List<Contact>newContactList=(List<Contact>)newRecordMap.values();
List<Contact> contactList= new List<Contact>();

For(Contact con : newContactList)
{
Contact oldcontact=(Contact)oldRecordMap.get(Con.Id);
if(oldcontact.Email != con.Email)

contactList.add(con);
}

ContactTriggerHelper.updateCount(contactList);

}

public static void beforeUpdate(Map<Id,sObject> oldRecordMap,Map<Id,sObject>newRecordMap){

}

public static void beforeDelete(List<sObject>oldRecordList,Map<id,sObject> oldRecordMap){

}

public static void afterDelete(Map<id,sObject> oldRecordMap) {

List<Contact>contactList=(List<Contact>)oldRecordMap.values();
ContactTriggerHelper.updateCount(contactList);

}

public static void afterUnDelete(List<sObject> newRecordList,Map<Id,sObject>newRecordMap){

List<Contact> contactList=(List<Contact>)newRecordList;
ContactTriggerHelper.updateCount(contactList);

}

}