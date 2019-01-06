#include "log_viewer.h"
#include <fstream>
#include <iostream>
#include <string>
#include <ctime>

log_viewer::log_viewer(QObject *parent) : QObject(parent) {}


void log_viewer::load_local()
{
    std::ifstream log_in("log.csv");
    std::string line_buf;
    unsigned idx = 0;

    while (!log_in.eof())
    {
        std::getline(log_in, line_buf);

        duty_time duty_time_temp(line_buf);
        log_list.push_back(duty_time_temp);

        unsigned date_temp = (duty_time_temp.start_time.tm_year + 1900) * 10000
                + (duty_time_temp.start_time.tm_mon + 1) * 100
                + duty_time_temp.start_time.tm_mday;

        log_date_map[date_temp] = idx;
        idx ++;

    }
}


std::pair<int, int> log_viewer::month_grid_coord(struct tm date)
{
    // first, we will process date to have a valid value of wday
    std::time_t date_temp = std::mktime(&date);
    const std::tm *date_out = std::localtime(&date_temp);

    std::pair<int, int> coord;
    coord.second = date_out->tm_wday;
    coord.first = int(date_out->tm_mday / 7) - 1;

    return coord;
}


void log_viewer::change_focus_year(int year)
{
    focusedYear = year;
}


void log_viewer::change_focus_month(int month)
{
    focusedMonth = month;
}


void log_viewer::start_end_coord(int year, int month, std::pair<int, int> &start,
                                 std::pair<int, int> &end)
{
    struct tm startDay = {0, 0, 0, 1, month, year-1900};
    //startDay.tm_mon = month - 1;
    //startDay.tm_year = year - 1900;
    //startDay.tm_mday = 1;
    start = month_grid_coord(startDay);

    struct tm endDay = {0, 0, 0, 28, month, year-1900};
    //endDay.tm_mon = month - 1;
    //endDay.tm_year = year - 1900;
    if (month == 1 || month == 3
            || month == 5 || month == 7
            || month == 8 || month == 10
            ||month == 12)
    {
        endDay.tm_mday = 31;
    }
    else if (month == 4 || month == 6
             || month == 9 || month == 11)
    {
        endDay.tm_mday = 30;
    }
    else
    {
        if ((year & 3) == 0 && ((year % 25) != 0 || (year & 15) == 0)) // leap year
        {
            endDay.tm_mday = 29;
        }
        else {
            endDay.tm_mday = 28;
        }
    }
    end = month_grid_coord(endDay);
}


void log_viewer::update_inactive_tables()
{
    std::pair<int, int> start;
    std::pair<int, int> end;
    start_end_coord(focusedYear, focusedMonth, start, end);
    unsigned day_of_month = 1;

    for (int row = 0; row <= 6; row ++)
    {
        for (int col = 0; col <= 7; col ++)
        {
            if (row < start.first) continue;
            else if (row == start.first + 1 && col < start.second) continue;

            if (row > end.first) continue;
            else if (row == start.first - 1 && col > end.second) continue;


            unsigned date_idx = focusedYear * 10000
                    + (focusedMonth+1) * 100 + day_of_month;

            int hour_temp = log_list[log_date_map[date_idx]].start_time.tm_hour;
            int min_temp = log_list[log_date_map[date_idx]].start_time.tm_min;
            morning[row][col] = int(100 *(hour_temp * 60 + min_temp) / 1440);

            hour_temp = log_list[log_date_map[date_idx]].end_time.tm_hour;
            min_temp = log_list[log_date_map[date_idx]].end_time.tm_min;
            evening[row][col] =
                    int(((24 - hour_temp) * 60 - min_temp) / 1440);
        }
    }
}


int log_viewer::get_morning_inactive(int row, int col)
{
    return morning[row][col];
}


int log_viewer::get_evening_inactive(int row, int col)
{
    return evening[row][col];
}
