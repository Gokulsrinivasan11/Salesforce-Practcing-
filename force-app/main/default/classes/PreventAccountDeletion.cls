public class PreventAccountDeletion {
    public static void preventFromDelete(list<Account> dltAcc){
        Id getUserId = UserInfo.getUserId();
        Profile pro = [Select id,name From Profile Where id =: getUserId];
        for(Account acc: dltAcc){
            if(pro.Name != 'System Administrator'){
                acc.addError('System admin can only delete the account record.');
                
            }
            
        }
        
    }

}