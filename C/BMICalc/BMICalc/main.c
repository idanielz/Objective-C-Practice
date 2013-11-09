//
//  main.c
//  BMICalc
//
//  Created by DanielZ on 13-10-29.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#include <stdio.h>
#include <time.h>

typedef struct  {
    float heightInMeters;
    int weightInKilos;
}Person;


typedef struct{
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;//一个月的天数
    int tm_mon;//从一月算起的月数【0-11】
    int tm_year;//从1900年算起的年数
    int tm_wday;//从周日算起的天数【0-6】
    int tm_yday;//从1月1日算起的天数【0-365】
    int tm_isdst;//夏时令标志位
    long tm_gmtoff;//和UTC之间的时差，以秒为单位
    char *tm_zone;//时区缩写
} tm;

int main(int argc, const char * argv[])
{
    
    // insert code here...
    Person person;
    person.heightInMeters = 1.8;
    person.weightInKilos = 50;
    float result = person.weightInKilos/(person.heightInMeters*person.heightInMeters);
    if ( result < 20)
        
    printf("result : %f 瘦!\n", result);
    
    
    //practise time
    tm now;
    long timesince1970 = time(NULL);
    long timeafter400w = timesince1970+3600*24*4;
    
    printf("%ld\n", timeafter400w);
    localtime_r(&timeafter400w, &now);
    
    printf("%d-%d-%d, %d:%d:%d %s  星期%d  %d\n",now.tm_year+1900, now.tm_mon+1, now.tm_mday, now.tm_hour,now.tm_min,now.tm_sec, now.tm_zone, now.tm_wday, now.tm_isdst);
    return 0;
}

