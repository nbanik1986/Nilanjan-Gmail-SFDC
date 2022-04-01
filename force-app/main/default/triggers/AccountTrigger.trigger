trigger AccountTrigger on Account (before delete) {

Set<Id>accountsetId=Trigger.oldmap.keyset();

List<Opportunity> existingListOppty=[select Id,AccountId from Opportunity where AccountId in :accountsetId and isWon=true ];
/*
For(Account acc : trigger.old)
{
For(Opportunity oppty :existingListOppty )
{
if(acc.Id == oppty.AccountId)
acc.addError('Account cant be deleted as it has won opportunity');
}

}
*/

//solution 2

Map<Id,Opportunity> mapOfOpportunity= new Map<Id,Opportunity>();

For(Opportunity opp : existingListOppty)
{
if(!mapOfOpportunity.containsKey(opp.accountId))
mapOfOpportunity.put(opp.accountId,opp);
}

For(Account acc : trigger.old)
{
if(mapOfOpportunity.containsKey(acc.Id))
acc.addError('Account is associated with Won opportunity.Hence cant be deleted');
}

}