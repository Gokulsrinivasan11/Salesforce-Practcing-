trigger RestrictToCreateMoreThanTwoOpp on Opportunity (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        RestrictToCreateMoreThanTwoOppHandler.restrictMoreThanTwoOpp(Trigger.New);
   }
}