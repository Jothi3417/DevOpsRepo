public class AddProduct {
     public E_Product__c pc{get;set;}

    
  	public AddProduct()
    {
        pc = new E_Product__c();
      
    }
    public PageReference cancelproduct(){
PageReference pr=new PageReference('/apex/ProductDetailsPage');
return pr;
}
    public PageReference editproduct(){
PageReference pr=new PageReference('/apex/Product');
return pr;
}
   
    public void saveproduct()
    {

        Database.saveResult rs = Database.insert(pc,false);
        
        if(rs.isSuccess())
        {         
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Your product is created') ); 
            
        }
        else{
            List<Database.Error> errs= rs.getErrors();
            for(Database.Error err : errs)
            {
            	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,err.getMessage()) );  
            }
        }
        
    }

}