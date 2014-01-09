//
//  ViewController.m
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Catalog.h"
#import "Product.h"
#import "CartDelegate.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CartDelegate>
{
    NSMutableArray *cartItems;
}

@property (weak, nonatomic) IBOutlet UITableView *table;

@end



@implementation ViewController

// 카타로그 델리게이트 : 제품을 카트에 추가한다
- (void)addItem:(id)sender
{
    //제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [_table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [cartItems addObject:product];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [_table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// 섹션0 : 카탈로그, 섹션1 : 카트
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return [[Catalog defaultCatalog] numberOfProducts];
    }
    else
        return [cartItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        Product *product = cartItems[indexPath.row];
        cell.textLabel.text = product.name;
        return cell;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Product";
    }
    else
    {
        return @"Items in Cart";
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    cartItems = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
