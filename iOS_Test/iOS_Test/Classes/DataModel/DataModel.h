//
//  DataModel.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/16/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CommunicationManager.h"
#import "Protocols.h"

@interface DataModel : NSObject <ServerUpdateDelegate>

+(DataModel*)defaultManager;

-(void)checkForUpdate;

@end
