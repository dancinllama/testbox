/**
* TestingInABox
* This is an example test class, created for the Testing in a Box meetup on 11/9
* for the Minnesota Developer Group.  This is not a cheat sheet for the testing in lightning
* Trailhead badge, but more so supplemental material.
* @author James Loghry
* @date 11/9/2018
*/
@isTest
private class TestingInABox {
    
    //Positive testing!
    static testmethod void testAccountCreation(){
        Test.startTest();
        insert new Account(
            Name='Wayne Enterprises'
        );
        Test.stopTest();
        
        List<Account> results = [Select Id From Account];
        System.assertEquals(1,results.size());
    }
    
    //Negative testing :(
    static testmethod void testAccountFailure(){
        boolean exceptionThrown = false;
        
        Test.startTest();
        try{
            //Inserting account without a required field.  
            insert new Account();
        }catch(Exception ex){
            exceptionThrown = true;    
        }
        Test.stopTest();
        
        //All the assert, assertEquals, assertNotEquals have an optional parameter
        //For passing in messages.
        //These messages will show in the logs or developer console, etc. when a failure happens.
        //And they make unit testing easier to debug.
        System.assert(exceptionThrown,'Account was actually created.');
    }
    
    //Bulk testing
    static testmethod void testAccountBulkCreation(){
        
        Test.startTest();
        List<Account> accounts = new List<Account>();
        for(Integer i =0; i < 200; i ++){
            accounts.add(
                new Account(
                    Name='Wayne Enterprises'
                )
            );
        }
        insert accounts;
        Test.stopTest();
        
        List<Account> results = [Select Id From Account];
        System.assertEquals(200,results.size());
    }
    
    //Permissions testing
    static testmethod void testAccountCreationAdmin(){
        User u = TestFactory.createUser('Profile1');    
        
        Test.startTest();
        System.runAs(u){
            insert new Account(
                Name='Wayne Enterprises'
            );
        }
        Test.stopTest();
        
        List<Account> results = [Select Id From Account];
        System.assertEquals(1,results.size());
    }
    
    //Negative, Permissions testing.
    //Test profiles that the application should NOT have access too!
    static testmethod void testAccountCreationSales(){
        /*
         * For Test Driven Development (TDD), you can create tests for each use case
         * as you start developing.
         * That way, you have a good idea of what the end result should be.
         * To start, the test should fail so that it will block your deployment until both
         * the development and the unit tests are completed.
         */
        System.assert(false,'Should be testing the Sales profile permissions, but test is not implemented yet.');
    }
}
