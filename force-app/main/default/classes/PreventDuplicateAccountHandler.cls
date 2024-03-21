public class PreventDuplicateAccountHandler {

    public static void getDuplicateAcc(list<Account> accList){
            for(Account acc :[Select id,Name From Account] ){
                for(Account act : accList){
            if(act.Name != null && act.Name == acc.Name){
                act.addError('The account name is already being used.');
                
            }
        }
        
            
        }
        
    }
}