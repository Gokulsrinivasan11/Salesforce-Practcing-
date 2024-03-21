trigger UpdateOpportunityStageTrggier on Account (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
    UpdateOpportunityStage_Handler.updateStageName(Trigger.new);
    }

}