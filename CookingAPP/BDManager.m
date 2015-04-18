//
//  BDManager.m
//  CookingAPP
//
//  Created by Flávio Silvério on 18/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "BDManager.h"

@implementation BDManager

#pragma mark Singleton Methods

+ (id)sharedManager {
    static BDManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        
      //  AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

      //  _context = appDelegate.managedObjectContext;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (void) test{

    NSLog(@"yup");
}

#pragma mark - 
#pragma mark - Shopping List Methods

- (NSArray *) getAllShoppingItems{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ShoppingItem" inManagedObjectContext:_context];
    [fetchRequest setEntity:entity];

    NSError *error = nil;
    return  [_context executeFetchRequest:fetchRequest error:&error];

}

- (void) saveShoppingItem:(NSString *)name{

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ShoppingItem" inManagedObjectContext:_context];
    [fetchRequest setEntity:entity];
    
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:_context];
    [newManagedObject setValue:name forKey:@"name"];
    [newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"quantity"];

    
    NSError *error;
    if (![_context save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
}

@end
