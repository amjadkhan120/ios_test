//
//  AppDelegate.h
//  iOS_Test
//
//  Created by Amjad Khan on 2/16/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
	NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
- (NSManagedObjectContext *) managedObjectContext;
-(void)deleteStore;

@end
