//
//  RecipeSummary.m
//  CookingAPP
//
//  Created by Flávio Silvério on 16/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "RecipeSummary.h"

@implementation RecipeSummary

- (void) viewDidLoad{

    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    _currentRecipe = @{
                       @"imageName":@"food",
                       @"totalTime":@"50 minutes",
                       @"difficulty":@"5",
                       @"title":@"Pato Bravo",
                       @"ingredients":@[@"milk",@"almonds",@"olive oil"],
                       @"steps":@[
                               @{
                                @"name":@"prepare things",
                                @"time":@"15 minutes",
                                @"text":@"first prepare everything"
                                   },
                               @{
                                   @"name":@"second step",
                                   @"time":@"30 minutes",
                                   @"text":@"first prepare everything"
                                   },
                               @{
                                   @"name":@"third step",
                                   @"time":@"15 minutes",
                                   @"text":@"here it ends"
                                   }
                               ]
                       };
    
    self.title = [_currentRecipe valueForKey:@"title"];

}


#pragma mark - Table View Data Source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Preview";
        case 1:
            return @"Name";
        case 2:
            return @"Difficulty";
        case 3:
            return @"Total Cooking Time";
        case 4:
            return @"Ingredients";
        case 5:
            return @"Cooking Steps";
        default:
            return @"";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;

    switch (indexPath.section) {
        case 0:
            return [self generateImageCell:tableView Cell:cell];
        case 1:
            return [self generateTitleCell:tableView Cell:cell];
        case 2:
            return [self generateDifficultyCell:tableView Cell:cell];
        case 3:
            return [self generateTimeCell:tableView Cell:cell];
        case 4:
            return [self generateIngredientsCell:tableView Cell:cell Row:indexPath.row];
        case 5:
            return [self generateStepsCell:tableView Cell:cell Row:indexPath.row];
        default:
            return cell;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 4:
            return [[_currentRecipe valueForKey:@"ingredients"]count];

        case 5:
            return  [[_currentRecipe valueForKey:@"steps"]count];
            
        default:
            return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return (indexPath.section == 0)? self.view.frame.size.width/2:50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 6;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.section == 5){
        [self performSegueWithIdentifier:@"showDetails" sender:self];
    }
    
}

#pragma mark - Generating the Cells

- (UITableViewCell *) generateImageCell:(UITableView *)tableView Cell:(UITableViewCell *)cell{

    cell = [tableView dequeueReusableCellWithIdentifier:@"Image"];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Image"];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4, 0, self.view.frame.size.width/2, self.view.frame.size.width/2)];
        [image setTag:101];
        
        [cell addSubview:image];
    }
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:101];
    [image setImage:[UIImage imageNamed:[_currentRecipe valueForKey:@"imageName"]]];
    
    return cell;
}

- (UITableViewCell *) generateTitleCell:(UITableView *)tableView Cell:(UITableViewCell *)cell{
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"Title"];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Title"];
    }
    
    [cell.textLabel setText:[_currentRecipe valueForKey:@"title"]];
    
    return cell;
}

- (UITableViewCell *) generateDifficultyCell:(UITableView *)tableView Cell:(UITableViewCell *)cell{
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"Difficulty"];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Difficulty"];
    }
    
    [cell.textLabel setText:[_currentRecipe valueForKey:@"difficulty"]];
    
    return cell;
}

- (UITableViewCell *) generateIngredientsCell:(UITableView *)tableView Cell:(UITableViewCell *)cell Row:(NSInteger)row{
//    if (row==0) {
//        
//        cell = [tableView dequeueReusableCellWithIdentifier:@"IngredientsTitle"];
//        
//        if(!cell){
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IngredientsTitle"];
//        }
//        [cell.textLabel setText:@"Ingredients:"];
//        
//    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Ingredient"];
        
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Ingredient"];
            
            UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-(cell.frame.size.height + 10), 0, cell.frame.size.height,cell.frame.size.height)];
            [add setTag:101];
            [add setImage:[UIImage imageNamed:@"shop"] forState:UIControlStateNormal];
            [add addTarget:self action:@selector(shoppingCartAdd:) forControlEvents:UIControlEventTouchUpInside];
            add.imageView.contentMode = UIViewContentModeScaleAspectFit;
            
            [cell addSubview:add];
        }
        
        [cell.textLabel setText:[NSString stringWithFormat:@"   - %@",[[_currentRecipe valueForKey:@"ingredients"] objectAtIndex:row]]];
//    }

    
    
    return cell;
}

- (UITableViewCell *) generateStepsCell:(UITableView *)tableView Cell:(UITableViewCell *)cell Row:(NSInteger)row{
//    if (row==0) {
//        
//        cell = [tableView dequeueReusableCellWithIdentifier:@"StepsTitle"];
//        
//        if(!cell){
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StepsTitle"];
//        }
//        [cell.textLabel setText:@"Steps:"];
//        
//    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Step"];
        
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Step"];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
        
        [cell.textLabel setText:[NSString stringWithFormat:@"   - %@",[[[_currentRecipe valueForKey:@"steps"] objectAtIndex:row] valueForKey:@"name"]]];
//    }
    
    return cell;
}

- (UITableViewCell *) generateTimeCell:(UITableView *)tableView Cell:(UITableViewCell *)cell{
    cell = [tableView dequeueReusableCellWithIdentifier:@"Time"];
    //totalTime
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Time"];
    }
    [cell.textLabel setText:[_currentRecipe valueForKey:@"totalTime"]];
    
    return cell;
}

#pragma mark - 
#pragma mark - Touch Events

- (IBAction)shoppingCartAdd:(id)sender{

//    [[BDManager sharedManager]saveShoppingItem:[(UITableViewCell *)[sender superview] textLabel].text];
//    
//
//    NSArray *array = [[BDManager sharedManager]getAllShoppingItems];
//    
//    for (NSManagedObject *obj in array) {
//        NSLog(@"%@",[obj valueForKey:@"data"]);
//    }
}

#pragma mark -
#pragma mark - Navigation

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([[segue identifier] isEqualToString:@"showDetails"]){
        RecipeDetails *details = (RecipeDetails *)[segue destinationViewController];
        [details setRecipe:_currentRecipe];
    }

}
@end
