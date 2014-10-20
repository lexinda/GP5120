//
//  Table.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "Table.h"

@implementation Table

@synthesize USER_COMPANY_NAME;
@synthesize INFO_NO;
@synthesize PORT;
@synthesize FACTORY_CITY;
@synthesize TRAFFIC_TYPE;
@synthesize CHUNK_TYPE;
@synthesize WEIGHT;
@synthesize DESTINATION;
@synthesize STOWAGE_TIME;
@synthesize START;
@synthesize ESPECIAL_REQUEST;
@synthesize PRICE;
@synthesize INFO_STATUS;
@synthesize RELEASE_TIME;
@synthesize RELEASE_PERSON;
@synthesize RELEASE_IP;
@synthesize TARGET_PROVINCE;
@synthesize TARGET_CITY;
@synthesize START_PROVINCE;
@synthesize START_CITY;
@synthesize CONTRACT;
@synthesize LAST_IN;
@synthesize LAST_OUT;
@synthesize E_MAIL;
@synthesize MOBILE;
@synthesize INFO_TYPE;
@synthesize CONTACT_PERSON;
@synthesize CONTACT_TEL;
@synthesize COMPANY_INTRODUCTION;
@synthesize COMPANY_PROVINCE;
@synthesize COMPANY_CITY;
@synthesize COMPANY_SECTION;
@synthesize COMPANY_POISION;
@synthesize COMPANY_TYPE;
@synthesize QUERY_COUNT;
@synthesize GRADE;
@synthesize OWNER_PROFIT;
@synthesize PROFIT_CONFIRM_TIME;
@synthesize PROFIT_BY;
@synthesize MSGTO_NUM;

-(Table *)getTableInfo:(NSDictionary *)tableDictionary{

    Table *tableInfo = [[Table alloc] init];
    [tableInfo setUSER_COMPANY_NAME:[tableDictionary objectForKey:@"USER_COMPANY_NAME"]];
    [tableInfo setINFO_NO:[tableDictionary objectForKey:@"INFO_NO"]];
    [tableInfo setPORT:[tableDictionary objectForKey:@"PORT"]];
    [tableInfo setFACTORY_CITY:[tableDictionary objectForKey:@"FACTORY_CITY"]];
    [tableInfo setTRAFFIC_TYPE:[tableDictionary objectForKey:@"TRAFFIC_TYPE"]];
    [tableInfo setCHUNK_TYPE:[tableDictionary objectForKey:@"CHUNK_TYPE"]];
    [tableInfo setWEIGHT:[tableDictionary objectForKey:@"WEIGHT"]];
    [tableInfo setDESTINATION:[tableDictionary objectForKey:@"DESTINATION"]];
    [tableInfo setSTOWAGE_TIME:[tableDictionary objectForKey:@"STOWAGE_TIME"]];
    [tableInfo setSTART:[tableDictionary objectForKey:@"START"]];
    [tableInfo setESPECIAL_REQUEST:[tableDictionary objectForKey:@"ESPECIAL_REQUEST"]];
    [tableInfo setPRICE:[tableDictionary objectForKey:@"PRICE"]];
    [tableInfo setINFO_STATUS:[tableDictionary objectForKey:@"INFO_STATUS"]];
    [tableInfo setRELEASE_TIME:[tableDictionary objectForKey:@"RELEASE_TIME"]];
    [tableInfo setRELEASE_PERSON:[tableDictionary objectForKey:@"RELEASE_PERSON"]];
    [tableInfo setRELEASE_IP:[tableDictionary objectForKey:@"RELEASE_IP"]];
    [tableInfo setTARGET_PROVINCE:[tableDictionary objectForKey:@"TARGET_PROVINCE"]];
    [tableInfo setTARGET_CITY:[tableDictionary objectForKey:@"TARGET_CITY"]];
    [tableInfo setSTART_PROVINCE:[tableDictionary objectForKey:@"START_PROVINCE"]];
    [tableInfo setSTART_CITY:[tableDictionary objectForKey:@"START_CITY"]];
    [tableInfo setCONTRACT:[tableDictionary objectForKey:@"CONTRACT"]];
    [tableInfo setLAST_IN:[tableDictionary objectForKey:@"LAST_IN"]];
    [tableInfo setLAST_OUT:[tableDictionary objectForKey:@"LAST_OUT"]];
    [tableInfo setE_MAIL:[tableDictionary objectForKey:@"E_MAIL"]];
    [tableInfo setMOBILE:[tableDictionary objectForKey:@"MOBILE"]];
    [tableInfo setINFO_TYPE:[tableDictionary objectForKey:@"INFO_TYPE"]];
    [tableInfo setCONTACT_PERSON:[tableDictionary objectForKey:@"CONTACT_PERSON"]];
    [tableInfo setCONTACT_TEL:[tableDictionary objectForKey:@"CONTACT_TEL"]];
    [tableInfo setCOMPANY_INTRODUCTION:[tableDictionary objectForKey:@"COMPANY_INTRODUCTION"]];
    [tableInfo setCOMPANY_PROVINCE:[tableDictionary objectForKey:@"COMPANY_PROVINCE"]];
    [tableInfo setCOMPANY_CITY:[tableDictionary objectForKey:@"COMPANY_CITY"]];
    [tableInfo setCOMPANY_SECTION:[tableDictionary objectForKey:@"COMPANY_SECTION"]];
    [tableInfo setCOMPANY_POISION:[tableDictionary objectForKey:@"COMPANY_POISION"]];
    [tableInfo setCOMPANY_TYPE:[tableDictionary objectForKey:@"COMPANY_TYPE"]];
    [tableInfo setQUERY_COUNT:[tableDictionary objectForKey:@"QUERY_COUNT"]];
    [tableInfo setPROFIT_CONFIRM_TIME:[tableDictionary objectForKey:@"PROFIT_CONFIRM_TIME"]];
    [tableInfo setPROFIT_BY:[tableDictionary objectForKey:@"PROFIT_BY"]];
    [tableInfo setMSGTO_NUM:[tableDictionary objectForKey:@"MSGTO_NUM"]];
    return tableInfo;
}

