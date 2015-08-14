//
//  SVGDynamicRenderer.h
//  
//
//  Created by Pavlo Aksonov on 31.07.15.
//
//

#import "SVGRenderer.h"

@interface RCTSvgDynamicRenderer : SVGRenderer {
    NSMutableDictionary *objects;
}

+ (RCTSvgDynamicRenderer * __nonnull)sharedInstace;
-(void)addObject:(id __nonnull)object forKey:(NSString *__nonnull)ident;
-(nullable id)objectNamed:(NSString * __nonnull)objectName;
-(void)clearObjects;
@property (nonatomic, readwrite) CGRect rect;
@property (nonatomic, readwrite) float width;
@property (nonatomic, readwrite) float height;

@end
