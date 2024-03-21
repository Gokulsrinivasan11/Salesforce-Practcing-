trigger InsertRelatedContactTrigger on Account (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        InsertRelatedContact_Handler.addRelatedContact(Trigger.new);
    }
    
}