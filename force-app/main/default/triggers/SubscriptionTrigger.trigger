trigger SubscriptionTrigger on Subscription__C (before insert,before update)
{
    SubscriptionTriggerHandeler.SubscriptionUpdate();

}