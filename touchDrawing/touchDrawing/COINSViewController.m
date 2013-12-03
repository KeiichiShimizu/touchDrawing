//
//  COINSViewController.m
//  touchDrawing
//
//  Created by Shimizu Keiichi on 2013/11/21.
//  Copyright (c) 2013年 COINS Project AID. All rights reserved.
//

#import "COINSViewController.h"

@interface COINSViewController ()

@end


@implementation COINSViewController

@synthesize baseEffect;

typedef struct {
    GLKVector3 position;
} Vertex;

static const Vertex vertices[] =
{
    {{-1.0f, -1.0f, 0.0}},
    {{1.0f, -1.0f, 0.0}},
    {{-1.0f, 1.0f, 0.0}}
};

-(void)drawAxis{
    double axis[][3] =
    {
        { 0.0, 0.0, 0.0 },
        { 1.0, 0.0, 0.0 },
        { 0.0, 1.0, 0.0 },
        { 0.0, 0.0, 1.0 }
    };
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GLKView *view = (GLKView *)self.view;
    //GLKView *view = (GLKView *)self.glView;
    
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    
    [EAGLContext setCurrentContext:view.context];
    
    
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(1.0f, 1.0f, 1.0f, 1.0f);
    
    
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    
    
    glGenBuffers(1, &vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferID);
    
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
}
#pragma mark - GLKView delegate
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.baseEffect prepareToDraw];
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), NULL);
    glDrawArrays(GL_TRIANGLES, 0, 3);
}
-(void)viewDidUnload
{
    [super viewDidUnload];
    GLKView *view = (GLKView *)self.view;
    [EAGLContext setCurrentContext:view.context];
    if ((vertexBufferID =! 0)) {
        glDeleteBuffers(1, &vertexBufferID);
    }
    view.context = nil;
    [EAGLContext setCurrentContext:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
