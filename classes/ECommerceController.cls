public class ECommerceController {
public PageReference product(){
PageReference pr=new PageReference('/apex/AddProductPage');
return pr;
}
public PageReference order(){
PageReference pr=new PageReference('/apex/AddEditCancel');
return pr;
}
}