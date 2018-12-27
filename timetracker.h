#ifndef TIMETRACKER_H
#define TIMETRACKER_H

#include <QObject>
#include <string>
#include <vector>
#include <time.h>
#include <QString>

class TimeTracker : public QObject
{
    Q_OBJECT
private:
    struct tm current_time;

    bool status; // 1 = at work, 0 = off work

    //std::vector<std::string> unwritten_check_in;

    //std::vector<std::string> unwritten_check_out;

public:
    explicit TimeTracker(QObject *parent = nullptr);
    ~TimeTracker();

    // Get current date/time, format is YYYY-MM-DD.HH:mm:ss
    const std::string currentDateTime();

    Q_INVOKABLE const QString get_current_time();
    Q_INVOKABLE const QString get_current_date();

    // the following handles button click;
    Q_INVOKABLE QString get_button_text();
    Q_INVOKABLE void on_button_clicked();
    void change_status();
    void update_log();

signals:

public slots:
};

#endif // TIMETRACKER_H
