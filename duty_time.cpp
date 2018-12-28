#include "duty_time.h"
#include <iostream>
#include <sstream>

duty_time::duty_time() {}

duty_time::duty_time(std::string log_segment)
{
    std::stringstream log_seg_stream(log_segment);

    std::string type_buf;
    std::string string_buf;
    std::getline(log_seg_stream, type_buf, ':');
    if (type_buf.compare("Check_in"))
    {
        // there is an error in this segment
        start_time.tm_sec = 0;
        start_time.tm_min = 0;
        start_time.tm_hour = 0;
        start_time.tm_mday = 0;
        start_time.tm_mon = 0;
        start_time.tm_year = 0;
        return;
    }
    std::getline(log_seg_stream, string_buf, '-');
    start_time.tm_year = stoi(string_buf) - 1900;
    std::getline(log_seg_stream, string_buf, '-');
    start_time.tm_mon = stoi(string_buf) - 1;
    std::getline(log_seg_stream, string_buf, '.');
    start_time.tm_mday = stoi(string_buf);
    std::getline(log_seg_stream, string_buf, ':');
    start_time.tm_hour = stoi(string_buf);
    std::getline(log_seg_stream, string_buf, ':');
    start_time.tm_min = stoi(string_buf);
    std::getline(log_seg_stream, string_buf, ',');
    start_time.tm_sec = stoi(string_buf);

    std::getline(log_seg_stream, type_buf, ':');
    if (type_buf.compare("Check_out"))
    {
        // there is an error in this segment
        end_time.tm_sec = 0;
        end_time.tm_min = 0;
        end_time.tm_hour = 0;
        end_time.tm_mday = 0;
        end_time.tm_mon = 0;
        end_time.tm_year = 0;
        return;
    }
    std::getline(log_seg_stream, string_buf, '-');
    end_time.tm_year = stoi(string_buf) - 1900;
    std::getline(log_seg_stream, string_buf, '-');
    end_time.tm_mon = stoi(string_buf) - 1;
    std::getline(log_seg_stream, string_buf, '.');
    end_time.tm_mday = stoi(string_buf);
    std::getline(log_seg_stream, string_buf, ':');
    end_time.tm_hour = stoi(string_buf);
    std::getline(log_seg_stream, string_buf, ':');
    end_time.tm_min = stoi(string_buf);
    std::getline(log_seg_stream, string_buf);
    end_time.tm_sec = stoi(string_buf);
}
