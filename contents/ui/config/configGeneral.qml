import QtQuick 2.1
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1 
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: configGeneral

    property alias cfg_delay: delay.value
    property alias cfg_size: size.value 
    property alias cfg_deficn: deficn.checked
    property alias cfg_defcoloricn: defcoloricn.checked
    property alias cfg_whiteicn: whiteicn.checked
    property alias cfg_blackicn: blackicn.checked
    property alias cfg_usesameicon: usesameicon.checked
    property alias cfg_usesameiconcolor: usesameiconcolor.checked
    property alias cfg_useamd: useamd.checked
 
    SpinBox {
        id: delay
        Kirigami.FormData.label: i18n("Update interval:") 
        suffix: i18n(" sec")
        minimumValue: 1
        maximumValue: 128 
    }  

    Item {
        Kirigami.FormData.isSection: true
    }

    SpinBox {
        id: size
        Kirigami.FormData.label: i18n("Icon size:")
        suffix: i18n(" px")
        minimumValue: 16
        maximumValue: 64
    } 

    Item {
        Kirigami.FormData.isSection: true
    } 


    ExclusiveGroup { id: gIGB }
    Row {
        Kirigami.FormData.label: i18n("Integrated graphics brand:") 
        spacing: 20

        RadioButton { 
            text: "Intel"
            exclusiveGroup: gIGB
            checked: !useamd.checked
        } 

        RadioButton {
            id: useamd
            text: "AMD"
            exclusiveGroup: gIGB
        }
    }  


    Item {
        Kirigami.FormData.isSection: true
    } 

    ExclusiveGroup { id: gWI }
    Row {
        Kirigami.FormData.label: i18n("Widget Icon:") 
        spacing: 20

        RadioButton {
            id: deficn
            text: i18n("Default (sys76)")
            exclusiveGroup: gWI
        } 

        RadioButton {
            text: i18n("Nvidia/Intel/AMD Icons")
            exclusiveGroup: gWI 
            checked: !deficn.checked
        }
    }  


    Item {
        Kirigami.FormData.isSection: true
    } 

    ExclusiveGroup { id: gWIC }
    Row {
        Kirigami.FormData.label: i18n("Widget Icon color:") 
        spacing: 20

        RadioButton {
            id: defcoloricn
            text: i18n("Default")
            exclusiveGroup: gWIC
        } 

        RadioButton {
            id: whiteicn
            text: i18n("White")
            exclusiveGroup: gWIC

        }
        
        RadioButton {
            id: blackicn
            text: i18n("Black")
            exclusiveGroup: gWIC
        }
    } 


    Item {
        Kirigami.FormData.isSection: true
    } 

    Row{
        Kirigami.FormData.label: i18n("Change all icons:")
    }

    Row
    {
        Item {
            Kirigami.FormData.isSection: true
        } 
        ColumnLayout{ 
            CheckBox {
                id: usesameicon
                text: i18n("Apply the selected icon everywhere (notifications, widget)")
            }
            CheckBox {
                id: usesameiconcolor
                text: i18n("Apply selected icon color everywhere (notifications, widget)")
            }

        }

    }

}
