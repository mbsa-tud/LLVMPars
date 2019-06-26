#include <math.h>
#include <stdio.h>
#include <stdint.h>  // for int8_t  uint8_t  int32_t  uint32_t
#include <stdlib.h>

#define __STDC_FORMAT_MACROS
#include <inttypes.h>

//for math funcs
#define CORDIT 16           //!< Cordic Iterations
#define CSCALEX15 0x4DBA    //!< cordic scaling x.15 FP
#define PIHALFX15 0xC90F    //!< x.15 FP

FILE* input_file;
FILE* output_file;

//ifstream input_file; // create and open
//ofstream output_file;

//memory slots
int32_t euler_ref[3];     		//!< 3.15 [rad]
int32_t quat_navsol[4];  		//!< quaternions
int32_t imu_data[6];			//!< imu data
int32_t az;               		//!< 5.13 [g]
int32_t quat_ref[4];	        //!< reference quaternion
int32_t error_quat[4];          //!< error quaternion 3.15 [-]
int32_t s_omegaref[3];         	//!< 4.14 reference rates [rad/s]
int32_t s_qref[3];      		//!< 5.13 [Nm]
int32_t s_zref;         		//!< 8.10 [N/g]
uint16_t mtr_cmd[8];  	//!< 0.16 motor command to each motor [0..1]


//! arctangent table for 2^0 to 2^-9 in fixed point representation (1 int, 15 frac)
uint16_t atant_cos[16] = {25736, 15193, 8027, 4075, 2045, 1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1};

/**
* @fn inline int32_t sign(int32_t var)
* @brief Calculates sign value according to Handel-C logic
* @return 1 if variable is lower than 0, otherwise 0
*/
int32_t sign_1(int32_t var)
{
    return var >= 0 ? 0 : 1;
}

int32_t sign_2(int32_t var)
{
    return var >= 0 ? 0 : 1;
}

int32_t sign_3(int32_t var)
{
    return var >= 0 ? 0 : 1;
}

int32_t sign_4(int32_t var)
{
    return var >= 0 ? 0 : 1;
}

int32_t sign_5(int32_t var)
{
    return var >= 0 ? 0 : 1;
}

int32_t sign_6(int32_t var)
{
    return var >= 0 ? 0 : 1;
}

/**
* @fn inline int32_t power(double N, double P)
* @brief Calculates the power P of a number N
* @param double N - base
* @param double P - exponent
* @return N^P
*/
int32_t power_1(double N, uint32_t P)
{
    int32_t res = N;
    for (uint32_t a=0; a<P-1; a++)
    {
        res*=N;
    }
    return res;
}

int32_t power_2(double N, uint32_t P)
{
    int32_t res = N;
    for (uint32_t a=0; a<P-1; a++)
    {
        res*=N;
    }
    return res;
}

int32_t power_3(double N, uint32_t P)
{
    int32_t res = N;
    for (uint32_t a=0; a<P-1; a++)
    {
        res*=N;
    }
    return res;
}

int32_t power_4(double N, uint32_t P)
{
    int32_t res = N;
    for (uint32_t a=0; a<P-1; a++)
    {
        res*=N;
    }
    return res;
}

int32_t power_5(double N, uint32_t P)
{
    int32_t res = N;
    for (uint32_t a=0; a<P-1; a++)
    {
        res*=N;
    }
    return res;
}

int32_t power_6(double N, uint32_t P)
{
    int32_t res = N;
    for (uint32_t a=0; a<P-1; a++)
    {
        res*=N;
    }
    return res;
}



/**
* @fn fixed_cordCS(int32_t *theta, int32_t *cos, int32_t *sin)
* @brief Fixed Point Cordic sine/cosine algorithm - calculate sine and cosine of the angle theta[rad] between -pi and pi.
* @param int32_t *theta - 3.15 (-pi -> pi)
* @param int32_t *cos   - 3.15 (internally 2.16 but output is 3.15)
* @param int32_t *sin   - 3.15 (internally 2.16 but output is 3.15)
*/
// local inline function
int32_t mulSE315216_1_1(int32_t x, int32_t y)
{
    return (int32_t)((((int64_t)x)*((int64_t)y))>>16);
}

