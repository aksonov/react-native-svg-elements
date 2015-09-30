//
//  RCTSvgRect.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 25.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTSvgElement.h"

@interface RCTSvgRect : RCTSvgElement<SVGRenderable>

@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString* __nullable  opacity;
@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic) float  scale;
@property (nonatomic, strong) NSString* __nullable  rx;
@property (nonatomic, strong) NSString* __nullable  ry;
@property (nonatomic, strong) NSString* __nullable  _width;
@property (nonatomic, strong) NSString* __nullable  _height;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;

@end

@interface RCTSvgRectShadow : RCTShadowView

@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  opacity;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic) float  scale;
@property (nonatomic, strong) NSString* __nullable  rx;
@property (nonatomic, strong) NSString* __nullable  ry;
@property (nonatomic, strong) NSString* __nullable  x;
@property (nonatomic, strong) NSString* __nullable  y;
@property (nonatomic, strong) NSString* __nullable  _width;
@property (nonatomic, strong) NSString* __nullable  _height;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;

@end
