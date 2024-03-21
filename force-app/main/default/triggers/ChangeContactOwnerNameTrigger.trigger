trigger ChangeContactOwnerNameTrigger on Contact (after update) {
	Set<Id> conIds = new Set<Id>();
    List<Contact> cn = new List<Contact>();
    for(Contact con : trigger.new){
        conIds.add(con.AccountId);
    }
    Account act = new Account();
    List<Account> acc = new List<Account>();
        acc = [select Id,Opportunity_Manager__c from Account Where id =: conIds];
        List<Contact> cnt = new List<Contact>();
    	cnt = [select Id,lastname,OwnerId,Level__c from Contact Where AccountId =: act.id];
        for(Contact co : cnt){
            if(co.Level__c == 'Secondary'){
                for(Account ac : acc){
                    co.OwnerId = ac.Opportunity_Manager__c;
                    System.debug('co.OwnerId===>  '+ co.OwnerId);
                    cn.add(co);
                }
                
            }
        }
    update cn;
}