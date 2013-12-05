//
//  COINSViewController2.h
//  touchDrawing
//
//  Created by Shimizu Keiichi on 2013/11/21.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface COINSViewController2 : GLKViewController{
    GLuint vertexBufferID;
    GLuint gridBufferID;
    GLuint questionBufferID;
}
@property (strong, nonatomic) GLKBaseEffect *baseEffect;
@property (strong, nonatomic) IBOutletCollection(GLKView) NSArray *glView;

@end
