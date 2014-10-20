//
//  PhotoSetViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-17.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "PhotoSetViewController.h"

@interface PhotoSetViewController ()

@end

@implementation PhotoSetViewController

@synthesize _filePath;

@synthesize _server;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIImage *backImage = [UIImage imageNamed:@"releasesuccess_return"];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        leftButton.frame = CGRectMake(0.0, 0.0, 42.0, 25.0);
        
        [leftButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        
        [leftButton setBackgroundImage:backImage forState:UIControlStateNormal];
        
        UIBarButtonItem *leftBarButonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        self.navigationItem.leftBarButtonItem = leftBarButonItem;
    }
    return self;
}

-(void)loadView{

    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    
    self.view = mainView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [photoButton setTitle:@"拍照上传" forState:UIControlStateNormal];
    
    [photoButton setFrame:CGRectMake((self.view.frame.size.width-200)/2, 0.0, 200.0, 20.0)];
    
    [photoButton addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:photoButton];
    
    // Do any additional setup after loading the view.
}

-(void)takePhoto{

    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.delegate = self;
        
        picker.allowsEditing = YES;
        
        picker.sourceType = sourceType;
        
        [self presentModalViewController:picker animated:YES];
    }else{
    
        NSLog(@"模拟器中无法打开照相机，请在真机中使用");
    }
    
}

-(void)localPhoto{

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate = self;
    
    picker.allowsEditing = YES;
    
    [self presentModalViewController:picker animated:YES];

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        NSData *data;
        
        if (UIImagePNGRepresentation(image) == nil) {
            data = UIImageJPEGRepresentation(image, 1.0);
        }else{
        
            data = UIImagePNGRepresentation(image);
        }
        
        NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        _filePath = [[NSString alloc] initWithFormat:@"%@%@",DocumentsPath,@"/image.png"];
        
        [picker dismissModalViewControllerAnimated:YES];
        
        UIImageView *smallImage = [[UIImageView alloc] initWithFrame:CGRectMake(50,120,40,40)];
        
        smallImage.image = image;
        
        [self.view addSubview:smallImage];
        
    }
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    NSLog(@"您取消了选择图片");
    
    [picker dismissModalViewControllerAnimated:YES];
    
}

-(void)sendInfo{

    NSLog(@"图片的路径时：%@",_filePath);
    
    NSString *server_base = [NSString stringWithFormat:@"%@/user/uploadResource.json",_server];
    
    ASINetworkQueue *queue = [[ASINetworkQueue alloc] init];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:server_base]];
    
    [request setDelegate:self];
    
    [request setDidFinishSelector:@selector(sendCommentSucc:)];
    
    [request setDidFailSelector:@selector(sendCommentFail:)];
    
    [request setFile:_filePath forKey:@"res"];
    
    [queue addOperation:request];
    
    [queue go];
    
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
