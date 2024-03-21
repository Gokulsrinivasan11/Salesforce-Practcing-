public class UpdateCaseOwner_Handler {

   public static void changeCaseOwner(Map<Id,Case> newCase, Map<Id,Case> oldCase){
        List<Case> updateCase = new List<Case>();
        Set<Id> accIds = new Set<Id>();
        for(Case ca : newCase.values()){
            if(ca.Status != oldCase.get(ca.Id).Status){
                accIds.add(ca.AccountId);
            }
        }
        Map<Id,Account> getCase = new Map<Id,Account>([select Id,Opportunity_Manager__c,Contact_Manager__c,Case_Manager__c from Account Where Id IN: accIds]);
        for(Case cs : newCase.values()){
            if(cs.Status != oldCase.get(cs.Id).Status){
                Account acc =  getCase.get(cs.AccountId);
                if(cs.Status == 'New'){
                    cs.OwnerId = acc.Contact_Manager__c;
                }else if(cs.Status == 'Working'){
                    cs.OwnerId = acc.Case_Manager__c;
                }
            }
        }
        if(!updateCase.isEmpty()){
            updateCaseOwner(updateCase);
        }
    }
    public static void updateCaseOwner(List<Case> updateCase){
        try{
            update updateCase;
        }
        catch(Exception e){
            System.debug('Error.....  ' + e.getMessage());
        }
        
    } 
}