public class SplitScholarshipAmountHandler {

    public static void splitTheAmount(List<Account> accList){
        List<Contact> updateCon = new List<Contact>();
        List<Contact> conList = [SELECT Id, LastName, AccountId, ScholarShip_Share__c FROM Contact WHERE AccountId IN :accList];
        Map<Id, Contact> conId = new Map<Id, Contact>(conList);

        for (Account acc : accList) {
            if (acc.Scholarship_Amount__c > 0) {
                Integer accountIdSize = conId.size();
                for (Contact con : conId.values()) {
                    if (con.AccountId == acc.Id) {
                        // Create a new instance of Contact for each iteration
                        Contact updatedContact = new Contact(Id = con.Id);
                        updatedContact.ScholarShip_Share__c = acc.Scholarship_Amount__c / accountIdSize;
                        updateCon.add(updatedContact);
                    }
                }
            }
        }
        
        if (!updateCon.isEmpty()) {
            update updateCon;
        }
    } 
}