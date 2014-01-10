//
//  ProductDetailViewController.h
//  16page
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "CartCell.h"
#import "Catalog.h"
#import "Product.h"
#import "Cart.h"
#import "ProductCell.h"
#import "CartItem.h"
#import "CartDelegate.h"

@interface ProductDetailViewController : UIViewController

@property (copy, nonatomic) NSString *productCode;

@property (weak,nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextView *detail;


@end
