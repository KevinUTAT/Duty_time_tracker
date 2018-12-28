#ifndef DUTY_TIME_H
#define DUTY_TIME_H
#include <string>
#include "time.h"


struct duty_time
{
    struct tm start_time;
    struct tm end_time;

    duty_time();
    duty_time(std::string log_segment);
};

#endif // DUTY_TIME_H
