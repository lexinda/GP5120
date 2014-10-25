//
//  RegisterViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize _meddleView;

@synthesize _filePath;

@synthesize _adTable;

@synthesize _adData;

@synthesize _hub;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"用户注册";
        
        UIImage *backImage = [UIImage imageNamed:@"releasesuccess_return"];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        leftButton.frame = CGRectMake(0.0, 0.0, 42.0, 25.0);
        
        [leftButton addTarget:self action:@selector(popToLoginView) forControlEvents:UIControlEventTouchUpInside];
        
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

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _hub = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    [self.navigationController.view addSubview:_hub];
    
    _hub.delegate = self;
    
    _hub.labelText = @"加载中...";
    
    [_hub showWhileExecuting:@selector(getRegisterData) onTarget:self withObject:nil animated:YES];
    
    // Do any additional setup after loading the view.
}

-(void)getRegisterData{
    
    _adData = [[NSMutableArray alloc] init];
    
    NSString *requestAdUrl = [NSString stringWithFormat:@"%@&flag=27",SERVER_URL];
    
    NSLog(@"%@",requestAdUrl);
    
    ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:requestAdUrl]];
    
    [requestForm startSynchronous];
    
    NSString *reponseData = [requestForm responseString];
    
    NSLog(@"%@",reponseData);
    
    NSDictionary *responseDictionary = [reponseData objectFromJSONString];
    
    _adData = [responseDictionary objectForKey:@"AD_LIST"];
    
//    for (NSDictionary *dictionary in responseAd) {
//        
//        AdList *adList = (AdList *)dictionary;
//        
//        [_adData addObject:adList];
//        
//    }
    
    RegisterTopView *registerTopView = [[RegisterTopView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 40.0)];
    
    [registerTopView setBackgroundColor:[UIColor whiteColor]];
    
    [registerTopView set_pushViewDelegate:self];
    
    [self.view addSubview:registerTopView];
    
    _meddleView = [[UIScrollView alloc] initWithFrame:CGRectMake(registerTopView.frame.origin.x, registerTopView.frame.origin.y+registerTopView.frame.size.height+10.0, self.view.frame.size.width, self.view.frame.size.height-registerTopView.frame.size.height-49)];
    
    RegisterView *registerView = [[RegisterView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 120.0)];
    
    [registerView set_pushViewDelegate:self];
    
    [_meddleView addSubview:registerView];
    
    _adTable = [[UITableView alloc] initWithFrame:CGRectMake(registerView.frame.origin.x, registerView.frame.size.height, self.view.frame.size.width, _meddleView.frame.size.height-registerView.frame.size.height)];
    
    _adTable.delegate = self;
    
    _adTable.dataSource = self;
    
    [_meddleView addSubview:_adTable];
    
    [self.view addSubview:_meddleView];
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,self.view.frame.size.height-49, self.view.frame.size.width, 49)];
    
    [self.view addSubview:footButtonView];

}

-(void)popToLoginView{

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)commitRegisterInfo{
    
    NSLog(@"commitRegisterInfo");
    
}

