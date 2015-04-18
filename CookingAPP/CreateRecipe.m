//
//  CreateRecipe.m
//  CookingAPP
//
//  Created by Flávio Silvério on 21/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "CreateRecipe.h"

@implementation CreateRecipe
{
    NSMutableArray *ingredients;

}

- (void) viewDidLoad{

    ingredients = [[NSMutableArray alloc]init];
}

- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 3;
        case 1:
            return [ingredients count] + 1 ;
        default:
            return 1;
    }

}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
        {
        
            cell = [tableView dequeueReusableCellWithIdentifier:@"GeneralCell"];
            
            if(!cell){
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GeneralCell"];
                
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, 60)];
                [label setTag:101];
                
                [cell addSubview:label];
                
                UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(150, 0, self.view.frame.size.width-150, 60)];
                [text setTag:102];
                [text setFont:[UIFont systemFontOfSize:25]];

                
                [cell addSubview:text];
            }
            
            UILabel *label = (UILabel *) [cell viewWithTag:101];
            
            switch (indexPath.row) {
                case 0:
                    [label setText:@"Name"];
                    break;
                case 1:
                    [label setText:@"Type"];
                    break;
                case 2:
                    [label setText:@"Difficulty"];
                    break;
                default:
                    break;
            }
        
        }
            break;
        case 1:
        {

            if(indexPath.row == [ingredients count]){
            
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addIngredient"];
                
                UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
                [add setTitle:@"+" forState:UIControlStateNormal];
                [[add titleLabel ]setFont:[UIFont systemFontOfSize:50]];
                [add setBackgroundColor:[UIColor grayColor]];
                [add addTarget:self action:@selector(addIngredient) forControlEvents:UIControlEventTouchUpInside];
                
                [cell addSubview:add];
                
            
            } else{
            
                cell = [tableView dequeueReusableCellWithIdentifier:@"NewIngredient"];
                
                if(!cell){
                
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewIngredient"];
                    
                    UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(10, 0, (self.view.frame.size.width)-10, 60)];
                    [text setTag:101];
                    [text setFont:[UIFont systemFontOfSize:25]];
                    [cell addSubview:text];
                }
            
                UITextView *text = (UITextView *)[cell viewWithTag:101];
                [text setText:[ingredients objectAtIndex:indexPath.row]];
            }
            }
            break;
            
        default:
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"add"];
            
            UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
            [add setTitle:@"+" forState:UIControlStateNormal];
            [[add titleLabel ]setFont:[UIFont systemFontOfSize:50]];
            [add setBackgroundColor:[UIColor grayColor]];
            //[add addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
            
            [cell addSubview:add];
            
            break;
    }
    

    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return @"General Details";
        case 1:
            return @"Ingredients";
        case 2:
            return @"Steps";
            
        default:
            return @"";
    }
}

- (void) generateAlert{

//    
    UIView *bg = [[UIView alloc]initWithFrame:self.view.frame];
    [bg setBackgroundColor:[UIColor blackColor]];
    [bg setAlpha:0.5f];
    
    UIView *alert = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 100, self.view.frame.size.height - 250)];
    [alert setCenter:self.view.center];
    [alert setBackgroundColor:[UIColor whiteColor]];
    [alert setAlpha:1];
    
    [alert setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, alert.frame.size.width, 50)];
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, alert.frame.size.width, 50)];
    
    //[label setCenter:CGPointMake(bg.center.x, bg.center.y-25)];
    [label setText:@"É isto Mário?"];
    [label setTextColor:[UIColor greenColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    //[cancel setCenter:CGPointMake(bg.center.x, bg.center.y+25)];
    [cancel setTitle:@"Botão!" forState:UIControlStateNormal];
    [[cancel titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [cancel setBackgroundColor:[UIColor clearColor]];
    
    [cancel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [alert addSubview:cancel];
    [alert addSubview:label];
    
    [self.view addSubview:bg];
    [self.view addSubview:alert];

//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"MArito um alert e assim!" delegate:self cancelButtonTitle:@"1 botao" otherButtonTitles:@"2 botoes",@"3 botoes", nil];
//    [alert setBackgroundColor:[UIColor clearColor]];
//    [alert show];
    
}

- (void) addIngredient{

    [ingredients addObject:[NSString stringWithFormat:@"%lu - ",[ingredients count]+1 ]];
    [self.tableView reloadData];
}

@end
