//
//  Protocols.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/16/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>

// Server Updater Delegate
@protocol ServerUpdateDelegate <NSObject>

-(void)updateReady:(NSString*)data;

@end