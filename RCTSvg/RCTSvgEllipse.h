//
//  RCTCircle.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 26.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgElement.h"
#import "RCTShadowView.h"

@interface RCTSvgEllipse : UIView<SVGRenderable>

@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic, strong) NSString*  __nullable  scale;
@property (nonatomic, strong) NSString* __nullable  cx;
@property (nonatomic, strong) NSString* __nullable  cy;
@property (nonatomic, strong) NSString* __nullable  ry;
@property (nonatomic, strong) NSString* __nullable  rx;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;

@end

@interface RCTSvgEllipseShadow : RCTShadowView

@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString*  __nullable  mask;
@property (nonatomic, strong) NSString*  __nullable  scale;
@property (nonatomic, strong) NSString* __nullable  cx;
@property (nonatomic, strong) NSString* __nullable  cy;
@property (nonatomic, strong) NSString* __nullable  rx;
@property (nonatomic, strong) NSString* __nullable  ry;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;

@end
