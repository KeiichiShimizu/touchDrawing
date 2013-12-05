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
@synthesize glView;

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
    //GLKView *glview = (GLKView *)self.glView;
    
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    //glview.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];

    
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(1.0f, 1.0f, 0.0f, 1.0f);
    
    //self.baseEffect.constantColor = GLKVector4Make(1.0f, 1.0f, 1.0f, 1.0f);
    
    
    glClearColor(0.8f, 0.8f, 0.8f, 1.0f);
    
    
    glGenBuffers(1, &vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferID);
    
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    //[self showGrid];
    
}
#pragma mark - GLKView delegate
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.baseEffect prepareToDraw];
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), NULL);
    //glDrawArrays(GL_TRIANGLES, 0, 3);

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

-(void)showGrid{
    Vertex gridPoints[] =
    {
        {-0.9f, 1.0f, 0.0},
        {-0.9f, -1.0f, 0.0},
        
    };
    [self.baseEffect prepareToDraw];
    // vertexBufferIDという頂点バッファ・オブジェクト・ポインタを作成する
    glGenBuffers(1, &gridBufferID);

    // バッファオブジェクトを有効にします
    // 頂点バッファオブジェクトの場合, 第1引数target には GL_ARRAY_BUFFER を指定します
    glBindBuffer(GL_ARRAY_BUFFER, gridBufferID);
    
    // バッファオブジェクトのメモリを確保し, そこにデータを転送します
    // 第1引数にはglBindBuffer() と同じものを指定します
    // 第2引数sizeには確保するメモリのサイズを byte で指定します
    // 第3引数dataは転送元のデータの配列を指定します
    // 第4引数usageにはバッファオブジェクトのメモリの使われ方のヒントを指定します
    // STATIC: メモリには一度しか書き込まれないが, 何回も使われる
    // DRAW: メモリの内容はアプリケーションプログラムから書き込まれ, OpenGL による描画データとして使用される
    glBufferData(GL_ARRAY_BUFFER, sizeof(gridPoints), gridPoints, GL_STATIC_DRAW);
    glDrawArrays(GL_LINES, 0, 2);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
