public class RestrictToCreateMoreThanTwoOppHandler {

   public static void restrictMoreThanTwoOpp(List<Opportunity> oppList){
       List<Opportunity> insertOpp = new List<Opportunity>();
       List<Account> act = new List<Account>();
       Set<Id> accIds = new Set<Id>();
       for(Account acc : act){
           accIds.add(acc.Id);
       }
       List<Opportunity> opp = [Select id,name,amount,closedate From Opportunity Where AccountId =: accIds];
       Integer oppCount = 0;
       for(Opportunity opty : opp){
           for(Account acc : act){
                if(opty.AccountId == acc.Id){  
               	oppCount++;
                    if(oppCount > 2){
                        opty.addError('You cannot create more than two opportunities');
                        oppList.add(opty);
                    }
           }
           }
          
       }
       if(!oppList.isEmpty()){
           insertOppList(oppList);
       }
    }
    public static void insertOppList(List<Opportunity> oppList){
        try{
            insert oppList;
        }
        catch(Exception e){
            System.debug('Error====>  ' + e.getMessage());
        }
    }
}