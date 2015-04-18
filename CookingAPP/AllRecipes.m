//
//  AllRecipes.m
//  CookingAPP
//
//  Created by Flávio Silvério on 25/03/15.
//  Copyright (c) 2015 Flávio Silvério. All rights reserved.
//

#import "AllRecipes.h"

@implementation AllRecipes

bool showing;
NSIndexPath *selectedIndex;

-(void) viewDidLoad{

    [super viewDidLoad];
    
    selectedIndex=[NSIndexPath indexPathForRow:-1 inSection:-1];
    self.title = @"All Recipes";
    
    UIView *buttons = [[UIView alloc]initWithFrame:CGRectMake(0, -85, self.view.frame.size.width, 150)];
    [buttons setBackgroundColor:[UIColor greenColor]];
    [buttons setTag:800];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    [btn setCenter:CGPointMake(self.view.center.x, 75)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(animateView) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:801];
    
    [self.view addSubview:btn];
    [self.view addSubview:buttons];
    
    //[self.navigationController setTintColor:[UIColor purpleColor]];
    

    //customCollection *custom = [[customCollection alloc]init];
    //[custom setCustomCollectionDelegate:self];
    //[custom reloadCollection];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath==selectedIndex) {
         return CGSizeMake(self.view.frame.size.width, self.view.frame.size.width/2 - 5);
    }
    
    return CGSizeMake(self.view.frame.size.width/2 - 5, self.view.frame.size.width/2 - 5);
}
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return 100;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 5, 0); // top, left, bottom, right
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   // [cell setBackgroundColor:[UIColor redColor]];
    //cell.lbl.text = @"Data";
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2 - 5, self.view.frame.size.width/2 - 5)];
    [img setImage:[UIImage imageNamed:@"food"]];
    [cell addSubview:img];
    
    
    UIButton *v = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2 - 5, self.view.frame.size.width/2 - 5)];
    [v setBackgroundColor:[UIColor yellowColor]];
    [v addTarget:self action:@selector(segue) forControlEvents:UIControlEventTouchUpInside] ;

    UIButton *segue = [[UIButton alloc]initWithFrame:CGRectMake(25, 50, 75, 25)];
    [segue setTitle:@"Details" forState:UIControlStateNormal];
    [segue setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [segue addTarget:self action:@selector(segue) forControlEvents:UIControlEventTouchUpInside] ;
    
    [v addSubview:segue];

    [cell addSubview:v];
    [cell addSubview:img];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    //UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    //datasetCell.backgroundColor = [UIColor blueColor]; // highlight selection
    selectedIndex = indexPath;
    [self.collectionView reloadData];
   // [self performSegueWithIdentifier:@"showRecipe" sender:self];
    
}

- (void) animateView{

    if(showing){
    
        [[self.view viewWithTag:800] setFrame:CGRectMake([self.view viewWithTag:800].frame.origin.x, [self.view viewWithTag:800].frame.origin.y-75, [self.view viewWithTag:800].frame.size.width, [self.view viewWithTag:800].frame.size.height)];
        
                [[self.view viewWithTag:801] setFrame:CGRectMake([self.view viewWithTag:801].frame.origin.x, [self.view viewWithTag:801].frame.origin.y-75, [self.view viewWithTag:801].frame.size.width, [self.view viewWithTag:801].frame.size.height)];
        
    } else {
        [[self.view viewWithTag:800] setFrame:CGRectMake([self.view viewWithTag:800].frame.origin.x, [self.view viewWithTag:800].frame.origin.y+75, [self.view viewWithTag:800].frame.size.width, [self.view viewWithTag:800].frame.size.height)];
                [[self.view viewWithTag:801] setFrame:CGRectMake([self.view viewWithTag:801].frame.origin.x, [self.view viewWithTag:801].frame.origin.y+75, [self.view viewWithTag:801].frame.size.width, [self.view viewWithTag:801].frame.size.height)];
    }
    showing = !showing;
}

- (void) segue{
    [self performSegueWithIdentifier:@"showRecipe" sender:self];

}

#pragma mark - custom Collection methods

- (int) numberOfItemsPerRow{
    return 5;
}
- (UIView *) itemForIndex{
    return nil;
}
- (float *) heightForItemAtIndex:(int)index{
    return 0;
}

- (float) distanceBetweenCells{
    return 3;
}


@end
