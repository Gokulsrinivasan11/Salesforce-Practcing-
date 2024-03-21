public class MyApexPractices {

@AuraEnabled
    public static List<Gym__c> getCreateRecords(String recordName,Integer ages,String mobile, String times, String address){
        List<Gym__c> gym = new List<Gym__c>();
        Gym__c gy = [select Id,Name,Enter_Age__c,Mobile_Number__c,Choose_Time__c,Fresher__c,Address__c From Gym__c limit 1];
        gy.Name = recordName;
        gy.Enter_Age__c = ages;
        gy.Mobile_Number__c = mobile;
        gy.Choose_Time__c = times;  
        gy.Address__c = address;
        gym.add(gy);
        System.debug('Entered values users  gym ######    ' + gym);
        insert gym;
        return gym;
    }

    @AuraEnabled
    public static List<String> getPicklistValues() {
        List<String> picklistValues = new List<String>();
        Schema.DescribeFieldResult fieldResult = Gym__c.Choose_Time__c.getDescribe();
        for (Schema.PicklistEntry picklistEntry : fieldResult.getPicklistValues()) {
            picklistValues.add(picklistEntry.getValue());
        }
        return picklistValues;
    }


      
    
}