trigger TotalNumberOfProducts on Opportunity (after update) {
   
        TotalNumberOfProductsTriggerHandler.updateTotalProducts(Trigger.new);
}