//
//  RCTSvg.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 30.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvg.h"
#import "RCTSvgDynamicRenderer.h"

@implementation RCTSvg

-(id)init {
    self = [super init];
    self.renderer = [[RCTSvgDynamicRenderer alloc] initWithDefault];
    return self;
}

-(void)setupRenderer:(UIView *)subview {
    if ([subview respondsToSelector:@selector(setRenderer:)]){
        [subview performSelector:@selector(setRenderer:) withObject:self.renderer];
    }
    for (UIView *view in subview.subviews){
        [self setupRenderer:view];
    }
}

- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    [self setupRenderer:subview];
    [super insertSubview:subview atIndex:atIndex];
}

@end
