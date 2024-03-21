public class AddAndDeleteContactHandler {
    
   public static void createNumberOfContacts(List <Account> createAccList){
        list<Account> ac = [Select Id,Name,NumberofLocations__c,(Select id,lastname From Contacts) From Account Where id in: createAccList];
        list<Contact> con = new list<Contact>(); 
        for(Account act : ac){
            if(act.NumberofLocations__c != null){
            for(Integer i=0; i<=act.NumberofLocations__c; i++){
           	Contact cnt = new Contact();
            cnt.AccountId = act.Id;
            cnt.lastname = 'Test Contact' + ' '+ i;
            con.add(cnt);
            
        }
            }
        }
        if(con.size()>0){
            insert con;
        }
        
    }
    public static void updateOrDeleteNumberOfContacts(list<Account> updateAccList){
        Decimal numContacts = 0;
        list<Contact> cnt = new list<Contact>();
        list<Contact> cnt1 = new list<Contact>();
        list<Account> acc = [Select id,name,NumberofLocations__c ,(Select id,lastname from Contacts) From Account Where id in: updateAccList];
        for(Account act : acc){
            if(act.NumberofLocations__c >= act.contacts.size()){
                numContacts = act.NumberofLocations__c - act.contacts.size();
                for(Integer i=0; i<numContacts; i++){
                    Contact con = new Contact();
                    con.AccountId = act.Id;
                    con.lastname = 'Test Contact' + ' '+ i;
                    cnt.add(con);
                }
            }else{
                numContacts = act.contacts.size() - act.NumberofLocations__c;
                for(Integer i=0; i<numContacts;i++){
                    cnt1.add(act.contacts[i]);
                }
            }
            
        }
        if(cnt.size() != null){
            insert cnt;  
        }
        if(cnt1.size() != null){
            delete cnt1;
            
        }
    }
   {
       
   }  
}