//
//  RecipeDetails.m
//  CookingAPP
//
//  Created by Flávio Silvério on 19/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "RecipeDetails.h"

@implementation RecipeDetails

- (void) viewDidLoad{

    [super viewDidLoad];

    self.title = [_recipe valueForKey:@"title"];
    [self configureScrollView];
    [self configureSteps];
}


- (void) configureScrollView{
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [scroll setDelegate:self];
    [scroll setPagingEnabled:YES];
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake([[_recipe valueForKey:@"steps"]count] * self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - 50)];
    [scroll setTag:1];

    [scroll setBackgroundColor:[UIColor greenColor]];
    
    NSLog(@"%lu", [[_recipe valueForKey:@"steps"]count]);
    
    [self.view addSubview:scroll];
}


- (void) configureSteps{

    
    NSArray *steps = [_recipe valueForKey:@"steps"];
    
    UIImageView *stepImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*[steps count], 100)];
    [stepImage setImage:[UIImage imageNamed:@"food"]];
    [[self.view viewWithTag:1]addSubview:stepImage];

    for (int i=0; i<[steps count]; i++) {
        

        
        
      //  UILabel *stepTitle;
        
    }

    
    
    
    

}

@end
