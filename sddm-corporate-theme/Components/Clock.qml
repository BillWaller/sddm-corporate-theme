// Config created by Keyitdev https://github.com/Keyitdev/sddm-astronaut-theme
// Copyright (C) 2022-2025 Keyitdev
// Based on https://github.com/MarianArlt/sddm-sugar-dark
// Distributed under the GPLv3+ License https://www.gnu.org/licenses/gpl-3.0.html

import QtQuick 2.15
import QtQuick.Controls 2.15

Column {
    id: clock

    width: parent.width / 2
    spacing: 0

    Label {
        id: headerTextLabel

        anchors.horizontalCenter: parent.horizontalCenter

        font.pointSize: root.font.pointSize * 3
        color: config.HeaderTextColor
        renderType: Text.QtRendering
        text: config.HeaderText
    }

    Label {
        id: timeLabel

        anchors.horizontalCenter: parent.horizontalCenter

        font.pointSize: root.font.pointSize * 9
        font.bold: true
        color: config.TimeTextColor
        renderType: Text.QtRendering

        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(config.Locale), config.HourFormat == "long" ? Locale.LongFormat : config.HourFormat !== "" ? config.HourFormat : Locale.ShortFormat);
        }
    }

    Label {
        id: dateLabel

        anchors.horizontalCenter: parent.horizontalCenter

        color: config.DateTextColor
        font.pointSize: root.font.pointSize * 2
        font.bold: true
        renderType: Text.QtRendering

        function updateTime() {
            // text = new Date().toLocaleDateString(Qt.locale(config.Locale), config.DateFormat == "short" ? Locale.ShortFormat : config.DateFormat !== "" ? config.DateFormat : Locale.LongFormat);
            let date = new Date();
            let day = date.getDate();
            let year = date.getFullYear();
            text = date.toLocaleDateString(Qt.locale(config.Locale), config.DateFormat == "short" ? Locale.ShortFormat : config.DateFormat == "dddd MMMM d" ? config.DateFormat + getDaySuffix(day) + ", " + year : config.DateFormat !== "" ? config.DateFormat : Locale.LongFormat);
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            dateLabel.updateTime();
            timeLabel.updateTime();
        }
    }

    Component.onCompleted: {
        dateLabel.updateTime();
        timeLabel.updateTime();
    }

    function getDaySuffix(day) {
        if (day % 10 === 1 && day % 100 !== 11) {
            return "st";
        } else if (day % 10 === 2 && day % 100 !== 12) {
            return "nd";
        } else if (day % 10 === 3 && day % 100 !== 13) {
            return "rd";
        } else {
            return "th";
        }
    }
}
