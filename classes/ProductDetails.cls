public class ProductDetails {
    public E_Product__c ordObj{get;set;}
   
    public List<E_Product__c> acc{get;set;}



  	public ProductDetails()
    {
        ordObj = new E_Product__c();
       loadAcc();
      
    }
    public void loadAcc()
    {
        acc = [select id,name,Brands__c,Category__c,Models__c,Cost__c,Approval_Status__c from E_Product__c order by createdDate desc];

    }
    public void SaveOrder()
    {         
        Database.upsertResult rs = Database.upsert(ordObj,false);     
        if(rs.isSuccess())
        {         
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Product is ordered!!!') ); 
            ordObj = new E_Product__c();  
         loadAcc();
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