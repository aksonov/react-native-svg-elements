//
//  RCTSvgImage.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 31.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTSvgElement.h"

@interface RCTSvgImage : RCTSvgElement

@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic, strong) NSString*  __nullable  scale;
@property (nonatomic, strong) NSString* __nullable  rx;
@property (nonatomic, strong) NSString* __nullable  ry;
@property (nonatomic, strong) NSString* __nullable  _x;
@property (nonatomic, strong) NSString* __nullable  _y;
@property (nonatomic, strong) NSString* __nullable  _width;
@property (nonatomic, strong) NSString* __nullable  _height;
@property (nonatomic, strong) NSString *__nullable xlinkHref;

@end
