//
//  Base.m
//  iOS_Test
//
//  Created by Amjad Khan on 3/5/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import "Base.h"
#import "My_Files.h"
#import "AppDelegate.h"


@implementation Base

@dynamic availableSpace;
@dynamic last_rev_id;
@dynamic mode;
@dynamic pendingRequest;
@dynamic rev_id;
@dynamic totalspace;
@dynamic usedSpace;
@dynamic files;

+(void)addBaseObjectWithDictionary:(NSDictionary *)baseDictionary
{
    NSManagedObjectContext *context = (NSManagedObjectContext *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    Base *_baseTable = [NSEntityDescription insertNewObjectForEntityForName:@"Base" inManagedObjectContext:context];
    
    // set properites
    if([baseDictionary valueForKey:@"availableSpace"])
        [_baseTable setAvailableSpace:[baseDictionary valueForKey:@"availableSpace"]];
    if([baseDictionary valueForKey:@"last_rev_id"])
        [_baseTable setLast_rev_id:[baseDictionary valueForKey:@"last_rev_id"]];
    if([baseDictionary valueForKey:@"mode"])
        [_baseTable setMode:[baseDictionary valueForKey:@"mode"]];
    if([baseDictionary valueForKey:@"totalSpace"])
        [_baseTable setTotalspace:[baseDictionary valueForKey:@"totalSpace"]];
    if([baseDictionary valueForKey:@"rev_id"])
        [_baseTable setRev_id:[baseDictionary valueForKey:@"rev_id"]];
    if([baseDictionary valueForKey:@"my_files"]){
        My_Files *files = [My_Files addfilesWithDictionary:[baseDictionary valueForKey:@"my_files"] type:1];
        [_baseTable addFilesObject:files];
    }
    if([baseDictionary valueForKey:@"shared_files"]){
        My_Files *share = [My_Files addfilesWithDictionary:[baseDictionary valueForKey:@"shared_files"] type:2];
        [_baseTable addFilesObject:share];
    }
}

@end
