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
#import "AppDelegate.h"
#import "CoreDataHandler.h"
@implementation DataModel


static DataModel *defaultManager = nil;


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
    
    /// Only Save This Data if the Revision Number is Differeent
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] deleteStore];

    NSManagedObjectContext *context = (NSManagedObjectContext *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];

    [Base addBaseObjectWithDictionary:dataDic];
//    [My_Files addfilesWithDictionary:[dataDic objectForKey:@"my_files"] type:1];
//    [My_Files addfilesWithDictionary:[dataDic objectForKey:@"shared_files"] type:2];
    NSError *error;
    if (![context save:&error]) {
        [context reset];
        NSLog(@"Data Not Saved Properly"); 
    }
    ////
    // This is the test code to fetch the results ///
    NSArray *arr = [CoreDataHandler getEntityFromDBWithName:@"Base"];


    Base *base = [arr objectAtIndex:0];
    
   NSArray *files = [base.files allObjects];
    for (My_Files *file in files) {
        NSLog(@"file:Name %@",file.name);
        NSArray *contents = [file.contents allObjects];
        for(Content *cont in contents)
            NSLog(@"content:Name %@",cont.name);
    }
    
}
@end
