public with sharing class CustomerVehicleInfoExtension {
    public ApexPages.StandardController vehicleController { get; set; }
    
    public Customer_Vehicle_Info__c vehicleInfo {get; set;}
    public Id selectedSubsId{get;set;}

    public CustomerVehicleInfoExtension(ApexPages.StandardController standardController)
     {
        this.vehicleController = standardController;

        vehicleInfo =(Customer_Vehicle_Info__C)standardController.getRecord();
    }
   
   

  
    

    public PageReference SaveDetail()
    {
        system.debug(vehicleInfo);
        Customer_Vehicle_Info__C InsertVehicleDetails = new Customer_Vehicle_Info__C();
        InsertVehicleDetails.Id=vehicleInfo.Id;
        InsertVehicleDetails.Name=vehicleInfo.Name;
        InsertVehicleDetails.Vehicle_Type__c=vehicleInfo.Vehicle_Type__c;
        InsertVehicleDetails.Customer_Name__c=vehicleInfo.Customer_Name__c;
        InsertVehicleDetails.Customer_Mobile_Number__c=vehicleInfo.Customer_Mobile_Number__c;
        InsertVehicleDetails.Customer_Email__c=vehicleInfo.Customer_Email__c;
        InsertVehicleDetails.Premise_Name__c=vehicleInfo.Premise_Name__c;
        InsertVehicleDetails.Customer_address__c=vehicleInfo.Customer_address__c;
        upsert InsertVehicleDetails;
        return new PageReference('/apex/VehicleListHomePage');

    }

    public PageReference HomepageRedirection() 
    {
       return new PageReference('/apex/VehicleListHomePage');
      }

      public void cancelDetail()
      {
        
      }


      public PageReference showSubsDetails() 
      {
         return new PageReference('/apex/subscriptionDetailPage?id='+selectedSubsId);
    } 

    public PageReference newsubscription() 
    {

        PageReference Blanksubscription =new PageReference('/apex/BlanksubscriptionDetailPage');
        Blanksubscription.getParameters().put('vehicleName', vehicleInfo.Name);
        Blanksubscription.getParameters().put('vehicleId', vehicleInfo.Id);
        return Blanksubscription;
  } 


}
