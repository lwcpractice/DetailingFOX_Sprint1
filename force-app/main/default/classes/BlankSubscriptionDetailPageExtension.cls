public with sharing class BlankSubscriptionDetailPageExtension {

    
    public Subscription__c Subscription {get; set;}
    public Customer_Vehicle_Info__C vehicle {get; set;}

    public BlankSubscriptionDetailPageExtension()
    {
        this.Subscription=new Subscription__c();
        this.vehicle=new Customer_Vehicle_Info__C();
        vehicle.Id=ApexPages.currentPage().getParameters().get('vehicleId');
        vehicle.Name=ApexPages.currentPage().getParameters().get('vehicleName');
        this.Subscription.Vehicle_Number__r=vehicle;
        //this.Subscription.Vehicle_Number__r.Name=vehicle.Name;

    }
    
    public PageReference VehiclepageRedirection() 
    {
        
        
        if (vehicle.Id != null)
        {
            return new PageReference('/apex/VehicleDetail?id='+vehicle.Id); 
        }
        else 
            {
                return new PageReference('/apex/VehicleDetail');
            }
        
      
      }

      public PageReference HomepageRedirection() 
    {
       return new PageReference('/apex/VehicleListHomePage');
      }

      public PageReference SaveDetail()
    {
        Subscription__c subs = new Subscription__c();
        //Customer_Vehicle_Info__C vh = new Customer_Vehicle_Info__C();
        subs.subscription_start_date__C=Subscription.subscription_start_date__c;
        subs.Subscription_Type__C=Subscription.Subscription_Type__c;
        //vh.id=vehicle.Id;
        //vh.Name=vehicle.Name;
        //subs.Vehicle_Number__r=vh;
        subs.Vehicle_Number__c=vehicle.Id;
        insert subs;
        return new PageReference('/apex/VehicleDetail?id='+vehicle.Id);
    }

    public void cancelDetail()
    {

    }
   
    
}