public with sharing class CutomerVehicleClass 
{
    public Id selectedVehicleId{get;set;}
    public ApexPages.StandardSetController vehicleListController { get; set; }
    public String searchKeyword {get;set;}
    public List<Customer_Vehicle_Info__c> vehicleInfoList {get;set;}
    public CutomerVehicleClass(ApexPages.StandardSetController controller) {
        this.vehicleListController = controller;
    }

    
    public PageReference showVehicleDetails() {
        return new PageReference('/apex/VehicleDetail?id=' + selectedVehicleId);
    }

    public void performSearch() {
        if(searchKeyword.length()!=0)
        {
            String searchQuery = 'SELECT Id, Name, Customer_Name__c, Customer_Mobile_Number__c, Premise_Name__c FROM Customer_Vehicle_Info__c WHERE Name LIKE \'%' + searchKeyword + '%\'';
            vehicleInfoList = Database.query(searchQuery);
            
        }
        
    }
}