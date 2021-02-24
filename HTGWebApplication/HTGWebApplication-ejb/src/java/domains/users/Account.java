
package domains.users;

/**
 * Document   : Account.java
 * Version    : Jan 21, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: domain class using Singleton for jdbc Account table
 */
public class Account {
    private final int ACCOUNT_ID;
    private final String USERNAME;
    private final String PASSWORD;
    private final String USER_TYPE;
    private final int LOCK_STATUS;

    /**
     * main constructor
     * @param account_id the account id
     * @param username the account USERNAME
     * @param password the account PASSWORD
     * @param user_type the account user type
     * @param lock_status the account lock status
     */
    private Account(int account_id, String username, String password, String user_type, int lock_status) {
        this.ACCOUNT_ID = account_id;
        this.USERNAME = username;
        this.PASSWORD = password;
        this.USER_TYPE = user_type;
        this.LOCK_STATUS = lock_status;
    }
    
    private static Account obj=null;
    
    public static synchronized Account getInstance(int account_id, String username, String password, String user_type, int lock_status){
	if(obj==null){
	    obj=new Account(account_id, username, password, user_type, lock_status);
	    return obj;
	}else{
	    return obj;
	}
    }

    /**
     * Method to get the aCCOUNT_ID
     * @return the aCCOUNT_ID
     */
    public synchronized final int getACCOUNT_ID() {
	    return ACCOUNT_ID;
    }
    /**
     * Method to get the uSERNAME
     * @return the uSERNAME
     */
    public synchronized final String getUSERNAME() {
	    return USERNAME;
    }
    /**
     * Method to get the pASSWORD
     * @return the pASSWORD
     */
    public synchronized final String getPASSWORD() {
	    return PASSWORD;
    }
    /**
     * Method to get the uSER_TYPE
     * @return the uSER_TYPE
     */
    public synchronized final String getUSER_TYPE() {
	    return USER_TYPE;
    }
    /**
     * Method to get the lOCK_STATUS
     * @return the lOCK_STATUS
     */
    public synchronized final int getLOCK_STATUS() {
	    return LOCK_STATUS;
    }
}
