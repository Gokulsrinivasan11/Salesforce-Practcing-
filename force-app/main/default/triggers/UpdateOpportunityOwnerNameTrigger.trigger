trigger UpdateOpportunityOwnerNameTrigger on Opportunity (before update) {

   
        UpdateOpportunityOwnerNameHandler.changeOpportunityOwner(Trigger.newMap, Trigger.oldMap);
    
}