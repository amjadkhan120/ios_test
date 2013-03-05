//
//  Content.m
//  iOS_Test
//
//  Created by Amjad Khan on 2/23/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import "Content.h"
#import "AppDelegate.h"

@implementation Content

@dynamic created_date;
@dynamic is_Shared;
@dynamic item_id;
@dynamic last_updated_by;
@dynamic last_updated_date;
@dynamic link;
@dynamic mime_type;
@dynamic name;
@dynamic parent_id;
@dynamic path;
@dynamic path_by_id;
@dynamic share_date;
@dynamic share_id;
@dynamic share_level;
@dynamic shared_by;
@dynamic size;
@dynamic status;
@dynamic trans_type;
@dynamic type;
@dynamic user_id;

+(Content *)addContentObjectWithDictionary:(NSDictionary *)contentDictionry
{
    NSManagedObjectContext *context = (NSManagedObjectContext *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    Content *content = [NSEntityDescription insertNewObjectForEntityForName:@"Content" inManagedObjectContext:context];
    content.created_date = [contentDictionry objectForKey:@"created_date"];
    content.is_Shared = [contentDictionry objectForKey:@"is_Shared"];
    content.item_id = [contentDictionry objectForKey:@"item_id"];
    content.last_updated_by = [contentDictionry objectForKey:@"last_updated_by"];
    content.last_updated_date = [contentDictionry objectForKey:@"last_updated_date"];
    content.link = [contentDictionry objectForKey:@"link"];
    content.mime_type = [contentDictionry objectForKey:@"mime_type"];
    content.name = [contentDictionry objectForKey:@"name"];
//    content.parent_id = [contentDictionry objectForKey:@"parent_id"];
    content.path = [contentDictionry objectForKey:@"path"];
    content.path_by_id = [contentDictionry objectForKey:@"path_by_id"];
    content.share_date = [contentDictionry objectForKey:@"share_date"];
    content.share_id = [contentDictionry objectForKey:@"share_id"];
    NSString *string = [NSString stringWithFormat:@"%@",[contentDictionry objectForKey:@"share_level"]];
    content.share_level = string;
//    content.share_level = [contentDictionry objectForKey:@"share_level"];
    content.shared_by = [contentDictionry objectForKey:@"shared_by"];
    content.size = [contentDictionry objectForKey:@"size"];
   content.status = [contentDictionry objectForKey:@"status"];
    content.trans_type = [contentDictionry objectForKey:@"trans_type"];
    content.type = [contentDictionry objectForKey:@"type"];
    content.user_id = [contentDictionry objectForKey:@"user_id"];
    return content;
    
}
@end