-(void)commitSimpleRegisterInfo{
    
    NSLog(@"commitSimpleRegisterInfo");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)swapRegisterView:(int)id{
    
    for(UIView *view in [_meddleView subviews]){
        
        if([view isKindOfClass:[RegisterView class]]||[view isKindOfClass:[RegisterDetailView class]]||[view isKindOfClass:[RegisterPhotoView class]]){
            
            [view removeFromSuperview];
            
        }
        
    }

    if(id==1){
        
        RegisterView *registerView = [[RegisterView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 100.0)];
        
        [registerView set_pushViewDelegate:self];
        
        [_meddleView addSubview:registerView];
    
    }else if(id==2){
        
        RegisterDetailView *registerDetailView = [[RegisterDetailView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
        
        NSLog(@"%f",_meddleView.frame.size.height);
        
        [_meddleView setContentSize:CGSizeMake(self.view.frame.size.width, 370)];
        
        [_meddleView addSubview:registerDetailView];
    
    }else if(id==3){
        
        RegisterPhotoView *registerPhotoView = [[RegisterPhotoView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
        
        [registerPhotoView set_pushViewDelegate:self];
        
        [_meddleView addSubview:registerPhotoView];
        
    }
    
}

-(void)takePhoto{
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.delegate = self;
        
        picker.allowsEditing = YES;
        
        picker.sourceType = sourceType;
        
        [self presentViewController:picker animated:YES completion:^(void){
            
            NSLog(@"载入图片编辑器");
            
        }];

    }else{
        
        NSLog(@"模拟器中无法打开照相机，请在真机中使用");
    }
    
}

-(void)localPhoto{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate = self;
    
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:^(void){
    
        NSLog(@"载入图片编辑器");
        
    }];
    
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
        
        
        [picker dismissViewControllerAnimated:YES completion:^(void){
            
            NSLog(@"退出图片编辑器");
        }];

        
        UIImageView *smallImage = [[UIImageView alloc] initWithFrame:CGRectMake(50,120,40,40)];
        
        smallImage.image = image;
        
        [self.view addSubview:smallImage];
        
    }
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    NSLog(@"您取消了选择图片");
    
    [picker dismissViewControllerAnimated:YES completion:^(void){
    
        NSLog(@"退出图片编辑器");
    }];
    
}

-(void)sendInfo{
    
    NSLog(@"图片的路径时：%@",_filePath);
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *username = [defaults objectForKey:@"username"];
    
    NSString *server_base = [NSString stringWithFormat:@"%@&flag=191&username=%@",SERVER_URL,username];
    
    ASINetworkQueue *queue = [[ASINetworkQueue alloc] init];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:server_base]];
    
    [request setDelegate:self];
    
    [request setDidFinishSelector:@selector(sendCommentSucc:)];
    
    [request setDidFailSelector:@selector(sendCommentFail:)];
    
    [request setFile:_filePath forKey:@"res"];
    
    [queue addOperation:request];
    
    [queue go];
    
}


- (void)inputBegin:(id)sender {
    //这里添加了一个滚动的动画
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.15];
    
    if ([sender isKindOfClass:[UITextView class]]) {
        UITextView *textView = (UITextView *)sender;
        //开始编辑的时候，让_scrollView滚到CGPointMake(0, 216);
        
        if ((_meddleView.frame.size.height-textView.frame.origin.y-textView.frame.size.height)<216) {
            
            CGPoint offset = CGPointMake(0,216-(_meddleView.frame.size.height-textView.frame.origin.y)+40.0);
            
            [_meddleView setContentOffset:offset animated:YES];
            
            [UIView commitAnimations];
        }
    }else if([sender isKindOfClass:[UITextField class]]){
        UITextField *textField = (UITextField *)sender;
        //开始编辑的时候，让_scrollView滚到CGPointMake(0, 216);
        
        if ((_meddleView.frame.size.height-textField.frame.origin.y-textField.frame.size.height)<216) {
            
            CGPoint offset = CGPointMake(0,216-(_meddleView.frame.size.height-textField.frame.origin.y));
            
            [_meddleView setContentOffset:offset animated:YES];
            
            [UIView commitAnimations];
        }
    }
    
    

}

- (void)inputEnd {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.15];
    //结束编辑的时候，让_scrollView滚到CGPointMake(0, 0);
    CGPoint offset = CGPointMake(0, 0);
    [_meddleView setContentOffset:offset animated:YES];
    [UIView commitAnimations];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _adData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *data = [_adData objectAtIndex:indexPath.row];
    
     NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};

    CGSize size=[[data objectForKey:@"AD_CONTENT"] boundingRectWithSize:CGSizeMake(156, 1000)//最大限制宽和高
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attribute
                                                context:nil].size;
    
    return size.height+20.0;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseIdetify = @"adTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
    
    NSDictionary *data = [_adData objectAtIndex:indexPath.row];
    
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdetify];
        
    }
    
    cell.textLabel.numberOfLines=0;  //可多行显示
    
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
        
    NSString *adText = [NSString stringWithFormat:@"[活动通知]%@",[data objectForKey:@"AD_CONTENT"]];
        
    cell.textLabel.text = [adText stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n"];
    
    return cell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
