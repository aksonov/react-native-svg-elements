//
//  SVGMask.h
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgElement.h"

@interface RCTSvgMask : RCTSvgElement {
    NSDictionary *child;
}

@property (nonatomic, strong) NSString* __nullable id;
@property (nonatomic, strong) NSString* __nullable  fill;
@property (nonatomic, strong) NSString* __nullable  fillOpacity;
@property (nonatomic, strong) NSString* __nullable  scale;
@property (nonatomic, strong) NSString* __nullable  stroke;
@property (nonatomic, strong) NSString* __nullable  strokeWidth;

@end
