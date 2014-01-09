//
//  Catalog.m
//  16page
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Catalog.h"
#import "Product.h"

@implementation Catalog
{
    NSArray *data;
}

static Catalog *_instance = nil;
+ (id)defaultCatalog
{
    if (_instance == nil) {
        _instance = [[Catalog alloc]init];
    }
    return _instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        data = @[[Product Product:@"BaseBall" price:@"$100" imageName:@"baseball.png"],
                 [Product Product:@"BasketBall" price:@"$200" imageName:@"basketball.png"],
                 [Product Product:@"FootBall" price:@"$250" imageName:@"football.png"],
                 [Product Product:@"RudbyBall" price:@"$300" imageName:@"rugbyball.png"],
                 [Product Product:@"Wilson" price:@"$999" imageName:@"volleyball.png"]];
    }
    return self;
}

- (id)productAt:(int)index
{
    return [data objectAtIndex:index];
}

- (int)numberOfProducts
{
    return [data count];
}

@end
