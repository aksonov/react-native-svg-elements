//
//  RCTSvgElement.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgElement.h"
#import "RCTSvgDynamicRenderer.h"

@implementation RCTSvgElement

-(id)init {
    self = [super init];
    return self;
}

-(void)prepare {
    if (!self.obj){
        //
    }
}

-(NSDictionary *)objParams {
    // should be overriden in descedants
    return nil;
}

-(void)setObj:(id __nullable)obj {
    _obj = obj;
    if ([obj respondsToSelector:@selector(attributes)]){
        if ([((NSDictionary *)[obj attributes]) objectForKey:@"id"]){
            [[RCTSvgDynamicRenderer sharedInstace] addObject:obj forKey:[((NSDictionary *)[obj attributes]) objectForKey:@"id"]];
        }
    }
    
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if ([self.obj conformsToProtocol:@protocol(GHRenderable)]){
        [((id<GHRenderable>)self.obj) renderIntoContext:context withSVGContext:[RCTSvgDynamicRenderer sharedInstace]];
    }
}

@end
