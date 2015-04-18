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
    
//    // Facebook Stuff
//    FBLoginView *loginView = [[FBLoginView alloc] init];
//    loginView.center = self.view.center;
//    [self.view addSubview:loginView];
//
//    UIButton *post = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 3 * self.view.frame.size.height/4, 100, 50)];
//    [post addTarget:self action:@selector(post:) forControlEvents:UIControlEventTouchUpInside];
//    [post setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:post];
    
    [self configurePage];
}
- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}
//- (void) viewDidDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:NO];
//
//}
- (void) configurePage{

    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 -self.view.frame.size.height / 7 , self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"purple"] forState:UIControlStateNormal];
    [btn1 setTitle:@"All Recipes Cooking" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[btn1 titleLabel]setTextAlignment:NSTextAlignmentCenter];
    [btn1 addTarget:self action:@selector(launchAllRecipes) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2-self.view.frame.size.height / 7 + btn1.frame.size.height , self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"orange"] forState:UIControlStateNormal] ;
    [btn2 setTitle:@"Favourite Recipes" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[btn2 titleLabel]setTextAlignment:NSTextAlignmentCenter];
    [btn2 addTarget:self action:@selector(launchSavedRecipes) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 -self.view.frame.size.height / 7+ btn1.frame.size.height + btn2.frame.size.height , self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"blue"] forState:UIControlStateNormal] ;
    [btn3 setTitle:@"My Recipes" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[btn3 titleLabel]setTextAlignment:NSTextAlignmentCenter];
    [btn3 addTarget:self action:@selector(launchMyCreation)forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 -self.view.frame.size.height / 7+ btn1.frame.size.height + btn2.frame.size.height + btn3.frame.size.height, self.view.frame.size.width, self.view.frame.size.height / 7)];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"yellow"] forState:UIControlStateNormal] ;
    [btn4 setTitle:@"Shopping List" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[btn4 titleLabel]setTextAlignment:NSTextAlignmentCenter];
    [btn4 addTarget:self action:@selector(showShoppingList) forControlEvents:UIControlEventTouchUpInside];
    
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

//-(void)dictionary{
//
//    
//    NSDictionary *recipe = @{
//                              @"id" : @"213123",
//                              @"name" : @"lasanha de pato",
//                              @"difficulty" : @"5",
//                              @"ingredients" : @[
//                                                @{
//                                                    @"name" : @"massa",
//                                                    @"quantity" : @"5 folhas"
//                                                    },
//                                                @{
//                                                    @"name" : @"carne de pato",
//                                                    @"quantity" : @"1KG"
//                                                    }
//                                                ],
//                              @"steps" : @[
//                                      @{
//                                          @"stepNumber" : @"1",
//                                          @"hasTimer" : @"NO",
//                                          @"TotalTime" : @"45 minutes",
//                                          @"timerTime" : @""
//                                          }
//                                      ]
//                              };
//   // NSlog(@"%@",recipe);
//
//}
- (IBAction)post:(id)sender{

    // NOTE: pre-filling fields associated with Facebook posts,
    // unless the user manually generated the content earlier in the workflow of your app,
    // can be against the Platform policies: https://developers.facebook.com/policy
    
    // Put together the dialog parameters
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"Sharing Tutorial", @"name",
                                   @"Build great social apps and get more installs.", @"caption",
                                   @"Allow your users to share stories on Facebook from your app using the iOS SDK.", @"description",
                                   @"https://developers.facebook.com/docs/ios/share/", @"link",
                                   @"http://i.imgur.com/g3Qc1HN.png", @"picture",
                                   nil];
    
    // Make the request
    [FBRequestConnection startWithGraphPath:@"/me/feed"
                                 parameters:params
                                 HTTPMethod:@"POST"
                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                              if (!error) {
                                  // Link posted successfully to Facebook
                                  NSLog(@"result: %@", result);
                              } else {
                                  // An error occurred, we need to handle the error
                                  // See: https://developers.facebook.com/docs/ios/errors
                                  NSLog(@"%@", error.description);
                              }
                          }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - going for other pages
- (void) launchSavedRecipes{

    [self performSegueWithIdentifier:@"showMyRecipes" sender:self];
}

- (void) launchMyCreation{

    [self performSegueWithIdentifier:@"showMine" sender:self];
}

- (void) launchAllRecipes{
    
    [self performSegueWithIdentifier:@"showAllRecipes" sender:self];
}

- (void) showShoppingList{
    [self performSegueWithIdentifier:@"showShoppingList" sender:self];
}

@end
