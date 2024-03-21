public class InsertRelatedContact_Handler {
  
    public static void addRelatedContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account act : accList){
            Contact con = new Contact();
            if(act.Rating == 'Hot'){
                con.AccountId = act.Id;
                con.LastName = 'Test related account';
                conList.add(con);
            }
        }
        insert conList;
    }
}