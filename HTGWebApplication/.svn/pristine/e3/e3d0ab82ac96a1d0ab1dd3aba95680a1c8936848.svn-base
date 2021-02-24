/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nutritionist;

import java.util.ArrayList;

public class invoiceHelper{
    String firstName;
     String lastName;
     
     public invoiceHelper(){
         
     }
     
     public invoiceHelper(String firstName, String lastName){
         this.firstName=firstName;
         this.lastName=lastName;
     }
     
     public String getFirstName(){
         return firstName;
         
     }
     
     public String getLastName(){
         return lastName;
     }
     
     
     public String getInvoiceTable(ArrayList<String> Table)
     {
         
        String table="<table border='1'>";
                    table += "<tr>";
	table += "<th>First Name</th><th>Last Name</th><th>Balance</th>";
	table += "</tr>";
        
        for(int i=0;i<Table.size();i++){
           String[] line=Table.get(i).split(",");
            
                table += "<tr>";
                table += "<td>" + line[0] + "</td>"; 
                table += "<td>";   
                table += "<a href='UserOps?reset=" + line[0] + "'>Reset</a>"; 
                table += "</td>";
                table += "<td>";   
                table += "<a href='UserOps?delete=" + line[0] + "'>Delete</a>"; 
                table += "</td>";
                table += "</tr>";
        }
	table += "</table>";
	return table;
    }
     
}