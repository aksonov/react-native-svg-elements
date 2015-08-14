//
//  SVGDefs.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgDefs.h"
#import "RCTSvgElement.h"
#import "RCTSvgDynamicRenderer.h"

@implementation RCTSvgDefs

-(id)init {
    self = [super init];
    [[RCTSvgDynamicRenderer sharedInstace] clearObjects];
    return self;
}
- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    // will not insert because we don't need to draw them
//    [super insertSubview:subview atIndex:atIndex];
    
    // just add them to registry
    if ([subview isKindOfClass:[RCTSvgElement class]]){
        [((RCTSvgElement *)subview) prepare];
    }
}

@end
