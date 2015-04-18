//
//  customCollection.h
//  CookingAPP
//
//  Created by Flávio Silvério on 11/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import <UIKit/UIKit.h>

@class customCollectionDelegate;

@protocol customCollectionDelegate <UIScrollViewDelegate>

@required
- (int) numberOfItemsPerRow;
- (UIView *) itemForIndex;
- (float) heightForItemAtIndex:(int)index;
- (float) distanceBetweenCells;
- (int) totalNumberOfItems;

@optional


@end

@interface customCollection : UIScrollView
    
//    id <customCollectionDelegate> customCollectionDelegate;
//    NSMutableArray *items;
//    


@property (nonatomic, weak) id <customCollectionDelegate> customCollectionDelegate;

- (void) reloadCollection;

@end
