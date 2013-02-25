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

@property (nonatomic, retain) NSDate * created_date;
@property (nonatomic, retain) NSNumber * is_Shared;
@property (nonatomic, retain) NSNumber * item_id;
@property (nonatomic, retain) NSString * last_updated_by;
@property (nonatomic, retain) NSDate * last_updated_date;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSNumber * mime_type;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * parent_id;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSNumber * path_by_id;
@property (nonatomic, retain) NSDate * share_date;
@property (nonatomic, retain) NSNumber * share_id;
@property (nonatomic, retain) NSNumber * share_level;
@property (nonatomic, retain) NSNumber * shared_by;
@property (nonatomic, retain) NSNumber * size;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * trans_type;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * user_id;

@end
