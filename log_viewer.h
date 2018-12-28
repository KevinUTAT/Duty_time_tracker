#ifndef LOG_VIEWER_H
#define LOG_VIEWER_H

#include <QObject>
#include <QQuickItem>
#include <vector>
#include "duty_time.h"

class log_viewer : public QObject
{
    Q_OBJECT
private:
    std::vector<duty_time> log_list;
public:
    explicit log_viewer(QObject *parent = nullptr);

    // this load from the log.csv from root
    Q_INVOKABLE void load_local();

signals:

public slots:
};

#endif // LOG_VIEWER_H
