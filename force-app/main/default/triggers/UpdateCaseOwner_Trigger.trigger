trigger UpdateCaseOwner_Trigger on Case (before update) {

    UpdateCaseOwner_Handler.changeCaseOwner(Trigger.newMap,Trigger.oldMap);
}