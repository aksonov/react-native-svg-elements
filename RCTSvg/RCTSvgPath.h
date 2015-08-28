//
//  RCTSvgPath.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTSvgElement.h"
#import "RCTShadowView.h"

@interface RCTSvgPath : RCTSvgElement
@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString* __nullable  fillRule;
@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic, strong) NSString*  __nullable  scale;
@property (nonatomic, strong) NSString* __nullable  d;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;
@property (nonatomic, strong) NSString* __nullable  strokeLinecap;
@property (nonatomic, strong) NSString* __nullable  strokeMiterLimit;
@property (nonatomic, strong) NSString* __nullable  _transform;

@end

@interface RCTSvgPathShadow : RCTShadowView
@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString* __nullable  fillRule;
@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic, strong) NSString*  __nullable  scale;
@property (nonatomic, strong) NSString* __nullable  d;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;
@property (nonatomic, strong) NSString* __nullable  strokeLinecap;
@property (nonatomic, strong) NSString* __nullable  strokeMiterLimit;
@property (nonatomic, strong) NSString* __nullable  _transform;

@end
