//
//  customCollection.m
//  CookingAPP
//
//  Created by Flávio Silvério on 11/04/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "customCollection.h"

@implementation customCollection

//@synthesize delegate;

- (int) numberOfItemsPerRow{    
    return [[self customCollectionDelegate] numberOfItemsPerRow];
}
- (UIView *) itemForIndex{
    return nil;
}
- (float) heightForItemAtIndex:(int)index{
    return [[self customCollectionDelegate] heightForItemAtIndex:(int)index];
}

- (float)distanceBetweenCells{
    return [[self customCollectionDelegate] distanceBetweenCells];
}

- (int)totalNumberOfItems{
    return [[self customCollectionDelegate] totalNumberOfItems];
}


- (void) reloadCollection{

    int numberOfItemsInRow = [self numberOfItemsPerRow];
    int totalNumberOfItems = [self totalNumberOfItems];
    float spaceBetweenItems = 2;
    float itemWidth = (self.frame.size.width - spaceBetweenItems*(numberOfItemsInRow+1))/numberOfItemsInRow;
    
    int currentItemColumn=0, currentItemLine=0;
    
    float itemsYPosition[numberOfItemsInRow];
    
    for (int i=0; i<numberOfItemsInRow; i++) {
        itemsYPosition[i]=spaceBetweenItems;
    }

    for (int i=0; i<totalNumberOfItems; i++) {
        
        //float low_bound = 100;
        //float high_bound = 400;
        //float rndYValue = (((float)arc4random()/0x100000000)*(high_bound-low_bound)+low_bound);
        float rndYValue = 500;

        if(currentItemColumn == numberOfItemsInRow){
            currentItemColumn = 0;
            currentItemLine++;
            
            for (int j=0; j<numberOfItemsInRow; j++) {
                itemsYPosition[j]+=rndYValue;
            }
        }
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [text setText:[NSString stringWithFormat:@"%d",i]];
        [text setTextColor:[UIColor redColor]];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(spaceBetweenItems + spaceBetweenItems*currentItemColumn + itemWidth*currentItemColumn + spaceBetweenItems * (itemsYPosition[i]/rndYValue), itemsYPosition[currentItemColumn] + currentItemLine*spaceBetweenItems , itemWidth, rndYValue)];
        [view setTag:i];
        [view addSubview:text];
        [view setBackgroundColor:[UIColor whiteColor]];
        
        //NSLog(@"XPos: %d   XSize: %f",currentItemColumn*5 + 50*currentItemColumn,itemWidth);
        NSLog(@"x: %d Y: %f XSize: %f YSize: %f",currentItemColumn*5 + 50*currentItemColumn,itemsYPosition[currentItemColumn] + currentItemLine*spaceBetweenItems,itemWidth ,rndYValue);

        [self addSubview:view];
        
        currentItemColumn++;
    }
    
    [self setContentSize:CGSizeMake(self.frame.size.width, (totalNumberOfItems/numberOfItemsInRow)*(300 + spaceBetweenItems))];
}

@end