int32_t mulSE315216_1_2(int32_t x, int32_t y)
{
    return (int32_t)((((int64_t)x)*((int64_t)y))>>16);
}

int32_t mulSE315216_2_1(int32_t x, int32_t y)
{
    return (int32_t)((((int64_t)x)*((int64_t)y))>>16);
}

int32_t mulSE315216_2_2(int32_t x, int32_t y)
{
    return (int32_t)((((int64_t)x)*((int64_t)y))>>16);
}

int32_t mulSE315216_3_1(int32_t x, int32_t y)
{
    return (int32_t)((((int64_t)x)*((int64_t)y))>>16);
}

int32_t mulSE315216_3_2(int32_t x, int32_t y)
{
    return (int32_t)((((int64_t)x)*((int64_t)y))>>16);
}



int32_t fixed_cordCS_cos_1(int32_t theta)
{
    // local variables
    int32_t xo, yo, xn, yn, th;
    uint8_t j;
    int32_t cos_ret;

    j=0;

    if(theta > PIHALFX15)
    {
        xo  = 0;
        yo  = 1<<16;
        th = theta - PIHALFX15;
    }
    else if(theta < -PIHALFX15)
    {
        xo = 0;
        yo = -(1<<16);
        th = theta + PIHALFX15;
    }
    else
    {
        xo  = 1<<16;
        yo  = 0;
        th = theta;
    }

    while(j != CORDIT)
    {
        if(sign_1(th) == 0)
        {
            xn = xo - (yo>>(j));
            yn = yo + (xo>>(j));
            th -= (signed)(atant_cos[j]);
        }
        else
        {
            xn = xo + (yo>>(j));
            yn = yo - (xo>>(j));
            th += (signed)(atant_cos[j]);
        }
        // swap values
        xo = xn;
        yo = yn;
        // increment counter
        j++;
    }
    // prepare output
    cos_ret= mulSE315216_1_1(xn,(int32_t)CSCALEX15);
    return cos_ret;
}

int32_t fixed_cordCS_sin_1(int32_t theta)
{
    // local variables
    int32_t xo, yo, xn, yn, th;
    uint8_t j;
    int32_t sin_ret;

    j=0;

    if(theta > PIHALFX15)
    {
        xo  = 0;
        yo  = 1<<16;
        th = theta - PIHALFX15;
    }
    else if(theta < -PIHALFX15)
    {
        xo = 0;
        yo = -(1<<16);
        th = theta + PIHALFX15;
    }
    else
    {
        xo  = 1<<16;
        yo  = 0;
        th = theta;
    }

    while(j != CORDIT)
    {
        if(sign_2(th) == 0)
        {
            xn = xo - (yo>>(j));
            yn = yo + (xo>>(j));
            th -= (signed)(atant_cos[j]);
        }
        else
        {
            xn = xo + (yo>>(j));
            yn = yo - (xo>>(j));
            th += (signed)(atant_cos[j]);
        }
        // swap values
        xo = xn;
        yo = yn;
        // increment counter
        j++;
    }
    // prepare output
    sin_ret = mulSE315216_1_2(yn,(int32_t)CSCALEX15);
    return sin_ret;
}

int32_t fixed_cordCS_cos_2(int32_t theta)
{
    // local variables
    int32_t xo, yo, xn, yn, th;
    uint8_t j;
    int32_t cos_ret;

    j=0;

    if(theta > PIHALFX15)
    {
        xo  = 0;
        yo  = 1<<16;
        th = theta - PIHALFX15;
    }
    else if(theta < -PIHALFX15)
    {
        xo = 0;
        yo = -(1<<16);
        th = theta + PIHALFX15;
    }
    else
    {
        xo  = 1<<16;
        yo  = 0;
        th = theta;
    }

    while(j != CORDIT)
    {
        if(sign_3(th) == 0)
        {
            xn = xo - (yo>>(j));
            yn = yo + (xo>>(j));
            th -= (signed)(atant_cos[j]);
        }
        else
        {
            xn = xo + (yo>>(j));
            yn = yo - (xo>>(j));
            th += (signed)(atant_cos[j]);
        }
        // swap values
        xo = xn;
        yo = yn;
        // increment counter
        j++;
    }
    // prepare output
    cos_ret= mulSE315216_2_1(xn,(int32_t)CSCALEX15);
    return cos_ret;
}

