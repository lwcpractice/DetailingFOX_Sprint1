public with sharing class SubscriptionDetailPageExtension {
    public ApexPages.StandardController SubscriptionController { get; set; }
    
    public Subscription__c SubInfo {get; set;}
    public SubscriptionDetailPageExtension(ApexPages.StandardController standardController) 
    {
        this.SubscriptionController = standardController;

        SubInfo =(Subscription__c)standardController.getRecord();
    }
    public PageReference VehiclepageRedirection() 
    {
        
        string vehicleId=SubInfo.Vehicle_Number__r.Id;
       return new PageReference('/apex/VehicleDetail?id='+vehicleId);
      }

      public PageReference HomepageRedirection() 
    {
       return new PageReference('/apex/VehicleListHomePage');
      }
    public PageReference SaveDetail()
    {
        Subscription__c InsertSubscriptionDetails = new Subscription__c();
        InsertSubscriptionDetails.Id=SubInfo.Id;
        InsertSubscriptionDetails.subscription_start_date__C=SubInfo.subscription_start_date__C;
        InsertSubscriptionDetails.Subscription_Type__C=SubInfo.Subscription_Type__C;
        InsertSubscriptionDetails.Subscription_Status__C=SubInfo.Subscription_Status__C;
        
        upsert InsertSubscriptionDetails;

        return new PageReference('/apex/VehicleDetail?id='+SubInfo.Vehicle_Number__r.Id);


    }

    public void cancelDetail()
    {

    }
    
  
}