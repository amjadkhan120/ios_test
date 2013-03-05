//
//  CoreDataHandler.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/24/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface CoreDataHandler : NSObject
+(NSArray*)getEntityFromDBWithName:(NSString*)entityName ;
+(NSArray *)getAllMyFiles;
+(NSArray *)getAllSharedFiles;

@end
