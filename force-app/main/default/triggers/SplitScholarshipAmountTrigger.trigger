trigger SplitScholarshipAmountTrigger on Account (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        SplitScholarshipAmountHandler.splitTheAmount(Trigger.New);
    }
}