//
//  ViewController.m
//  CookingAPP
//
//  Created by Flávio Silvério on 10/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configurePage];
}
- (void) configurePage{

    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 -self.view.frame.size.height / 7 , self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"purple"] forState:UIControlStateNormal];

    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2-self.view.frame.size.height / 7 + btn1.frame.size.height , self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"orange"] forState:UIControlStateNormal] ;
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 -self.view.frame.size.height / 7+ btn1.frame.size.height + btn2.frame.size.height , self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"blue"] forState:UIControlStateNormal] ;

    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 -self.view.frame.size.height / 7+ btn1.frame.size.height + btn2.frame.size.height + btn3.frame.size.height, self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal] ;
    
    float multiplier = self.view.frame.size.width / 451;
    float yPosition = 0;
    do{
        yPosition-=25;
    }while(yPosition + (multiplier* 307) > btn1.frame.origin.y);
    
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, yPosition , self.view.frame.size.width, 307 * multiplier)];
    [bg setImage:[UIImage imageNamed:@"bg2"]];
    
    [self.view addSubview:bg];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];

}

-(void)dictionary{

    
    NSDictionary *recipe = @{
                              @"id" : @"213123",
                              @"name" : @"lasanha de pato",
                              @"difficulty" : @"5",
                              @"ingredients" : @[
                                                @{
                                                    @"name" : @"massa",
                                                    @"quantity" : @"5 folhas"
                                                    },
                                                @{
                                                    @"name" : @"carne de pato",
                                                    @"quantity" : @"1KG"
                                                    }
                                                ],
                              @"steps" : @[
                                      @{
                                          @"stepNumber" : @"1",
                                          @"hasTimer" : @"NO",
                                          @"TotalTime" : @"45 minutes",
                                          @"timerTime" : @""
                                          }
                                      ]
                              };
    NSlog(@"%@",recipe);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
