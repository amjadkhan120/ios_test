//
//  Content.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/23/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Content : NSManagedObject

@property (nonatomic, retain) NSString * created_date;
@property (nonatomic, retain) NSString * is_Shared;
@property (nonatomic, retain) NSNumber * item_id;
@property (nonatomic, retain) NSString * last_updated_by;
@property (nonatomic, retain) NSString * last_updated_date;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSNumber * mime_type;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * parent_id;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * path_by_id;
@property (nonatomic, retain) NSString * share_date;
@property (nonatomic, retain) NSString * share_id;
@property (nonatomic, retain) NSString* share_level;
@property (nonatomic, retain) NSNumber * shared_by;
@property (nonatomic, retain) NSNumber * size;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * trans_type;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * user_id;

+(Content *)addContentObjectWithDictionary:(NSDictionary *)contentDictionry;


@end
