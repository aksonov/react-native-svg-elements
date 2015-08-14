//
//  SVGDynamicRenderer.m
//  
//
//  Created by Pavlo Aksonov on 31.07.15.
//
//

#import "RCTSvgDynamicRenderer.h"
#import "RCTBridgeModule.h"

@implementation RCTSvgDynamicRenderer

+ (RCTSvgDynamicRenderer *)sharedInstace {
    static RCTSvgDynamicRenderer *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
            NSString* result = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?> <svg xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" height=\"100px\" viewport-fill=\"white\" y=\"0px\" width=\"100px\" version=\"1.1\" viewBox=\"0 , 0, 1242, 2208\"></svg>";
            //    <defs><path d=\"M20 50 A30 30 0 1 1 80 50 A 30 30 0 1 1 20 50Z\" id=\"CIRCLE_TEXT_PATH\" fill=\"none\" stroke=\"none\"/> </defs><g/><g stroke=\"green\" stroke-width=\"1\" vector-effect=\"non-scaling-stroke\" fill=\"#cfdcdd\" stroke-linecap=\"round\"> <path d=\"M0 0H100V100H0ZM50 0A50 50 0 1 0 50 100 50 50 0 1 0 50 0ZM50 25A25 25 0 1 1 50 75 25 25 0 1 1 50 25Z\"/> </g> <text stroke=\"none\" font-size=\"17\" font-family=\"Georgia\" fill=\"#5BB\" color=\"#228B22\"> <textPath xlink:href=\"#CIRCLE_TEXT_PATH\">Enter artworkPath</textPath> </text> <text x=\"50\" y=\"65\" text-anchor=\"middle\" font-family=\"Helvetica\" font-size=\"44\" fill=\"#5BB\">?</text>
        
        sharedMyManager = [[self alloc] initWithString:result];
        
    });
    return sharedMyManager;
}

-(void)addObject:(id __nonnull)object forKey:(NSString * __nonnull)ident {
    objects[ident] = object;
}

-(nullable id)objectNamed:(NSString * __nonnull)objectName {
    return objects[objectName];
}

-(void)clearObjects {
    [objects removeAllObjects];
}

- (id)initWithString:(NSString * __nonnull)utf8String {
    if (self = [super initWithString:utf8String]) {
        objects = [NSMutableDictionary dictionary];
    }
    return self;
}
@end
