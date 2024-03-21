// Apex Trigger on the Contact object
trigger ChangeContactOwnerFromAccountTrigger on Contact (before update) {
    // Check if the trigger context is not from the data loader or other system operations
    if (!System.isFuture() && !System.isBatch() && !System.isScheduled()) {
        // Instantiate the handler class and call the appropriate method
        ChangeContactOwnerFromAccount.handleBeforeUpdate(Trigger.newMap, Trigger.oldMap);
    }
}