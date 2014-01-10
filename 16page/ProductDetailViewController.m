//
//  ProductDetailViewController.m
//  16page
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductDetailViewController.h"



@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    Catalog *catalog = [Catalog defaultCatalog];
    Product *product = [catalog productWithCode:self.productCode];
    
    self.imageView.image = [UIImage imageNamed:product.imageName];
    self.nameLabel.text = product.name;
    self.priceLabel.text = product.price;
    self.title = product.name;
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.detail resignFirstResponder];
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}

@end
