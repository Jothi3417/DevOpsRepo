public class ProductEditController {
    public List<E_Product__c> pro{get;set;}
    
    public Boolean isEdit {get;set;}

	public String delId{get;set;}
    
       
    public ProductEditController() {
    LoadData();
    }
    
    private void LoadData() {
    pro = [select id,Name,Brands__c,Category__c,Models__c,Cost__c,Approval_Status__c from E_Product__c];
    }
    
    public void DeleteAccount(){
     system.debug('delId' + delId);
      E_Product__c pro = [select id,Name from E_Product__c where Id =:delId];
    if (pro != null) {
    	Delete pro;
        LoadData();
    }
    }
    
}