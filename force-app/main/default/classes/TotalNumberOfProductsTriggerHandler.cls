public class TotalNumberOfProductsTriggerHandler {
    // Static variable to track trigger execution
    private static Boolean isExecuting = false;

    public static void updateTotalProducts(List<Opportunity> oppList) {
        // Check if trigger is already executing to prevent recursion
        if (!isExecuting) {
            isExecuting = true; // Set flag to true to indicate trigger execution

            Set<Id> oppIds = new Set<Id>();
            for(Opportunity op : oppList) {
                oppIds.add(op.Id);
            }

            List<Opportunity> oppToUpdate = new List<Opportunity>();
            List<Opportunity> oppQueryResult = [SELECT Id, Total_Products__c,LeadSource, (SELECT Id FROM OpportunityLineItems) FROM Opportunity WHERE Id IN :oppIds];
            
            for(Opportunity opty : oppQueryResult) {
                Integer opportunityLineItemCount = opty.OpportunityLineItems.size();
                System.debug('Opportunity Line Item Count: ' + opportunityLineItemCount);
                
                if(opportunityLineItemCount != null && opty.LeadSource != null && opty.LeadSource == 'Web') {
                    opty.Total_Products__c = opportunityLineItemCount;
                    oppToUpdate.add(opty);
                }
            }

            // Perform DML operation outside of loop
            if(!oppToUpdate.isEmpty()) {
                update oppToUpdate;
            }

            isExecuting = false; // Reset flag after trigger execution
        }
    }
}