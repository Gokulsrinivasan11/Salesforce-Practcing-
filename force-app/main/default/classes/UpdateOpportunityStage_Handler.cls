public class UpdateOpportunityStage_Handler {

    public static void updateStageName(List<Account> accList){
        List<Opportunity> updateOpp = new List<Opportunity>();
        Set<Id> accIds = new Set<Id>();
        for(Account ac : accList){
           accIds.add(ac.Id);
        }
        List<Opportunity> opp = [select Id,name,StageName,CloseDate from Opportunity Where AccountId =: accIds];
        
           for(Opportunity op : opp){
               if(op.StageName != 'Closed Won' && op.CloseDate <System.now().addDays(-30)){
                   op.StageName = 'Closed Lost';
               }
               updateOpp.add(op);
        } 
        if(!updateOpp.isEmpty()){
            update updateOpp;
        }
    }
}