trigger AddAndDeleteContacts on Account (after insert,after update) {
    if(trigger.isAfter){
    if(trigger.isInsert ){
AddAndDeleteContactHandler.createNumberOfContacts(Trigger.New);
        }
    }
    if(trigger.isAfter){
    if(trigger.isUpdate ){
AddAndDeleteContactHandler.updateOrDeleteNumberOfContacts(Trigger.New);
        }
    }
}