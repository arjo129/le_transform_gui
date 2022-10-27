import QtQuick 2.9
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Transform Publisher")
    

    GridLayout {
        id: mainLayout
        columns: 6
  	rowSpacing: 2
  	columnSpacing: 2
  	anchors.fill: parent
  	anchors.leftMargin: 10
  	anchors.rightMargin: 10


	Label {
	    text: "From Frame:"
            Layout.columnSpan: 2
	}

	TextField {
            id: fromFrameId
            Layout.columnSpan: 4
            Layout.fillWidth: true
            text: "base_link"
        } 

 	Label {
	    text: "To Frame:"
            Layout.columnSpan: 2
	}

	TextField {
            id: toFrameId
            Layout.columnSpan: 4
            Layout.fillWidth: true
            text: "lidar_link"
        }

 	Label {
            text: "Translation (meters)"
            Layout.columnSpan: 6
        }

	Label {
	    text: "x:"
	    Layout.columnSpan: 1
	}
	TextField {
            id: xTranslationValue
            Layout.columnSpan: 1
            Layout.fillWidth: true
            text: "0.0"
        } 

	Label {
	    text: "y:"
	    Layout.columnSpan: 1
	}
	TextField {
            id: yTranslationValue
            Layout.columnSpan: 1
            Layout.fillWidth: true
            text: "0.0"
        }

	Label {
            text: "z:"
            Layout.columnSpan: 1
        }
        TextField {
            id: zTranslationValue
            Layout.columnSpan: 1
            Layout.fillWidth: true
            text: "0.0"
        }
 

	Label {
            text: "Rotation (Degrees)"
            Layout.columnSpan: 6
        }
	Label {
            text: "Roll"
            Layout.columnSpan: 2
        }
	Label {
            text: "Pitch"
            Layout.columnSpan: 2
        }
	Label {
            text: "Yaw"
            Layout.columnSpan: 2
        }

	SpinBox {
	    id: rollValue
	    Layout.columnSpan: 2
	    from: 0
	    value: 0
	    to: 100 * 360
	    stepSize: 1
            editable: true

	    property int decimals: 2
	    property real realValue: value / 100

	    validator: DoubleValidator {
		bottom: Math.min(rollValue.from, rollValue.to)
		top:  Math.max(rollValue.from, rollValue.to)
	    }

	    textFromValue: function(value, locale) {
		return Number(value / 100).toLocaleString(locale, 'f', rollValue.decimals)
	    }

	    valueFromText: function(text, locale) {
		return Number.fromLocaleString(locale, text) * 100
	    }
	}


	SpinBox {
            id: pitchValue
            Layout.columnSpan: 2
            from: 0
            value: 0
            to: 100 * 360
            stepSize: 1
            editable: true

            property int decimals: 2
            property real realValue: value / 100

            validator: DoubleValidator {
                bottom: Math.min(pitchValue.from, pitchValue.to)
                top:  Math.max(pitchValue.from, pitchValue.to)
            }

            textFromValue: function(value, locale) {
                return Number(value / 100).toLocaleString(locale, 'f', pitchValue.decimals)
            }

            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * 100
            }
        }

	SpinBox {
            id: yawValue
            Layout.columnSpan: 2
            from: 0
            value: 0
            to: 100 * 360
            stepSize: 1
            editable: true

            property int decimals: 2
            property real realValue: value / 100

            validator: DoubleValidator {
                bottom: Math.min(yawValue.from, yawValue.to)
                top:  Math.max(yawValue.from, yawValue.to)
            }

            textFromValue: function(value, locale) {
                return Number(value / 100).toLocaleString(locale, 'f', yawValue.decimals)
            }

            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * 100
            }
        }

	Button {
	   id: publishTransform
           text: "Publish Transform"
           checkable: true
	   Layout.columnSpan: 2
	}	      
    }
}

