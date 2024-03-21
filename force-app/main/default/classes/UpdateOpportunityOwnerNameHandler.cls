public class UpdateOpportunityOwnerNameHandler {

    public static void changeOpportunityOwner(Map<Id,Opportunity> newOpty, Map<Id,Opportunity> oldOpty){
        List<Opportunity> updateOpp = new List<Opportunity>();
        Set<Id> accIds = new Set<Id>();
        for(Opportunity op : newOpty.values()){
            if(op.Type != oldOpty.get(op.Id).Type){
                 accIds.add(op.AccountId);
            }
           
        }
        Map<Id,Account> getAcc = new Map<Id,Account>([select Id,Opportunity_Manager__c,Contact_Manager__c,Case_Manager__c from Account Where Id IN: accIds]);
        
        for(Opportunity opt : newOpty.values()){
            if(opt.Type != oldOpty.get(opt.Id).Type){
                Account updatedAcc = getAcc.get(opt.AccountId);
            
            if(opt.Type == 'New Customer'){
                opt.OwnerId = updatedAcc.Opportunity_Manager__c;
            }else if(opt.Type == 'Existing Customer - Upgrade'){
                opt.OwnerId = updatedAcc.Contact_Manager__c;
            }else if(opt.Type == 'Existing Customer - Replacement'){
                opt.OwnerId = updatedAcc.Case_Manager__c;
            }
            }
            updateOpp.add(opt);
        }
        if(!updateOpp.isEmpty()){
            updateOpportunity (updateOpp);
        }
    }
    public static void updateOpportunity(List<Opportunity> updateOpp){
        try{
            update updateOpp;
        }
        catch(Exception e){
            System.debug('Error=====> ' + e.getMessage());
        }
    }
    
}