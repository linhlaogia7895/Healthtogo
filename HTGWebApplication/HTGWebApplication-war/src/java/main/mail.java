/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author 552399
 */
public class mail {
    
public static void sendEmail(String to, String subject, String message) throws MessagingException
{
// Step1
Properties mailServerProperties = System.getProperties();
mailServerProperties.put("mail.smtp.port", "587");
mailServerProperties.put("mail.smtp.auth", "true");
mailServerProperties.put("mail.smtp.starttls.enable", "true");
 
// Step2
Session getMailSession = Session.getDefaultInstance(mailServerProperties, null);
MimeMessage generateMailMessage = new MimeMessage(getMailSession);
               
generateMailMessage.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
//generateMailMessage.addRecipient(MimeMessage.RecipientType.CC, new InternetAddress("test2@crunchify.com"));
generateMailMessage.setSubject(subject);
generateMailMessage.setContent(message, "text/html");
 
// Step3
javax.mail.Transport transport = getMailSession.getTransport("smtp");
 
// Enter your correct gmail UserID and Password
// if you have 2FA enabled then provide App Specific Password
transport.connect("smtp.gmail.com", "#Your gmail account email#", "#Password#");
transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
transport.close();
 
}
}
