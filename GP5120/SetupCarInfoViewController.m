//
//  SetupCarInfoViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-3.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "SetupCarInfoViewController.h"

@interface SetupCarInfoViewController ()

@end

@implementation SetupCarInfoViewController

@synthesize _mainScrollView;

@synthesize _homeInfoModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"发布派车信息";
        
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
    
    [mainView setBackgroundColor:[UIColor whiteColor]];
    
    self.view =  mainView;
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height-54-49)];
    
    [_mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 568-64-49)];
    
    [self.view addSubview:_mainScrollView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *topImage = [UIImage imageNamed:@"putout_picture"];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 37)];
    
    [topImageView setImage:topImage];
    
    [_mainScrollView addSubview:topImageView];
    
    UILabel *portLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.0, topImageView.frame.origin.y+topImageView.frame.size.height+10.0, 55.0, 20.0)];
    
    [portLabel setText:@"港口:"];
    
    [_mainScrollView addSubview:portLabel];
    
    UITextField *portTextField = [[UITextField alloc] initWithFrame:CGRectMake(portLabel.frame.origin.x+portLabel.frame.size.width, portLabel.frame.origin.y, 175.0, 20.0)];
    
    [portTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    portTextField.placeholder = @"青岛港";
    
    portTextField.delegate = self;
    
    portTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    portTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    portTextField.returnKeyType = UIReturnKeyDone;
    
    portTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    portTextField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:portTextField];
    
    UIImage *portButtonImage = [UIImage imageNamed:@"putout_middle"];
    
    UIButton *portButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [portButton setFrame:CGRectMake(portTextField.frame.origin.x+portTextField.frame.size.width, portLabel.frame.origin.y, 30.0, 20.0)];
    
    [portButton setBackgroundImage:portButtonImage forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:portButton];
    
    UILabel *transportTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(portLabel.frame.origin.x, portLabel.frame.origin.y+portLabel.frame.size.height+10.0, 85.0, 20.0)];
    
    [transportTypeLabel setText:@"运输类型："];
    
    [_mainScrollView addSubview:transportTypeLabel];
    
    UIButton *transportTypeOneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [transportTypeOneButton setFrame:CGRectMake(transportTypeLabel.frame.origin.x+transportTypeLabel.frame.size.width, transportTypeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    transportTypeOneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [transportTypeOneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    transportTypeOneButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [transportTypeOneButton setTitle:@"进口" forState:UIControlStateNormal];
    
    [transportTypeOneButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:transportTypeOneButton];
    
    UIButton *transportTypeTwoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [transportTypeTwoButton setFrame:CGRectMake(transportTypeOneButton.frame.origin.x+transportTypeOneButton.frame.size.width+5.0, transportTypeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    transportTypeTwoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [transportTypeTwoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    transportTypeTwoButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [transportTypeTwoButton setTitle:@"出口" forState:UIControlStateNormal];
    
    [transportTypeTwoButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:transportTypeTwoButton];
    
    UILabel *boxTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(transportTypeLabel.frame.origin.x, transportTypeLabel.frame.origin.y+transportTypeLabel.frame.size.height+10.0, 55.0, 20.0)];
    
    [boxTypeLabel setText:@"箱型："];
    
    [_mainScrollView addSubview:boxTypeLabel];
    
    UITextField *boxTextField = [[UITextField alloc] initWithFrame:CGRectMake(boxTypeLabel.frame.origin.x+boxTypeLabel.frame.size.width, boxTypeLabel.frame.origin.y, 175.0, 20.0)];
    
    [boxTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    boxTextField.placeholder = @"20小柜";
    
    boxTextField.delegate = self;
    
    boxTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    boxTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    boxTextField.returnKeyType = UIReturnKeyDone;
    
    boxTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    boxTextField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:boxTextField];
    
    UILabel *weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(boxTypeLabel.frame.origin.x, boxTypeLabel.frame.origin.y+boxTypeLabel.frame.size.height+10.0, 55.0, 20.0)];
    
    [weightLabel setText:@"重量："];
    
    [_mainScrollView addSubview:weightLabel];
    
    UITextField *weightField = [[UITextField alloc] initWithFrame:CGRectMake(weightLabel.frame.origin.x+weightLabel.frame.size.width, weightLabel.frame.origin.y, 50.0, 20.0)];
    
    [weightField setBorderStyle:UITextBorderStyleRoundedRect];
    
    weightField.placeholder = @"13";
    
    weightField.delegate = self;
    
    weightField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    weightField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    weightField.returnKeyType = UIReturnKeyDone;
    
    weightField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    weightField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:weightField];
    
    UILabel *weightEndLabel = [[UILabel alloc] initWithFrame:CGRectMake(weightField.frame.origin.x+weightField.frame.size.width+3, weightField.frame.origin.y, 30.0, 20.0)];
    
    [weightEndLabel setText:@"吨"];
    
    [_mainScrollView addSubview:weightEndLabel];
    
    UIImage *meddleImage = [UIImage imageNamed:@"putout_top_picture"];
    
    UIImageView *meddleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, weightLabel.frame.origin.y+weightLabel.frame.size.height+5.0, self.view.frame.size.width, 15)];
    
    [meddleImageView setImage:meddleImage];
    
    [_mainScrollView addSubview:meddleImageView];
    
    UILabel *takeTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(weightLabel.frame.origin.x, meddleImageView.frame.origin.y+meddleImageView.frame.size.height+10.0, 85.0, 20)];
    
    [takeTimeLabel setText:@"提货时间："];
    
    [_mainScrollView addSubview:takeTimeLabel];
    
    UIButton *takeOneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [takeOneButton setFrame:CGRectMake(takeTimeLabel.frame.origin.x+takeTimeLabel.frame.size.width, takeTimeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    takeOneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [takeOneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    takeOneButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [takeOneButton setTitle:@"今天" forState:UIControlStateNormal];
    
    [takeOneButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:takeOneButton];
    
    UIButton *takeTwoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [takeTwoButton setFrame:CGRectMake(takeOneButton.frame.origin.x+takeOneButton.frame.size.width+5.0, takeTimeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    takeTwoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [takeTwoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    takeTwoButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [takeTwoButton setTitle:@"明天" forState:UIControlStateNormal];
    
    [takeTwoButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:takeTwoButton];
    
    UIButton *takeThreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [takeThreeButton setFrame:CGRectMake(takeTwoButton.frame.origin.x+takeTwoButton.frame.size.width+5.0, takeTimeLabel.frame.origin.y+5.0,40.0, 15.0)];
    
    takeThreeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [takeThreeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    takeThreeButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [takeThreeButton setTitle:@"后天" forState:UIControlStateNormal];
    
    [takeThreeButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:takeThreeButton];
    
    UIButton *takeFourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [takeFourButton setFrame:CGRectMake(takeOneButton.frame.origin.x, takeTimeLabel.frame.origin.y+takeTimeLabel.frame.size.height+5.0,100.0, 15.0)];
    
    takeFourButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [takeFourButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    takeFourButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [takeFourButton setTitle:@"其他时间" forState:UIControlStateNormal];
    
    [takeFourButton setImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:takeFourButton];
    
    UILabel *phoneLable = [[UILabel alloc] initWithFrame:CGRectMake(takeTimeLabel.frame.origin.x, takeFourButton.frame.origin.y+takeFourButton.frame.size.height+10.0, 85.0, 20)];
    
    [phoneLable setText:@"联系方式："];
    
    [_mainScrollView addSubview:phoneLable];
    
    UITextField *phoneField = [[UITextField alloc] initWithFrame:CGRectMake(phoneLable.frame.origin.x+phoneLable.frame.size.width, phoneLable.frame.origin.y, 143.0, 20.0)];
    
    [phoneField setBorderStyle:UITextBorderStyleRoundedRect];
    
    phoneField.placeholder = @"13789067543";
    
    phoneField.delegate = self;
    
    phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    phoneField.returnKeyType = UIReturnKeyDone;
    
    phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    phoneField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:phoneField];
    
    UILabel *pepleLable = [[UILabel alloc] initWithFrame:CGRectMake(phoneLable.frame.origin.x, phoneLable.frame.origin.y+phoneLable.frame.size.height+10.0, 75.0, 20)];
    
    [pepleLable setText:@"联系人："];
    
    [_mainScrollView addSubview:pepleLable];
    
    UITextField *peopleField = [[UITextField alloc] initWithFrame:CGRectMake(pepleLable.frame.origin.x+pepleLable.frame.size.width, pepleLable.frame.origin.y, 153.0, 20.0)];
    
    [peopleField setBorderStyle:UITextBorderStyleRoundedRect];
    
    peopleField.placeholder = @"马先生";
    
    peopleField.delegate = self;
    
    peopleField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    peopleField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    peopleField.returnKeyType = UIReturnKeyDone;
    
    peopleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    peopleField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:peopleField];
    
    UILabel *destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(pepleLable.frame.origin.x, pepleLable.frame.origin.y+pepleLable.frame.size.height+10.0, 75.0, 20.0)];
    
    [destinationLabel setText:@"目的地:"];
    
    [_mainScrollView addSubview:destinationLabel];
    
    UITextField *destinationField = [[UITextField alloc] initWithFrame:CGRectMake(destinationLabel.frame.origin.x+destinationLabel.frame.size.width, destinationLabel.frame.origin.y, 155.0, 20.0)];
    
    [destinationField setBorderStyle:UITextBorderStyleRoundedRect];
    
    destinationField.placeholder = @"青岛港";
    
    destinationField.delegate = self;
    
    destinationField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    destinationField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    destinationField.returnKeyType = UIReturnKeyDone;
    
    destinationField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    destinationField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:destinationField];
    
    UIImage *destinationButtonImage = [UIImage imageNamed:@"putout_middle"];
    
    UIButton *destinationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [destinationButton setFrame:CGRectMake(destinationField.frame.origin.x+destinationField.frame.size.width, destinationLabel.frame.origin.y, 30.0, 20.0)];
    
    [destinationButton setBackgroundImage:destinationButtonImage forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:destinationButton];
    
    UILabel *ohterLabel = [[UILabel alloc] initWithFrame:CGRectMake(destinationLabel.frame.origin.x, destinationLabel.frame.origin.y+destinationLabel.frame.size.height+10.0, 85.0, 20)];
    
    [ohterLabel setText:@"其他说明："];
    
    [_mainScrollView addSubview:ohterLabel];
    
    UITextField *otherField = [[UITextField alloc] initWithFrame:CGRectMake(ohterLabel.frame.origin.x+ohterLabel.frame.size.width, ohterLabel.frame.origin.y, 143.0, 20.0)];
    
    [otherField setBorderStyle:UITextBorderStyleRoundedRect];
    
    otherField.placeholder = @"点此输入其他说明信息";
    
    otherField.delegate = self;
    
    otherField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    otherField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    otherField.returnKeyType = UIReturnKeyDone;
    
    otherField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    otherField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:otherField];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(ohterLabel.frame.origin.x, ohterLabel.frame.origin.y+ohterLabel.frame.size.height+10.0, 55.0, 20.0)];
    
    [priceLabel setText:@"价格："];
    
    [_mainScrollView addSubview:priceLabel];
    
    UITextField *priceField = [[UITextField alloc] initWithFrame:CGRectMake(priceLabel.frame.origin.x+priceLabel.frame.size.width, priceLabel.frame.origin.y, 120.0, 20.0)];
    
    [priceField setBorderStyle:UITextBorderStyleRoundedRect];
    
    priceField.placeholder = @"点此输入价格";
    
    priceField.delegate = self;
    
    priceField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    priceField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    priceField.returnKeyType = UIReturnKeyDone;
    
    priceField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    priceField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [_mainScrollView addSubview:priceField];
    
    UIButton *priceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [priceButton setFrame:CGRectMake(priceField.frame.origin.x+priceField.frame.size.width+5.0, priceLabel.frame.origin.y+5.0,80.0, 15.0)];
    
    priceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [priceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    priceButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [priceButton setTitle:@"电议/面议" forState:UIControlStateNormal];
    
    [priceButton setImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:priceButton];
    
    UIImage *infoImage = [UIImage imageNamed:@"putout_foot_picture"];
    
    UIImageView *infoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(priceLabel.frame.origin.x, priceLabel.frame.origin.y+priceLabel.frame.size.height+10.0, 56, 12)];
    
    [infoImageView setImage:infoImage];
    
    [_mainScrollView addSubview:infoImageView];
    
    UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [commitButton setFrame:CGRectMake(priceLabel.frame.origin.x, infoImageView.frame.origin.y+infoImageView.frame.size.height+10.0, 104, 32)];
    
    [commitButton setBackgroundImage:[UIImage imageNamed:@"putout_foot_1"] forState:UIControlStateNormal];
    
    [commitButton addTarget:self action:@selector(successCommit:) forControlEvents:UIControlEventTouchUpInside];
    
    [_mainScrollView addSubview:commitButton];
    
    UIButton *commitOtherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [commitOtherButton setFrame:CGRectMake(commitButton.frame.origin.x+commitButton.frame.size.width+20, commitButton.frame.origin.y, 131, 32)];
    
    [commitOtherButton setBackgroundImage:[UIImage imageNamed:@"putout_foot_2"] forState:UIControlStateNormal];
    
    [_mainScrollView addSubview:commitOtherButton];
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,self.view.frame.size.height-49-54, self.view.frame.size.width, 49)];
    
    [self.view addSubview:footButtonView];
    
    // Do any additional setup after loading the view.
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    if ((![_oneTextFiled isExclusiveTouch])||(![_twoTextFiled isExclusiveTouch])) {
//        [_oneTextFiled resignFirstResponder];
//        [_twoTextFiled resignFirstResponder];
//    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)successCommit:(id)action{
    
    SuccessViewController *successViewController = [[SuccessViewController alloc] init];
    
    [self.navigationController pushViewController:successViewController animated:YES];
    
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
