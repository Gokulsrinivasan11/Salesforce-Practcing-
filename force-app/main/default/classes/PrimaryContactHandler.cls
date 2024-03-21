public class PrimaryContactHandler {  

    public static void getPrimaryContact(List<Contact> newContacts){
        // Check if there are new contacts to process
        if (!newContacts.isEmpty()) {
            // Query existing contacts with Primary_Contact__c set to true
            Set<Id> existingPrimaryContacts = new Set<Id>();
            for (Contact existingContact : [SELECT Id FROM Contact WHERE Primary_Contact__c = true]) {
                existingPrimaryContacts.add(existingContact.Id);
            }

            // Iterate over new contacts
            for (Contact newContact : newContacts) {
                // Check if the Primary_Contact__c field is set to true
                if (newContact.Primary_Contact__c == true) {
                    // If there is an existing contact with Primary_Contact__c set to true, prevent insertion
                    if (!existingPrimaryContacts.isEmpty()) {
                        newContact.addError('Another contact is already set as the primary contact.');
                    }
                }
            }
        }
    }
}