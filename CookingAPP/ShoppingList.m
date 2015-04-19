//
//  ShoppingList.m
//  CookingAPP
//
//  Created by Flávio Silvério on 28/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "ShoppingList.h"

@implementation ShoppingList
{
    NSArray *items;
}
- (void) viewDidLoad{

    [super viewDidLoad];
    
    items = [[NSArray alloc]initWithObjects:@{
                                              @"name" : @"couves",
                                              @"quantity": [NSNumber numberWithInt:5]
                                              },
             @{
               @"name" : @"batatas",
               @"quantity": [NSNumber numberWithInt:10]
               },
    
             @{
               @"name" : @"cenouras",
               @"quantity": [NSNumber numberWithInt:45]
               },
             @{
               @"name" : @"couves",
               @"quantity": [NSNumber numberWithInt:4]
               },
             nil];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButton:)];
    UIBarButtonItem *edit = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButton:)];

//    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItems = @[add,edit];
//    self.navigationItem.rightBarButtonItem = add;
    
}

-(void) viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];
    
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}


- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{

    NSMutableArray *it = [[NSMutableArray alloc]initWithArray:items];
    [it removeObjectAtIndex:sourceIndexPath.row];
    
    [it insertObject:[items objectAtIndex:sourceIndexPath.row] atIndex:destinationIndexPath.row];
    
    items = (NSArray *) it;
    
    [self.tableView reloadData];
    
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [items count];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
    
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Item"];

    
    if(cell==nil){
    
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Item"];
    
    }
    
    [[cell textLabel] setText:[[items objectAtIndex:[indexPath row]] valueForKey:@"name"]];
    [[cell detailTextLabel] setText:[[items objectAtIndex:[indexPath row] ] valueForKey:@"quantity"] ];
    
    
    return cell;
}


#pragma mark - Button Taps

- (IBAction)editButton:(id)sender{

    self.tableView.editing = !self.tableView.editing;
}

- (IBAction)addButton:(id)sender{

    NSMutableArray *it = [[NSMutableArray alloc]initWithArray:items];
    [it addObject:@{
                   @"name": @"Mais um",
                   @"quantity": [NSNumber numberWithInt:1]
                   }];
    items = (NSArray *)it;
    [self.tableView reloadData];
}

@end
