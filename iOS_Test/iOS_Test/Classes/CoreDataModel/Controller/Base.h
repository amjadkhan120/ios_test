//
//  Base.h
//  iOS_Test
//
//  Created by Amjad Khan on 3/5/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class My_Files;

@interface Base : NSManagedObject

@property (nonatomic, retain) NSNumber * availableSpace;
@property (nonatomic, retain) NSNumber * last_rev_id;
@property (nonatomic, retain) NSString * mode;
@property (nonatomic, retain) NSNumber * pendingRequest;
@property (nonatomic, retain) NSNumber * rev_id;
@property (nonatomic, retain) NSNumber * totalspace;
@property (nonatomic, retain) NSNumber * usedSpace;
@property (nonatomic, retain) NSSet *files;

+(void)addBaseObjectWithDictionary:(NSDictionary *)baseDictionary;


@end

@interface Base (CoreDataGeneratedAccessors)

- (void)addFilesObject:(My_Files *)value;
- (void)removeFilesObject:(My_Files *)value;
- (void)addFiles:(NSSet *)values;
- (void)removeFiles:(NSSet *)values;

@end
