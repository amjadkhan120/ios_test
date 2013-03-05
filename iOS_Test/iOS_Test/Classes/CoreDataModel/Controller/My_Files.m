//
//  My_Files.m
//  iOS_Test
//
//  Created by Amjad Khan on 2/24/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import "My_Files.h"
#import "Content.h"
#import "Content.h"
#import "AppDelegate.h"

@implementation My_Files

@dynamic id;
@dynamic name;
@dynamic contents;
@dynamic type;


+(My_Files *)addfilesWithDictionary:(NSDictionary *)filesDictionary type:(int)type;
{
    NSManagedObjectContext *context = (NSManagedObjectContext *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    My_Files *file = [NSEntityDescription insertNewObjectForEntityForName:@"My_Files" inManagedObjectContext:context];
    file.id = [filesDictionary objectForKey:@"id"];
    file.name = [filesDictionary objectForKey:@"name"];
    file.type = [NSNumber numberWithInt:type];
    NSArray *contentsArray = [filesDictionary objectForKey:@"content"];
    for (NSDictionary *content in contentsArray) {
        Content *tempContent = [Content addContentObjectWithDictionary:content];
        [file addContentsObject:tempContent];
    }
    return file;
}
@end
