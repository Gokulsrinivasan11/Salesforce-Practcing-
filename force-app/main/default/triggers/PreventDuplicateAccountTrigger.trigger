trigger PreventDuplicateAccountTrigger on Account (before insert,before update) {
PreventDuplicateAccountHandler.getDuplicateAcc(Trigger.New);
}