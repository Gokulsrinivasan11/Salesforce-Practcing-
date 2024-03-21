@isTest
public class AddAndDeleteContactHandler_Test {

    @testSetup static void createTestRecs(){
        Account acc = new Account();
        acc.Name = 'Test';
        acc.NumberofLocations__c = 5;
        insert acc;
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'Test Contact';
        insert con;
    }
    @isTest
    public static void createNumberOfContacts(){
        list<Account> acc = [Select id,name,NumberofLocations__c From Account];
        Contact con = [Select id,LastName From Contact limit 1];
        Test.startTest();
        AddAndDeleteContactHandler.createNumberOfContacts(acc);
        AddAndDeleteContactHandler.updateOrDeleteNumberOfContacts(acc);
        Test.stopTest();
    }
}