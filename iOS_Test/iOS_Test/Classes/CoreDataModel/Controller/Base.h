//
//  Base.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/23/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Base : NSManagedObject

@property (nonatomic, retain) NSString * availableSpace;
@property (nonatomic, retain) NSString * last_rev_id;
@property (nonatomic, retain) NSString * mode;
@property (nonatomic, retain) NSString * pendingRequest;
@property (nonatomic, retain) NSString * totalspace;
@property (nonatomic, retain) NSString * usedSpace;

@end
