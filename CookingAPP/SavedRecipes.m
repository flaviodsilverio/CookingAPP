//
//  MyRecipes.m
//  CookingAPP
//
//  Created by Flávio Silvério on 15/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "SavedRecipes.h"

@implementation SavedRecipes


- (void) viewDidLoad{

    [super viewDidLoad];
    self.title = @"My Saved Recipes";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(enterEditing)];
    self.navigationItem.rightBarButtonItem = item;
    
  //  self.tableView = (UITableView *)[super initWithStyle:UITableViewStyleGrouped];
   // self.tableView.delegate=self;
}

- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];

}

- (void) enterEditing{

}

#pragma mark - table dataSource methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(5.0, 0, 100, 100)];
        [image setTag:101];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(115, 0, self.view.frame.size.width-115, 40)];
        [title setFont:[UIFont systemFontOfSize:20]];
        [title setTag:102];
        
        
        UILabel *time = [[UILabel alloc]initWithFrame:CGRectMake(115, 40, self.view.frame.size.width-115, 30)];
        [time setTag:103];
        
        
        UILabel *difficulty = [[UILabel alloc]initWithFrame:CGRectMake(115, 70, self.view.frame.size.width-115, 30)];
        [difficulty setTag:104];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell addSubview:image];
        [cell addSubview:title];
        [cell addSubview:difficulty];
        [cell addSubview:time];
    }
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:101];
    [image setImage:[UIImage imageNamed:@"food"]];
    
    UILabel *title,*difficulty,*time;
    
    title = (UILabel *)[cell viewWithTag:102];
    difficulty = (UILabel *)[cell viewWithTag:103];
    time = (UILabel *)[cell viewWithTag:104];
    
    [title setText:@"This is an example meal"];
    [difficulty setText:@"Very Hard"];
    [time setText:@"24h"];

    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return @"Starters";
        case 1:
            return @"Mains";
        case 2:
            return @"Deserts";
            
        default:
            return @"";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{

    return @"Total: 3";
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showSummary" sender:self];
}

@end
