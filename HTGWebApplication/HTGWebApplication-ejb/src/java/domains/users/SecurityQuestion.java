package domains.users;

/**
 * Document   : SecurityQuestion.java
 * Version    : Jan 21, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: domain class for jdbc security_question table
 */
public final class SecurityQuestion {
    private final String QUESTION;
    private final String ANSWER;

    /**
     * Main class constructor
     * @param question the security QUESTION
     * @param answer the security ANSWER
     */
    private SecurityQuestion(String question, String answer) {
            this.QUESTION = question;
            this.ANSWER = answer;
    }
    
    private static SecurityQuestion obj=null;
    
    public static synchronized SecurityQuestion getInstance(String question, String answer){
	if(obj==null){
	    obj=new SecurityQuestion(question, answer);
	    return obj;
	}else{
	    return obj;
	}
    }

    /**
     * Method to get the qUESTION
     * @return the qUESTION
     */
    public synchronized final String getQUESTION() {
	    return QUESTION;
    }
    /**
     * Method to get the aNSWER
     * @return the aNSWER
     */
    public synchronized final String getANSWER() {
	    return ANSWER;
    }
}