-(Table *)getTableInfoDemo{
    
    Table *tableInfo = [[Table alloc] init];
    [tableInfo setUSER_COMPANY_NAME:@"USER_COMPANY_NAME"];
    [tableInfo setINFO_NO:@"INFO_NO"];
    [tableInfo setPORT:@"PORT"];
    [tableInfo setFACTORY_CITY:@"FACTORY_CITY"];
    [tableInfo setTRAFFIC_TYPE:@"TRAFFIC_TYPE"];
    [tableInfo setCHUNK_TYPE:@"CHUNK_TYPE"];
    [tableInfo setWEIGHT:@"WEIGHT"];
    [tableInfo setDESTINATION:@"DESTINATION"];
    [tableInfo setSTOWAGE_TIME:@"STOWAGE_TIME"];
    [tableInfo setSTART:@"START"];
    [tableInfo setESPECIAL_REQUEST:@"ESPECIAL_REQUEST"];
    [tableInfo setPRICE:@"PRICE"];
    [tableInfo setINFO_STATUS:@"INFO_STATUS"];
    [tableInfo setRELEASE_TIME:@"RELEASE_TIME"];
    [tableInfo setRELEASE_PERSON:@"RELEASE_PERSON"];
    [tableInfo setRELEASE_IP:@"RELEASE_IP"];
    [tableInfo setTARGET_PROVINCE:@"TARGET_PROVINCE"];
    [tableInfo setTARGET_CITY:@"TARGET_CITY"];
    [tableInfo setSTART_PROVINCE:@"START_PROVINCE"];
    [tableInfo setSTART_CITY:@"START_CITY"];
    [tableInfo setCONTRACT:@"CONTRACT"];
    [tableInfo setLAST_IN:@"LAST_IN"];
    [tableInfo setLAST_OUT:@"LAST_OUT"];
    [tableInfo setE_MAIL:@"E_MAIL"];
    [tableInfo setMOBILE:@"MOBILE"];
    [tableInfo setINFO_TYPE:@"INFO_TYPE"];
    [tableInfo setCONTACT_PERSON:@"CONTACT_PERSON"];
    [tableInfo setCONTACT_TEL:@"CONTACT_TEL"];
    [tableInfo setCOMPANY_INTRODUCTION:@"COMPANY_INTRODUCTION"];
    [tableInfo setCOMPANY_PROVINCE:@"COMPANY_PROVINCE"];
    [tableInfo setCOMPANY_CITY:@"COMPANY_CITY"];
    [tableInfo setCOMPANY_SECTION:@"COMPANY_SECTION"];
    [tableInfo setCOMPANY_POISION:@"COMPANY_POISION"];
    [tableInfo setCOMPANY_TYPE:@"COMPANY_TYPE"];
    [tableInfo setQUERY_COUNT:@"QUERY_COUNT"];
    [tableInfo setPROFIT_CONFIRM_TIME:@"PROFIT_CONFIRM_TIME"];
    [tableInfo setPROFIT_BY:@"PROFIT_BY"];
    [tableInfo setMSGTO_NUM:@"MSGTO_NUM"];
    return tableInfo;
}

@end

