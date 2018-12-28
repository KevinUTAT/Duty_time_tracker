#include "log_viewer.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

log_viewer::log_viewer(QObject *parent) : QObject(parent) {}


void log_viewer::load_local()
{
    std::ifstream log_in("log.csv");
    std::string line_buf;

    while (!log_in.eof())
    {
        std::getline(log_in, line_buf);

        duty_time duty_time_temp(line_buf);
        log_list.push_back(duty_time_temp);
    }
}
