trigger PreventAccountDeleteTrigger on Account (before delete) {
    PreventAccountDeletion.preventFromDelete(Trigger.old);

}