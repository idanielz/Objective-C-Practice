//
//  main.c
//  PBR
//
//  Created by DanielZ on 13-10-29.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#include <stdio.h>
#include <math.h>


void getPolar( float x, float y, double *rPtr, double *thetaPtr)
{
    if (rPtr)
    *rPtr = sqrt(x * x + y * y);
    if (!thetaPtr)
        return;
    if ( 0.0 == x)
    {
        if (0.0 == y)
        {
            *thetaPtr = 0.0;
        }
        else
            *thetaPtr = M_PI_2;
    }
    else
        *thetaPtr = atan(y/x);
}

int main(int argc, const char * argv[])
{

    // insert code here...
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    fractionPart = modf(pi, &integerPart);
    printf("integerPart is %.0f, fractionPart is %.2f \n", integerPart, fractionPart);
    
    //根据笛卡尔坐标计算极坐标
    double x = 3.0;
    double y = 4.0;
    double radius;//极径
    double angle;//极角
    getPolar(x, y, &radius, &angle);
    printf("radius: %.2f , angle: %.2f\n", radius, angle);
    return 0;
}

