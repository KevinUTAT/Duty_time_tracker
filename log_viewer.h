#ifndef LOG_VIEWER_H
#define LOG_VIEWER_H

#include <QObject>
#include <QQuickItem>
#include <vector>
#include <time.h>
#include <unordered_map>
#include "duty_time.h"

class log_viewer : public QObject
{
    Q_OBJECT
private:
    std::vector<duty_time> log_list;

    // this hold the index of log element by
    // start date
    std::unordered_map<unsigned, unsigned> log_date_map;

    // the following two indicate the month
    // grid that is being displyed right now
    int focusedYear = 2018; //acture year
    int focusedMonth = 11; // month - 1

    // this define the time in percentage in the morning that
    // is inactive
    int morning[6][7] = {{100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100}};
    // this define the time in percentage in the evening that
    // is inactive
    int evening[6][7] = {{100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100},
                         {100,100,100,100,100,100,100}};
public:
    explicit log_viewer(QObject *parent = nullptr);

    // this load from the log.csv from root
    Q_INVOKABLE void load_local();

    // use to update the focus view
    Q_INVOKABLE void change_focus_year(int year);
    Q_INVOKABLE void change_focus_month(int month);

    // given a date in tm (ignore time), give a coord
    // <row, col> in a 6 by 7 month grid
    std::pair<int, int> month_grid_coord(struct tm date);

    // the start coord and end coord of a month
    void start_end_coord(int year, int month, std::pair<int, int> &start,
                         std::pair<int, int> &end);

    Q_INVOKABLE void update_inactive_tables();

    Q_INVOKABLE int get_morning_inactive(int row, int col);
    Q_INVOKABLE int get_evening_inactive(int row, int col);
signals:
    void morning_inactive_updated();

public slots:
};

#endif // LOG_VIEWER_H
