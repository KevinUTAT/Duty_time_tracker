#include "timetracker.h"
#include <time.h>
#include <fstream>
#include <iostream>
#include <sstream>

TimeTracker::TimeTracker(QObject *parent) : QObject(parent)
{
    // check if status.txt is there
    std::ifstream status_in("status.txt");
    if (!status_in.good())
    {
        std::ofstream temp_status;
        temp_status.open("status.txt");
        temp_status << "0";
        temp_status.close();
        status_in.open("status.txt");
    }
    // read the status from last time
    std::string s_status;
    std::getline(status_in, s_status);
    status = bool(int(std::stol(s_status)));
    status_in.close();

    // check if log.csv is there
    std::ifstream log_in("log.csv");
    if (!log_in.good())
    {
        std::ofstream temp_log;
        temp_log.open("log.csv");
        temp_log.close();
    }
    log_in.close();
}

TimeTracker::~TimeTracker()
{
    // before closing, write status to file
   std::ofstream status_out;
   status_out.open("status.txt");
   status_out << int(status);
   status_out.close();
}


// The implomentation of this function come from
// the internet, thanks for TrungTN and Rashad
// on StackOverflow
const std::string TimeTracker::currentDateTime()
{
    time_t     now = time(nullptr);
    struct tm  tstruct;
    char       buf[80];
    tstruct = *localtime(&now);
    // Visit http://en.cppreference.com/w/cpp/chrono/c/strftime
    // for more information about date/time format
    strftime(buf, sizeof(buf), "%Y-%m-%d.%X", &tstruct);

    current_time = tstruct;

    return buf;
}


const QString TimeTracker::get_current_time()
{
    // refrash current time
    currentDateTime();

    std::string time_out = std::to_string(current_time.tm_hour) + ":"
                            + std::to_string(current_time.tm_min) + ":"
                            + std::to_string(current_time.tm_sec);

    return QString::fromStdString(time_out);
}


const QString TimeTracker::get_current_date()
{
    // refrash current time
    currentDateTime();

    std::string date_out = std::to_string(current_time.tm_year + 1900) + "-"
                            + std::to_string(current_time.tm_mon + 1) + "-"
                            + std::to_string(current_time.tm_mday);
    return QString::fromStdString(date_out);
}


QString TimeTracker::get_button_text(){
    if (status) return "Check Out";
    else return "Check In";
}

void TimeTracker::on_button_clicked()
{
    update_log();
    change_status();
}


void TimeTracker::change_status()
{
    status = !status;
}


void TimeTracker::update_log()
{
    std::ofstream log_out;
    log_out.open("log.csv", std::ios_base::app);

    if (!status) // when start the day
    {
        log_out << "Check_in:" << currentDateTime() << ",";
    }
    else        // end of day
    {
        log_out << "Check_out:" << currentDateTime() << "\n";
    }
    log_out.close();
}
