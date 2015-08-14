//
//  RCTSvg.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 14.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvg.h"
#import "RCTSvgDynamicRenderer.h"

@implementation RCTSvg


-(void)setWidth:(float)width {
    _width = width;
    [RCTSvgDynamicRenderer sharedInstace].width = width;
}

-(void)setHeight:(float)height {
    _height = height;
    [RCTSvgDynamicRenderer sharedInstace].height = height;
}

- (void)drawRect:(CGRect)rect {
    [RCTSvgDynamicRenderer sharedInstace].rect = rect;
}

@end
