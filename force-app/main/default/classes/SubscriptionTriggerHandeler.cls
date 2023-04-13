public with sharing class SubscriptionTriggerHandeler {
   
    public static void SubscriptionUpdate()
    {
        List<Subscription__C> sList= new List<Subscription__C>();
        sList = Trigger.New;
        for(Subscription__C subscription:sList)
        {
             if(subscription.Subscription_Type__c=='1 Day')
             {
                subscription.Subscription_End_Date__c = subscription.Subscription_Start_date__c+1;
                
             }
             else if(subscription.Subscription_Type__c=='1 Month')
             {
                subscription.Subscription_End_Date__c = subscription.Subscription_Start_date__c+30;
             }
            
             if (subscription.Subscription_End_Date__c > system.now())
             {
                subscription.Subscription_Status__c='Active';
             }
             else 
             {
                subscription.Subscription_Status__c='Inactive';
                
             }
            

        }
    }
}