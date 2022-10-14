QT += quick
QT += network
QT += quickcontrols2
CONFIG += qmltypes


SOURCES += \
        AuthenticationRepository.cpp \
        main.cpp \
        repository.cpp

resources.prefix = /$${TARGET}

RESOURCES += \
    main.qml \
    resources.qrc \
    ui.qrc \

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =


QML_IMPORT_NAME = io.qt.mouhamed.backend
QML_IMPORT_MAJOR_VERSION = 1

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    AuthenticationRepository.h \
    repository.h
