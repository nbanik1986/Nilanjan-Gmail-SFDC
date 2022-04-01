Public interface TriggerInterface{


void beforeInsert(List<sObject> newRecordList);

void afterInsert(List<sObject> newRecordList,Map<Id,sObject>newRecordMap);

void afterUpdate(Map<Id,sObject> oldRecordMap,Map<Id,sObject>newRecordMap);

void beforeUpdate(Map<Id,sObject> oldRecordMap,Map<Id,sObject>newRecordMap);

void beforeDelete(List<sObject>oldRecordList,Map<id,sObject> oldRecordMap);

void afterDelete(Map<id,sObject> oldRecordMap);

void afterUnDelete(List<sObject> newRecordList,Map<Id,sObject>newRecordMap);



}