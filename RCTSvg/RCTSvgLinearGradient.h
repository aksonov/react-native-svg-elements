//
//  SVGLinearGradient.h
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTSvgElement.h"
#import "GHGradient.h"

@interface RCTSvgLinearGradient : RCTSvgElement

@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable x1;
@property (nonatomic, strong) NSString* __nullable x2;
@property (nonatomic, strong) NSString* __nullable y1;
@property (nonatomic, strong) NSString* __nullable y2;
@property (nonatomic, strong) NSArray* __nullable stop;
@end
