import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Label{

        id:label
        text:""
        anchors.bottom:  getBtn.top
        anchors.left: getBtn.left

    }

    Button{
        id:getBtn
        text:"获取"
        width:120
        height:40

        anchors.centerIn:  parent

        onClicked:{
            //label.text =myQmlImp.getValue()
            label.text = myQmlImp.getValue()
        }

    }

    TextField{
        id:textField
        width: getBtn.width
        height: getBtn.height

        anchors.top: getBtn.bottom
        anchors.topMargin: 10
        anchors.left: getBtn.left
    }

    Button{
        id:setBtn
        text: "设置"

        width:getBtn.width
        height: getBtn.height

        anchors.top: textField.bottom
        anchors.topMargin: 10
        anchors.left: textField.left

        onClicked: {
            var value = textField.text
            myQmlImp.setValue(value)
        }

    }


}
