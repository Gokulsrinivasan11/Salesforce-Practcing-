public class GetHighestAmountHandler {

    public static void getHighestAmount(list<Opportunity> oppList){
        list<AggregateResult> agg = [select Max(Amount) From Opportunity];
        for(AggregateResult opp : agg){
            Opportunity opt = new Opportunity();
            if(opt.Amount > opp){
                opt.HighestOpp__c = String.valueOf(opt.get('Max(Amount)'));
            }
            //opt.HighestOpp__c = String.valueOf(opt.get('Max(Amount)'));
        }
    } 
}