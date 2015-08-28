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
    self.contentMode = UIViewContentModeRedraw;
    self.opaque = NO;
    return self;
}

-(void)prepare {
    if (!self.obj){
        //
    }
}

-(NSDictionary *__nullable)objParams {
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

+(NSDictionary *__nullable)objParams:(NSString *)name object:(id)obj{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[obj asAttributes]];
    if (map[@"scale"]){
        if (map[@"transform"]){
            map[@"transform"] = [NSString stringWithFormat:@"scale(%@) %@",map[@"scale"],map[@"transform"]];
        } else
            map[@"transform"] = [NSString stringWithFormat:@"scale(%@)", map[@"scale"]];
    }
    return @{kAttributesElementName: map, kElementName: name};
    
}
@end