int32_t fixed_cordCS_sin_2(int32_t theta)
{
    // local variables
    int32_t xo, yo, xn, yn, th;
    uint8_t j;
    int32_t sin_ret;

    j=0;

    if(theta > PIHALFX15)
    {
        xo  = 0;
        yo  = 1<<16;
        th = theta - PIHALFX15;
    }
    else if(theta < -PIHALFX15)
    {
        xo = 0;
        yo = -(1<<16);
        th = theta + PIHALFX15;
    }
    else
    {
        xo  = 1<<16;
        yo  = 0;
        th = theta;
    }

    while(j != CORDIT)
    {
        if(sign_4(th) == 0)
        {
            xn = xo - (yo>>(j));
            yn = yo + (xo>>(j));
            th -= (signed)(atant_cos[j]);
        }
        else
        {
            xn = xo + (yo>>(j));
            yn = yo - (xo>>(j));
            th += (signed)(atant_cos[j]);
        }
        // swap values
        xo = xn;
        yo = yn;
        // increment counter
        j++;
    }
    // prepare output
    sin_ret = mulSE315216_2_2(yn,(int32_t)CSCALEX15);
    return sin_ret;


}int32_t fixed_cordCS_cos_3(int32_t theta)
{
    // local variables
    int32_t xo, yo, xn, yn, th;
    uint8_t j;
    int32_t cos_ret;

    j=0;

    if(theta > PIHALFX15)
    {
        xo  = 0;
        yo  = 1<<16;
        th = theta - PIHALFX15;
    }
    else if(theta < -PIHALFX15)
    {
        xo = 0;
        yo = -(1<<16);
        th = theta + PIHALFX15;
    }
    else
    {
        xo  = 1<<16;
        yo  = 0;
        th = theta;
    }

    while(j != CORDIT)
    {
        if(sign_5(th) == 0)
        {
            xn = xo - (yo>>(j));
            yn = yo + (xo>>(j));
            th -= (signed)(atant_cos[j]);
        }
        else
        {
            xn = xo + (yo>>(j));
            yn = yo - (xo>>(j));
            th += (signed)(atant_cos[j]);
        }
        // swap values
        xo = xn;
        yo = yn;
        // increment counter
        j++;
    }
    // prepare output
    cos_ret= mulSE315216_3_1(xn,(int32_t)CSCALEX15);
    return cos_ret;
}

int32_t fixed_cordCS_sin_3(int32_t theta)
{
    // local variables
    int32_t xo, yo, xn, yn, th;
    uint8_t j;
    int32_t sin_ret;

    j=0;

    if(theta > PIHALFX15)
    {
        xo  = 0;
        yo  = 1<<16;
        th = theta - PIHALFX15;
    }
    else if(theta < -PIHALFX15)
    {
        xo = 0;
        yo = -(1<<16);
        th = theta + PIHALFX15;
    }
    else
    {
        xo  = 1<<16;
        yo  = 0;
        th = theta;
    }

    while(j != CORDIT)
    {
        if(sign_6(th) == 0)
        {
            xn = xo - (yo>>(j));
            yn = yo + (xo>>(j));
            th -= (signed)(atant_cos[j]);
        }
        else
        {
            xn = xo + (yo>>(j));
            yn = yo - (xo>>(j));
            th += (signed)(atant_cos[j]);
        }
        // swap values
        xo = xn;
        yo = yn;
        // increment counter
        j++;
    }
    // prepare output
    sin_ret = mulSE315216_3_2(yn,(int32_t)CSCALEX15);
    return sin_ret;
}



