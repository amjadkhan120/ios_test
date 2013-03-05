//
//  CoreDataHandler.m
//  iOS_Test
//
//  Created by Amjad Khan on 2/24/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import "CoreDataHandler.h"
#import "AppDelegate.h"
@implementation CoreDataHandler

+(NSArray*)getEntityFromDBWithName:(NSString*)entityName {
    NSArray *fetchedObjects = nil;
    NSManagedObjectContext *context = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    @try {
        
        context = (NSManagedObjectContext *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        if ([context hasChanges])
        {
            [context reset];
        }
        
        NSError *error;
        NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                                  inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    }
    @catch (NSException *exception) {
        NSLog(@"core data exception occured.");
        fetchedObjects = nil;
    }
    [fetchRequest release];
    if (![NSThread isMainThread]) {
        NSLog(@"not main thread");
        //  [context release];
    }
    return fetchedObjects;
}

+(NSArray*)getEntityFromDBWithName:(NSString*)entityName predicate:(NSPredicate *)predicate sortDiscriptors:(NSArray *)discriptors {
    NSArray *fetchedObjects = nil;
    NSManagedObjectContext *context = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    @try {
        
        context = (NSManagedObjectContext *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        if ([context hasChanges])
        {
            [context reset];
        }
        
        NSError *error;
        NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                                  inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        [fetchRequest setSortDescriptors:discriptors];
        [fetchRequest setPredicate:predicate];
        fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    }
    @catch (NSException *exception) {
        NSLog(@"core data exception occured.");
        fetchedObjects = nil;
    }
    [fetchRequest release];
    return fetchedObjects;
}
+(NSArray *)getAllMyFiles
{
   return [CoreDataHandler getEntityFromDBWithName:@"My_Files" predicate:[NSPredicate predicateWithFormat:@"type == %@", [NSNumber numberWithInt:1]] sortDiscriptors:nil];
}
+(NSArray *)getAllSharedFiles
{
  return [CoreDataHandler getEntityFromDBWithName:@"My_Files" predicate:[NSPredicate predicateWithFormat:@"type == %@", [NSNumber numberWithInt:2]] sortDiscriptors:nil];

}

@end
