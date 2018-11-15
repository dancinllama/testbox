/**
 * TestFactory
 * This is an example test factory class, created for the Testing in a Box meetup on 11/9
 * for the Minnesota Developer Group.  This is not a cheat sheet for the testing in lightning
 * Trailhead badge, but more so supplemental material.
 * @author James Loghry
 * @date 11/9/2018
 */

/* 
 * Utility functions for tests (like "test factories") should be public.  
 * However, believe it or not these public classes 
 * will NOT count towards nor against your code coverage.
 */
@isTest
public class TestFactory {
    
    public static User createUser(String profileName){
        UserRole userRole = new UserRole(
            DeveloperName = 'SuperHero',
            Name = 'Super Hero'
        );
        insert userRole;
        
        Id profileId = [Select Id FROM Profile WHERE Name = :profileName].Id;
        User u = new User(
            ProfileId = profileId,
            LastName = 'last',
            Email = 'bruce.wayne@wayneenterprises.com',
            Username = 'iambatman@wayneenterprises.com',
            CompanyName = 'Wayne Enterprises',
            Title = 'CEO',
            Alias = 'batman',
            TimeZoneSidKey = 'America/Chicago',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = userRole.Id
        );
        insert u;
        return u;
    }
}
