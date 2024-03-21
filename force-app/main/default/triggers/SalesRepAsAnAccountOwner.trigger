trigger SalesRepAsAnAccountOwner on Account (before insert) {
    for (Account acc : Trigger.new) {
        if (acc.OwnerId != null) { // Ensure there's an owner assigned to the account
            acc.Sales_Rep__c = [SELECT Name FROM User WHERE Id = :acc.OwnerId].Name;
        }
    }
}