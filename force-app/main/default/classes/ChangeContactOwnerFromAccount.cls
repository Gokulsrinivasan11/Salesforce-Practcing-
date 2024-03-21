public class ChangeContactOwnerFromAccount {
    
 public static void handleBeforeUpdate(Map<Id, Contact> newContactsMap, Map<Id, Contact> oldContactsMap) {
        List<Contact> contactsToUpdate = new List<Contact>();
        
        // Collect Account IDs for bulk querying
        Set<Id> accountIds = new Set<Id>();
        for (Contact updatedContact : newContactsMap.values()) {
            // Check if Level__c field has been changed
            if (updatedContact.Level__c != oldContactsMap.get(updatedContact.Id).Level__c) {
                accountIds.add(updatedContact.AccountId);
            }
        }
        
        // Query related Account records
        Map<Id, Account> relatedAccountsMap = new Map<Id, Account>([SELECT Id, Contact_Manager__c 
                                                                    FROM Account 
                                                                    WHERE Id IN :accountIds]);
        
        // Iterate over the updated Contact records again
        for (Contact updatedContact : newContactsMap.values()) {
            // Check if Level__c field has been changed
            if (updatedContact.Level__c != oldContactsMap.get(updatedContact.Id).Level__c) {
                // Retrieve the related Account from the map
                Account relatedAccount = relatedAccountsMap.get(updatedContact.AccountId);
                
                // Update the OwnerId field based on Level__c
                if (relatedAccount != null && updatedContact.Level__c == 'Primary') {
                    updatedContact.OwnerId = relatedAccount.Contact_Manager__c;
                    contactsToUpdate.add(updatedContact);
                }
            }
        }
        
        // No DML operations on Contact records in before trigger context
        // Return the list of contacts to update
        if (!contactsToUpdate.isEmpty()) {
            updateContacts(contactsToUpdate);
        }
    }
    
    // Method to update Contact records
    private static void updateContacts(List<Contact> contactsToUpdate) {
        try {
            update contactsToUpdate;
        } catch (Exception e) {
            // Handle any exceptions here
            System.debug('Error updating contacts: ' + e.getMessage());
        }
    }  
}