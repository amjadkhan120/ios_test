//
//  My_Files.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/24/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Content;

@interface My_Files : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * type;

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *contents;
@end

@interface My_Files (CoreDataGeneratedAccessors)

- (void)addContentsObject:(Content *)value;
- (void)removeContentsObject:(Content *)value;
- (void)addContents:(NSSet *)values;
- (void)removeContents:(NSSet *)values;

+(My_Files *)addfilesWithDictionary:(NSDictionary *)filesDictionary type:(int)type;

@end
