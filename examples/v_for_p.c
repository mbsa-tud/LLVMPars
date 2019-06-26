

#include<stdio.h>

void step(int test_data);

double e =0.1, P_1_Gain=49.63, I_gainval=5.945, TSamp_WtEt=103.56, I_DSTATE=0.0,UD_DSTATE=0.0, u=0.0, P_2_Gain=49.63, P_3_Gain=49.65;
int main()
{
    int j;
    for(j = 1; j <= 100; ++j)
    {
        step(10);
    }
}

void step(int test_data)
{
    int test1;
    double rtb_Switch;
    double rtb_TSamp;
    double i;
    test1  = test_data * 2;
    rtb_Switch = P_1_Gain * e;
    if (!(P_2_Gain * e == rtb_Switch)) {
        rtb_Switch = P_3_Gain * e;
    }
    i = I_gainval * e + I_DSTATE;
    rtb_TSamp = e * TSamp_WtEt;
    u = (rtb_Switch + i) + (rtb_TSamp - UD_DSTATE);
    I_DSTATE = i;
    UD_DSTATE = rtb_TSamp;
}
