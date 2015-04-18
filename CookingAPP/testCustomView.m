//
//  testCustomView.m
//  CookingAPP
//
//  Created by Flávio Silvério on 11/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "testCustomView.h"

@implementation testCustomView 

- (void) viewDidLoad{
    
    customCollection *custom = [[customCollection alloc]initWithFrame:self.view.frame];
    [custom setCustomCollectionDelegate:self];
    [custom setBackgroundColor:[UIColor redColor]];
    [custom reloadCollection];
    
    [custom setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:custom];
    
}

- (int) numberOfItemsPerRow{
    return 2;
}
- (UIView *) itemForIndex{
    return nil;
}
- (float) heightForItemAtIndex:(int)index{
    return 0;
}

- (float) distanceBetweenCells{
    return 3;
}

- (int) totalNumberOfItems{
    return 30;
}
@end
