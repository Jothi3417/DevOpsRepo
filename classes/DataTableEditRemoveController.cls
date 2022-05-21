public class DataTableEditRemoveController {
    
public List<Order__C> odd{ get; set; }
public Boolean isEdit {get; set;}
public String delId{ get; set; }

public DataTableEditRemoveController() {

LoadData();
}
private void LoadData() {
odd = [Select id,Customer_Name__c,Email__c,Phone__c,Address__c,Product__c,Quantity__c,GST_number__c,Order_Status__c,Order_Date__C,Total_Price__c from Order__C limit 20];
}
public void DeleteAccount(){
system.debug('delId' + delId);
Order__C ord = [select id,Name from Order__C where Id =:delId];
if (ord != null) {
Delete ord;
LoadData();
}
}

}