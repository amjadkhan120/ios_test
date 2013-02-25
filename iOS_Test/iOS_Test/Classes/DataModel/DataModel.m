//
//  DataModel.m
//  iOS_Test
//
//  Created by Amjad Khan on 2/16/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import "DataModel.h"
#import "SBJSON.h"
#import "Base.h"
#import "My_Files.h"
#import "Content.h"

@implementation DataModel


static DataModel *defaultManager = nil;

@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistantStoreCoordinator;


#pragma mark - Singleton Initilization -


-(id)init{
    self = [super init];
    
    if(self){
        // Initialization code...
        
    }
    return self;
}


+(DataModel*)defaultManager
{
	if(defaultManager == nil)
	{
		defaultManager  = [[super allocWithZone:NULL]init];
		
	}
	
	return defaultManager;
}
+(id)allocWithZone:(NSZone *)zone
{
	return [[self defaultManager] retain];
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
	
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (id)autorelease
{
    return self;
}



// check server for any update

-(void)checkForUpdate{
    
    CommunicationManager *checkServer = [[[CommunicationManager alloc]init] autorelease];
    checkServer.updateDelegate = self;
    [checkServer checkForUpdate:@"https://gist.github.com/anonymous/4680060/raw/aac6d818e7103edfe721e719b1512f707bcfb478/sample.json"];
}

// Process updated Data
-(void)updateReady:(NSString *)data{
    SBJSON *jsonParser = [[SBJSON alloc]init];
    NSDictionary *dataDictionary = [jsonParser objectWithString:data];
    
    // save data to database
    [self saveData:dataDictionary];
    
    
    // update view
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update_view" object:nil];
}

-(void)saveData:(NSDictionary*)dataDic{
    Base *_baseTable = [NSEntityDescription insertNewObjectForEntityForName:@"Base" inManagedObjectContext:[self managedObjectContext]];
    
    // set properites
    if([dataDic valueForKey:@"availableSpace"])
        [_baseTable setAvailableSpace:[dataDic valueForKey:@"availableSpace"]];
    if([dataDic valueForKey:@"last_rev_id"])
        [_baseTable setLast_rev_id:[dataDic valueForKey:@"last_rev_id"]];
    if([dataDic valueForKey:@"mode"])
        [_baseTable setMode:[dataDic valueForKey:@"mode"]];
    if([dataDic valueForKey:@"totalSpace"])
        [_baseTable setTotalspace:[dataDic valueForKey:@"totalSpace"]];
    
}


#pragma mark - Core Data stack -


// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistantStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}




@end
