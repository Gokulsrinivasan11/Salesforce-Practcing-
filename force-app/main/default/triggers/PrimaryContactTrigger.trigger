trigger PrimaryContactTrigger on Contact (before insert) {
    
    PrimaryContactHandler.getPrimaryContact(trigger.new);

}