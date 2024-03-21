public class ChangeContactOwnerNameHandler {

    public static void getChangeContactOwner(List<Contact> newList){
        Set<Id> newIds = new Set<Id>();
        for(Contact con : newList){
            newIds.add(con.id);
        }
        List<Contact> cn = new List<Contact>();
        Contact cnt = new Contact();
        List<Account> ac = new List<Account>();
        ac = [select Id,Opportunity_Manager__c from Account Where Id =: cnt.AccountId];
        List<Contact> co = new List<Contact>();
        co = [select Id,lastname,OwnerId,Level__c from Contact Where id =: newIds];
        for(Contact con : co){
            if(con.Level__c == 'Secondary'){
                for(Account acc : ac){
                    con.OwnerId = acc.Opportunity_Manager__c;
                    cn.add(con);
                }
                
                
            }
            
        }
        if(!cn.isEmpty()){
            update cn;
        }
    }
}