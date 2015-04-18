//
//  BDManager.h
//  CookingAPP
//
//  Created by Flávio Silvério on 18/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@import CoreData;
@interface BDManager : NSObject

@property (nonatomic) NSManagedObjectContext *context;

+ (id)sharedManager;
- (void) test;

- (NSArray *) getAllShoppingItems;
- (void) saveShoppingItem:(NSString *)name;


@end
