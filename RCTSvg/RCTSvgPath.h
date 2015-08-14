//
//  RCTSvgPath.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTSvgElement.h"

@interface RCTSvgPath : RCTSvgElement
@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic, strong) NSString*  __nullable  scale;
@property (nonatomic, strong) NSString* __nullable  d;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;

@end