/**
* @fn int32_t GainSat(int32_t input, int32_t max_in, int32_t gain)
* @brief Multiplies gain with input or the limit max_in
* @param int32_t input - input value
* @param int32_t max_in - positive and negative border for input value
* @param int32_t gain - gain
* @return product of gain * input or gain * (-)max_in
*/
int32_t PATTGAIN_1_1(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_1_2(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_1_3(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_2_1(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_2_2(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_2_3(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_3_1(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_3_2(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_3_3(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_4_1(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_4_2(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_4_3(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_5_1(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_5_2(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_5_3(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_6_1(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_6_2(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t PATTGAIN_6_3(int32_t g, int32_t value)
{
    return ((int32_t)((( (((int64_t)g)*((int64_t)value)) >>12)+1)>>1));
}

int32_t gain_sat_1(int32_t input, int32_t max_in, int32_t gain)
{
    //! multiply 6.12 with 3.15 and get 4.14 resp. from 4.14 [rad/s] to torque 5.13 [Nm]
    int32_t out;
    if(input > max_in)
    {
        out = PATTGAIN_1_1(gain, max_in);
    }
    else 
    {
        if(input < -max_in)
        {
            out = PATTGAIN_1_2(gain, -max_in);
        }
        else
        {
            out = PATTGAIN_1_3(gain, input);
        }
    }
    return out;
}

int32_t gain_sat_2(int32_t input, int32_t max_in, int32_t gain)
{
    //! multiply 6.12 with 3.15 and get 4.14 resp. from 4.14 [rad/s] to torque 5.13 [Nm]
    int32_t out;
    if(input > max_in)
    {
        out = PATTGAIN_2_1(gain, max_in);
    }
    else 
    {
        if(input < -max_in)
        {
            out = PATTGAIN_2_2(gain, -max_in);
        }
        else
        {
            out = PATTGAIN_2_3(gain, input);
        }
    }
    return out;
}

int32_t gain_sat_3(int32_t input, int32_t max_in, int32_t gain)
{
    //! multiply 6.12 with 3.15 and get 4.14 resp. from 4.14 [rad/s] to torque 5.13 [Nm]
    int32_t out;
    if(input > max_in)
    {
        out = PATTGAIN_3_1(gain, max_in);
    }
    else 
    {
        if(input < -max_in)
        {
            out = PATTGAIN_3_2(gain, -max_in);
        }
        else
        {
            out = PATTGAIN_3_3(gain, input);
        }
    }
    return out;
}

int32_t gain_sat_4(int32_t input, int32_t max_in, int32_t gain)
{
    //! multiply 6.12 with 3.15 and get 4.14 resp. from 4.14 [rad/s] to torque 5.13 [Nm]
    int32_t out;
    if(input > max_in)
    {
        out = PATTGAIN_4_1(gain, max_in);
    }
    else 
    {
        if(input < -max_in)
        {
            out = PATTGAIN_4_2(gain, -max_in);
        }
        else
        {
            out = PATTGAIN_4_3(gain, input);
        }
    }
    return out;
}

int32_t gain_sat_5(int32_t input, int32_t max_in, int32_t gain)
{
    //! multiply 6.12 with 3.15 and get 4.14 resp. from 4.14 [rad/s] to torque 5.13 [Nm]
    int32_t out;
    if(input > max_in)
    {
        out = PATTGAIN_5_1(gain, max_in);
    }
    else 
    {
        if(input < -max_in)
        {
            out = PATTGAIN_5_2(gain, -max_in);
        }
        else
        {
            out = PATTGAIN_5_3(gain, input);
        }
    }
    return out;
}

int32_t gain_sat_6(int32_t input, int32_t max_in, int32_t gain)
{
    //! multiply 6.12 with 3.15 and get 4.14 resp. from 4.14 [rad/s] to torque 5.13 [Nm]
    int32_t out;
    if(input > max_in)
    {
        out = PATTGAIN_6_1(gain, max_in);
    }
    else 
    {
        if(input < -max_in)
        {
            out = PATTGAIN_6_2(gain, -max_in);
        }
        else
        {
            out = PATTGAIN_6_3(gain, input);
        }
    }
    return out;
}
/**
* @fn read_input()
* @brief Read necessary control data out of input_data until limit INPUTLINES is reached.
* @inputs
* @outputs imu_data, euler_ref, quat_navsol, omega_ref, az
*/
void read_input()
{
    char line[1024];
    fgets(line, 1024, input_file);
    sscanf(line,
        "%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";%" SCNd32 ";",
        &imu_data[0],
        &imu_data[1],
        &imu_data[2],
        &imu_data[3],
        &imu_data[4],
        &imu_data[5],
        &euler_ref[0],
        &euler_ref[1],
        &euler_ref[2],
        &az,
        &quat_navsol[0],
        &quat_navsol[1],
        &quat_navsol[2],
        &quat_navsol[3]
        );
    /*
    std::string line;
    std::vector<int32_t> vect;
    uint8_t i;
    std::getline (input_file,line);
    std::stringstream ss(line);
    while (ss.good())
    {
        std::string substr;
        getline( ss, substr, ';' );
        vect.push_back(atoi(substr.c_str()));
    }
    for(i = 0; i < 6; i++)
    {
        imu_data[i] = vect[i];
    }
    for(i = 0; i < 3; i++)
    {
        euler_ref[i] = vect[i+6];
    }
    az = vect[9];
    for(i = 0; i < 4; i++)
    {
        quat_navsol[i] = vect[i+10];
    }
    */
    /*for(uint8_t i = 0; i < 6; i++)
    {
        imu_data[i] = 0;
    }
    for(uint8_t i = 0; i < 3; i++)
    {
        euler_ref[i] = 0;
    }
    az = 0;
    for(uint8_t i = 0; i < 4; i++)
    {
        quat_navsol[i] = 0;
    }*/
}

/**
* @fn eul2quat(int32_t euler_ref[], int32_t quat_ref[])
* @brief Calculate reference quaternion from reference euler angles
* @inputs euler_ref
* @outputs quat_ref
* @param int32_t euler_ref - euler angles
* @param int32_t quat_ref  - reference quaternions
*/

void eul_to_quat()
{
    //LOCAL VARS
    // local variables
    int32_t buff[13];

    //BODY
    // buff[1] -> cos(phi/2); buff[2] -> sin(phi/2)
    buff[0] = euler_ref[0]>>1;
    buff[1] = fixed_cordCS_cos_1(buff[0]);
    buff[2] = fixed_cordCS_sin_1(buff[0]);
    //fixed_cordCS_1(&buff[0], &buff[1], &buff[2]);

    // buff[3] -> cos(theta/2); buff[4] -> sin(theta/2)
    buff[0] = euler_ref[1]>>1;
    buff[3] = fixed_cordCS_cos_2(buff[0]);
    buff[4] = fixed_cordCS_sin_2(buff[0]);
    // buff[5] -> cos(psi/2); buff[6] -> sin(psi/2)
    buff[0] = euler_ref[2]>>1;
    buff[5] = fixed_cordCS_cos_3(buff[0]);
    buff[6] = fixed_cordCS_sin_3(buff[0]);


/*
//BODY
    // buff[1] -> cos(phi/2); buff[2] -> sin(phi/2)
    buff[0] = euler_ref[0]>>1;
    fixed_cordCS_1(buff[0], buff[1], buff[2]);
    //fixed_cordCS_1(&buff[0], &buff[1], &buff[2]);

    // buff[3] -> cos(theta/2); buff[4] -> sin(theta/2)
    buff[0] = euler_ref[1]>>1;
    fixed_cordCS_2(buff[0], buff[3], buff[4]);

    // buff[5] -> cos(psi/2); buff[6] -> sin(psi/2)
    buff[0] = euler_ref[2]>>1;
    fixed_cordCS_3(buff[0], buff[5], buff[6]);

*/
    
    buff[7]  = (( (((int64_t)buff[3])*((int64_t)buff[5])) >>14)+1)>>1;// cos(theta/2)*cos(psi/2)
    buff[8]  = (( (((int64_t)buff[4])*((int64_t)buff[6])) >>14)+1)>>1;// sin(theta/2)*sin(psi/2)
    buff[9]  = (( (((int64_t)buff[4])*((int64_t)buff[5])) >>14)+1)>>1;// sin(theta/2)*cos(psi/2)
    buff[10] = (( (((int64_t)buff[3])*((int64_t)buff[6])) >>14)+1)>>1;// cos(theta/2)*sin(psi/2)
    buff[11] = (( (((int64_t)buff[1])*((int64_t)buff[7])) >>14)+1)>>1;
    buff[12] = (( (((int64_t)buff[2])*((int64_t)buff[8])) >>14)+1)>>1;
    quat_ref[0]  = buff[11] + buff[12];
    buff[11] = (( (((int64_t)buff[2])*((int64_t)buff[7])) >>14)+1)>>1;
    buff[12] = (( (((int64_t)buff[1])*((int64_t)buff[8])) >>14)+1)>>1;
    quat_ref[1]  = buff[11] - buff[12];    
    buff[11] = (( (((int64_t)buff[1])*((int64_t)buff[9])) >>14)+1)>>1;
    buff[12] = (( (((int64_t)buff[2])*((int64_t)buff[10]))>>14)+1)>>1;
    quat_ref[2]  = buff[11] + buff[12];    
    buff[11] = (( (((int64_t)buff[1])*((int64_t)buff[10]))>>14)+1)>>1;
    buff[12] = (( (((int64_t)buff[2])*((int64_t)buff[9])) >>14)+1)>>1;
    quat_ref[3]  = buff[11] - buff[12];
}

/**
* @fn error_quat(int32_t out[], int32_t q1[], int32_t q2[], uint8_t scale)
* @brief Return the error quaternion: out = Q(q1) * q2.
* @inputs quat_navsol, quat_ref
* @outputs error_quat
*/
void err_quat()
{
    //CONSTS
    const uint8_t Qsign[4][4]  = {{0,0,0,0},{0,1,1,0},{0,0,1,1},{0,1,0,1}};  // 0=pos, 1=neg
    const uint8_t Qindex[4][4] = {{0,1,2,3},{1,0,3,2},{2,3,0,1},{3,2,1,0}};  // quat_ref index at position in matrix
    const uint8_t scale = 15;

    //LOCAL_VARS
    int8_t j, k, l;

    //BODY
    for(k = 0; k < 4; k++)
    {
        int32_t mul_buffer[4];
        for(l = 0; l < 4; l++)
        {
            if(Qsign[k][l] == 0) {
                mul_buffer[l] =  (( (((int64_t)quat_ref[Qindex[k][l]]) * ((int64_t)quat_navsol[l])) >> (scale-1))+1) >> 1;
            } else {
                mul_buffer[l] = -((( (((int64_t)quat_ref[Qindex[k][l]]) * ((int64_t)quat_navsol[l])) >> (scale-1))+1) >> 1);
            }
        }
        error_quat[k] = mul_buffer[3]+mul_buffer[2]+mul_buffer[1]+mul_buffer[0];
    }

    // sign bit set -> q0 negative -> invert quat
    if( (error_quat[0] & 0x80000000) != 0 )
    {
        for(j = 0; j < 4; j++)
        {
            error_quat[j] = - error_quat[j];
        }
    }
}

/**
* @fn void attd_ctrl()
* @brief Attitude control.
* @inputs error_quat
* @outputs s_omegaref
*/
void attd_ctrl()
{
    //CONSTS
    //!P-Gains for error quaternion controller as 6.12 values
    const int32_t p_q1_ = 17203; // #define P_Q1 (17203) // 2,1*2^13
    const int32_t p_q2_ = 17213; // #define P_Q2 (17213) // 2,1*2^13
    const int32_t p_q3_ = 27307;

    //BODY
    // output
    s_omegaref[0] = gain_sat_1(error_quat[1], power_1(2,14+13)/p_q1_, (int32_t)p_q1_);
    s_omegaref[1] = gain_sat_2(error_quat[2], power_2(2,14+13)/p_q2_, (int32_t)p_q2_);
    s_omegaref[2] = gain_sat_3(error_quat[3], power_3(2,14+13)/p_q3_, (int32_t)p_q3_);
}

/**
* @fn void RateCtrl_Omega()
* @brief Calculates the new torques.
* @inputs s_omegaref, imu_data, az
* @outputs s_qref, s_zref
*/
void rate_ctrl()
{
    //CONSTS
    //P-Gains for rate controller as 6.12 value
    const int32_t P_ROLL_MAX_  = (10<<12);
    const int32_t P_PITCH_MAX_ = (10<<12);
    const int32_t P_YAW_MAX_   = (1<<12);
    //!P-Gains for rate controller as 6.12 value
    const int32_t p_roll_  = 11470; // #define P_ROLL      (11470) // 1,4*2^13
    const int32_t p_pitch_ = 11470; // #define P_PITCH     (11470)
    const int32_t p_yaw_   =  2090; // #define P_YAW       (2090) // 0,2552*2^13
    //scale
    const uint32_t T_MAX_   = 956;  //!< 956 = 1/8.57 N in x.13 - maximum thrust one motor can provide as x.13 value
    // weight force 8.10 [N]
    const int32_t MASS_   = 48419; //!< 47.28 N (=4.82kg)

    //LOCAL_VARS
    int32_t omega_error_[3]; //!< rate error 4.14 [rad/s]

    //BODY
    omega_error_[0] = s_omegaref[0] - imu_data[0];
    omega_error_[1] = s_omegaref[1] - imu_data[1];
    omega_error_[2] = s_omegaref[2] - imu_data[2];
    s_qref[0] = gain_sat_4(omega_error_[0], (12*power_4(2,13+13))/P_ROLL_MAX_,  p_roll_);
    s_qref[1] = gain_sat_5(omega_error_[1], (12*power_5(2,13+13))/P_PITCH_MAX_, p_pitch_);
    s_qref[2] = gain_sat_6(omega_error_[2], ( 6*power_6(2,13+13))/P_YAW_MAX_,   p_yaw_);
    // scale torque and thrust input
    //! scaleQref: we multiply x.13 with 5.13 and get 3.15
    // scaling like the global variables with nearly same name  
    s_qref[0] = ((int32_t)((((((int64_t)T_MAX_)*((int64_t)s_qref[0]))>>10)+1)>>1));// L_bar = L/T_MAX_
    s_qref[1] = ((int32_t)((((((int64_t)T_MAX_)*((int64_t)s_qref[1]))>>10)+1)>>1));// M_bar = M/T_MAX_
    s_qref[2] = ((int32_t)((((((int64_t)T_MAX_)*((int64_t)s_qref[2]))>>10)+1)>>1));// N_bar = N/T_MAX_

    //! from 4.14 [rad/s] to torque 5.13 [Nm]
    s_zref = ((int32_t)(((((int64_t)MASS_)*((int64_t)az))>>13)+1));
    //! scaleZref: x.13 * 8.10 = 5.23 ==> 5.13
    //int32_t Zref_scaled_;  // 5.13 [-]
    s_zref = ((int32_t)((((((int64_t)T_MAX_)*((int64_t)s_zref))>>9)+1)>>1));    // Z_bar = Z/T_MAX_
}

/**
* @fn void ecg()
* @brief Calculates the new motor commands.
* @inputs s_qref, s_zref
* @outputs mtr_cmd
*/
void ecg()
{
    //CONSTS
    // defines for control matrix - same rotation speed on same arm
    const int32_t BETA1_ = 10884;
    const int32_t BETA2_ = 10884;
    const int32_t BETA3_ = 11853;
    const int32_t BETA4_ = 11853;
    const int32_t BETA5_ = 9218;
    const int32_t BETA6_ = -8192;
    int32_t ctrl_mtrx_L_[] = { BETA1_,  BETA2_,  BETA2_,  BETA1_, -BETA1_, -BETA2_, -BETA2_, -BETA1_ };  //!< 3.15
    int32_t ctrl_mtrx_M_[] = { BETA3_,  BETA4_, -BETA4_, -BETA3_, -BETA3_, -BETA4_,  BETA4_,  BETA3_ };  //!< 3.15
    int32_t ctrl_mtrx_N_[] = { BETA5_,  BETA5_, -BETA5_, -BETA5_,  BETA5_,  BETA5_, -BETA5_, -BETA5_ };  //!< 8.10
    int32_t ctrl_mtrx_Z_[] = { BETA6_,  BETA6_,  BETA6_,  BETA6_,  BETA6_,  BETA6_,  BETA6_,  BETA6_ };  //!< 2.16
    const uint32_t GAMMA1_ = 14405; //!< 0.4396 as x.15 - motor constant - see TN
    const uint32_t GAMMA2_ = 10284; //!< 0.3138 as x.15 - motor constant - see TN

    //LOCAL VARS    
    //locals
    int64_t omega_bar_sq_[8]; // 8.30 [-]
    int32_t omega_bar_[8];
    int8_t  L_ind_, M_ind_, N_ind_, Z_ind_;   // 3.15 [-]
    int64_t buffer_[4];
    uint8_t mtr_nmb_; //!< iterator for motor number from 0 to 7

    //BODY
    // processing and output
    for(mtr_nmb_ = 0; mtr_nmb_ < 8; mtr_nmb_++)
    {
        buffer_[0] = ((int64_t)ctrl_mtrx_L_[mtr_nmb_])*((int64_t)s_qref[0]);        // 3.15 * 3.15 = 6.30
        buffer_[1] = ((int64_t)ctrl_mtrx_M_[mtr_nmb_])*((int64_t)s_qref[1]);        // 3.15 * 3.15 = 6.30
        buffer_[2] = (((int64_t)ctrl_mtrx_N_[mtr_nmb_])*((int64_t)s_qref[2]))<<5;   // 8.10 * 3.15 = 11.25 << 5 = 6.30
        buffer_[3] = (((int64_t)ctrl_mtrx_Z_[mtr_nmb_])*((int64_t)s_zref))<<1;      // 2.16 * 5.13 = 7.29  << 1 = 6.30

        buffer_[0] += buffer_[1];
        buffer_[2] += buffer_[3];
        omega_bar_sq_[mtr_nmb_] = buffer_[0] + buffer_[2];

        if(omega_bar_sq_[mtr_nmb_] > (1<<30)) omega_bar_sq_[mtr_nmb_] = 1<<30;
        if(omega_bar_sq_[mtr_nmb_] < 0) omega_bar_sq_[mtr_nmb_] = 0;
        omega_bar_[mtr_nmb_] = sqrt(omega_bar_sq_[mtr_nmb_]);

        // write output
        buffer_[0] = GAMMA1_*(int64_t)omega_bar_[mtr_nmb_];
        buffer_[1] = GAMMA2_*(((int64_t)((omega_bar_sq_[mtr_nmb_]>>14)+1))>>1);
       
        mtr_cmd[mtr_nmb_] = (int32_t)((((buffer_[0] + buffer_[1])>>13)+1)>>1);
    }
}

/**
* main loop
*/
int main(int argc, char *argv[])
{
    input_file = fopen("data/input.txt","r");
    output_file = fopen("data/output.txt","w");
    static uint32_t step = 0;
    while(step<1)
    //while(step<atoi(argv[2]))
    {
        read_input();
        if(step % 2 == 0)
        {
            if(step % 4 == 0)
                eul_to_quat();
            err_quat();
            attd_ctrl();
        }
//        std::cout << "p";
        rate_ctrl();
        ecg();
        step++;
        
        for(uint8_t i = 0; i < 8; i++)
        {
            fprintf(output_file, "%i;",mtr_cmd[i]);
        }
       fprintf(output_file,"\n");
    }
    fclose(output_file);
    fclose(input_file);
    ecg();
    return 0;
}