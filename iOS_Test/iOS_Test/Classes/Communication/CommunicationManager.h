//
//  CommunicationManager.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/16/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"


@interface CommunicationManager : NSObject

@property (nonatomic, assign) id <ServerUpdateDelegate> updateDelegate;

-(void)checkForUpdate:(NSString*)url;

@end
