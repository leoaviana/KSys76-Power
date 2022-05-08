import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import org.kde.plasma.core 2.0 as PlasmaCore
import QtGraphicalEffects 1.0
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0

Item {
    
    id: root
    property string icon: Qt.resolvedUrl("svg/pop.svg")
    property string dicon: Qt.resolvedUrl("svg/pop.svg")
    property int gpumode: 0
    property int profilemode: 0
    property int pressedbtn: 0
    property bool running: false
    property bool rpending: false
    property bool isswitchable: false
    property bool hpAlreadyRan : false
    property string version: "0.0"

    Connections {
        target: plasmoid.configuration
    }
    
    Component.onCompleted: {
        checkTimer.start()
    }
    
    PlasmaCore.DataSource {
        
        id: execcheckgraphics
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }

    PlasmaCore.DataSource {
        
        id: execcheckprofile
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }

    PlasmaCore.DataSource {
        
        id: execcheckswitchable
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }
    
    PlasmaCore.DataSource {
        
        id: sendnotify
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }

    PlasmaCore.DataSource {

        id: sendmessagebox
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }

        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }

        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)

    }
    
    PlasmaCore.DataSource {
        
        id: checkversion
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }
    
    PlasmaCore.DataSource {
        
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }
    
    PlasmaCore.DataSource {
        
        id: switchcard
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }

    PlasmaCore.DataSource {
        id: findgpu
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }

    PlasmaCore.DataSource {
        id: signalhotplug
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
        
    }
    
    function check(){ 
        execcheckgraphics.exec("dbus-send --system --reply-timeout=300000 --print-reply=literal  --dest=com.system76.PowerDaemon /com/system76/PowerDaemon com.system76.PowerDaemon.GetGraphics")  
        execcheckprofile.exec("dbus-send --system --reply-timeout=300000 --print-reply=literal  --dest=com.system76.PowerDaemon /com/system76/PowerDaemon com.system76.PowerDaemon.GetProfile")
        execcheckswitchable.exec("dbus-send --system --reply-timeout=300000 --print-reply=literal  --dest=com.system76.PowerDaemon /com/system76/PowerDaemon com.system76.PowerDaemon.GetSwitchable")
        if(!root.hpAlreadyRan)
        {
            root.hpAlreadyRan = true 
            signalhotplug.exec("bash ~/.local/share/plasma/plasmoids/org.kde.plasma.ksys76power/contents/scripts/hotplug.sh HotPlugDetect")
        }
    }
    
    function sendNotify(logo, title, msg){
        
        sendnotify.exec("notify-send -a 'KSys76 Power' -h 'string:desktop-entry:org.kde.plasma.ksys76power' -i ~/.local/share/plasma/plasmoids/org.kde.plasma.ksys76power/contents/ui/svg/"+logo+" '"+title+"' '" + msg + "'")
    }

    function sendMessageBox(type, title, msg, action){
        sendmessagebox.exec("kdialog --title '"+ title + "' --" + type + " '" + msg + "' --default "+ action)
    }

    function getDefIcon(name)
    {
        return name.replace("-black", "").replace("-white", "");
    } 

    function getIconByName(name)
    {
        if(!plasmoid.configuration.usesameiconcolor ||
        (plasmoid.configuration.usesameiconcolor && plasmoid.configuration.defcoloricn))
            return name.endsWith(".svg") ? getDefIcon(name) : getDefIcon(name) + ".svg"
        else if(plasmoid.configuration.blackicn)
            return name.endsWith(".svg") ? name.replace(".svg", "-black.svg") : name + "-black.svg"
        else
            return name.endsWith(".svg") ? name.replace(".svg", "-white.svg") : name + "-white.svg"
    }

    function getIconByMode(mode)
    {
        if(!plasmoid.configuration.usesameiconcolor ||
        (plasmoid.configuration.usesameiconcolor && plasmoid.configuration.defcoloricn))
            switch (mode){
                case 1:
                    return "nvidia.svg"
                case 3:
                    return plasmoid.configuration.useamd ? "main-amd.svg" : "main.svg"
                default:
                    return plasmoid.configuration.useamd ? "amd.svg" : "intel.svg"

            }
        else if(plasmoid.configuration.blackicn)
            switch (mode){
                case 1:
                    return "nvidia-black.svg"
                case 3:
                    return plasmoid.configuration.useamd ? "main-amd-black.svg" : "main-black.svg"
                default:
                    return plasmoid.configuration.useamd ? "amd-black.svg" : "intel-black.svg"

            }
        else
            switch (mode){
                case 1:
                    return "nvidia-white.svg"
                case 3:
                    return plasmoid.configuration.useamd ? "main-amd-white.svg" : "main-white.svg"
                default:
                    return plasmoid.configuration.useamd ? "amd-white.svg" : "intel-white.svg"

            }
    }
    
    function getIcon(name, isUi)
    {
        if((plasmoid.configuration.deficn && (isUi && plasmoid.configuration.usesameicon)) || ((plasmoid.configuration.deficn && !isUi) || name== "default"))
        {
            if(plasmoid.configuration.defcoloricn || (isUi && !plasmoid.configuration.usesameiconcolor)) 
                return "pop.svg"
            else if(plasmoid.configuration.blackicn)
                return "pop-black.svg"
            else
                return "pop-white.svg"
        } 
        else
        {
            if(plasmoid.configuration.defcoloricn || (isUi && !plasmoid.configuration.usesameiconcolor)){
                switch (name){
                    case "nvidia":
                        return "nvidia.svg"
                    case "main":
                        return plasmoid.configuration.useamd ? "main-amd.svg" : "main.svg"
                    case "integrated":
                        return plasmoid.configuration.useamd ? "amd.svg" : "intel.svg"
                    default:
                        return "main.svg"
                }
            }else if(plasmoid.configuration.blackicn){
                switch (name){
                    case "nvidia":
                        return "nvidia-black.svg"
                    case "main":
                        return plasmoid.configuration.useamd ? "main-amd-black.svg" : "main-black.svg"
                    case "integrated":
                        return plasmoid.configuration.useamd ? "amd-black.svg" : "intel-black.svg"
                    default:
                        return "main-black.svg"
                }
            }else{
                switch (name){
                    case "nvidia":
                        return "nvidia-white.svg"
                    case "main":
                        return plasmoid.configuration.useamd ? "main-amd-white.svg" : "main-white.svg"
                    case "integrated":
                        return plasmoid.configuration.useamd ? "amd-white.svg" : "intel-white.svg"
                    default:
                        return "main-white.svg"
                }
            }
        }
    }

    function setGraphics(mode)
    {
        switchcard.exec("dbus-send --system --reply-timeout=300000 --print-reply=literal --dest=com.system76.PowerDaemon /com/system76/PowerDaemon com.system76.PowerDaemon.SetGraphics string:" + mode)
    }

    function switchCard(mode){
        root.gpumode = mode
        root.pressedbtn = mode
        root.running = true

        var nText = i18n("Changing video mode, please wait a moment...")

        switch (mode) {
            case 1:
                sendNotify(getIcon('nvidia', true), i18n("NVIDIA mode selected"), nText)
                setGraphics("nvidia")
                break
            case 3:
                sendNotify(getIcon('main', true), i18n("Hybrid mode selected"), nText)
                setGraphics("hybrid")
                break
            case 4:
                sendNotify(getIcon('integrated', true), i18n("Compute mode selected"), nText)
                setGraphics("compute")
                break
            default:
                sendNotify(getIcon('integrated', true), i18n("Integrated mode selected"), nText)
                setGraphics("integrated")
                break
        }
        
    }

    function setProfile(mode)
    {
        executable.exec("dbus-send --system --reply-timeout=300000 --print-reply=literal --dest=com.system76.PowerDaemon /com/system76/PowerDaemon com.system76.PowerDaemon." + mode)
        root.running =  false
    }

    function switchProfile(mode){
        root.profilemode = mode 
        root.running = true

        function vText(name, x) { return x ? i18n("Profile '%1' selected", name) :  i18n("Energy profile '%1' applied successfuly.", name)}

        switch (mode) {
            case 1:
                sendNotify(getIcon('default', true), vText(i18n("Economy"), true), vText(i18n("Economy"), false))
                setProfile("Battery")
                break
            case 2:
                sendNotify(getIcon('default', true), vText(i18n("Balanced"), true), vText(i18n("Balanced"), false))
                setProfile("Balanced")
                break
            case 3:
                sendNotify(getIcon('default', true), vText(i18n("Performance"), true), vText(i18n("Performance"), false))
                setProfile("Performance")
                break 
        }
        
    }
    
    function nvidiaSettings(){
    
        executable.exec("nvidia-settings")
        
    }
    
    function checkVersion(){
        checkversion.exec("nvidia-settings -v")        
    }

    function checkFirstOpen(){
        if(plasmoid.configuration.firstopen)
        {
            var mesg = i18n("You have some missing dependencies needed by KSys76 Power widget. Please select one from the list below and press OK for instructions on how to install, when you're done press CANCEL to exit this dialog. To install packages, you may need to use sudo.")
            mesg = mesg.replace(/(.{1,69})(?:$| )/g, "$1\n") 

            executable.exec("cp ~/.local/share/plasma/plasmoids/org.kde.plasma.ksys76power/contents/org.kde.plasma.ksys76power.desktop ~/.local/share/applications/org.kde.plasma.ksys76power.desktop")
            findgpu.exec("lspci")
            executable.exec("bash ~/.local/share/plasma/plasmoids/org.kde.plasma.ksys76power/contents/scripts/firstrun.sh \"KSys76 Power\" \"" + mesg + "\"")
        }
    }

    function getModeStr(bat)
    {
        if(!bat){
            var str = i18n("Current mode:")
            switch (root.gpumode) {
                case 1:
                    return str + " " + "NVIDIA"
                case 2:
                    return str + " " + i18n("Integrated")
                case 3:
                    return str + " " + i18n("Hybrid")
                default:
                    return str + " " + i18n("Compute")
            }
        }else
        {
            var str = i18n("Current profile:")

            switch (root.profilemode) {
                case 1:
                    return str + " " + i18n("Economy")
                case 2:
                    return str + " " + i18n("Balanced") 
                default:
                    return str + " " + i18n("Performance")
            }
        }
    }
    
    Connections {
        target: switchcard

        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            if(exitCode == 0){
                var sc = i18n("Switch Card")
                var sx = i18n("Restart pending to apply changes")
                function notifyText(mode){ return i18n("You have selected the %1 mode as the system graphics mode. You must reboot your computer for the change to take effect.", mode) }
                function messageText(mode) { return notifyText(mode) + " " + i18n("Do you want to reboot now?") }

                switch (root.pressedbtn){
                    case 1:
                        sendNotify(getIcon('nvidia', true), sx, notifyText("NVIDIA"))
                        sendMessageBox('warningyesno', sc, messageText("NVIDIA"), "reboot")
                        rpending = true
                        break
                    case 2:
                        sendNotify(getIcon('integrated', true), sx, notifyText(i18n("Integrated")))
                        sendMessageBox('warningyesno', sc, messageText(i18n("Integrated")), "reboot")
                        rpending = true
                        break
                    case 3:
                        sendNotify(getIcon('main', true), sx, notifyText(i18n("Hybrid")))
                        sendMessageBox('warningyesno', sc, messageText(i18n("Hybrid")), "reboot")
                        rpending = true
                        break
                    case 4:
                        sendNotify(getIcon('integrated', true), sx, notifyText(i18n("Compute")))
                        sendMessageBox('warningyesno', sc, messageText(i18n("Compute")), "reboot")
                        rpending = true
                        break
                    default:
                        break
                }
            }
            else
            {
                sendNotify(getIcon('main', true), i18n("Operation Error"), i18n("The operation might have not completed, an error occurred.") + "\n\n" + i18n("Exit Code: %1", exitCode) + "\n" + i18n("Error: %1", stderr))
            }

            running = false
        }
    }

    Connections {
        target: sendmessagebox

        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            var action = cmd.split("--default ")[1]
            
            switch (action)
            {
                case "reboot":
                    if(exitCode == 0){
                        executable.exec("systemctl reboot")
                    }
                    break
                case "switchmode":
                    if(exitCode == 0){
                        if(!root.running)
                            switchCard(3)
                        else
                            sendMessageBox('msgbox', i18n("Graphics switch already in progress..."), i18n("Another graphics mode switch is already in progress..."))
                    }
                    break
                default:
                    break

            }
        }
    }
    
    Connections {
        target: execcheckgraphics

        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            var formattedText = stdout.trim()
            var errorText = stderr
            if (formattedText.search("nvidia") > -1) {
                root.icon = Qt.resolvedUrl("svg/" + getIcon("nvidia")) 
                root.dicon = Qt.resolvedUrl("svg/" + getIcon("nvidia", true)) 
                root.gpumode = 1
            } else if (formattedText.search("integrated") > -1){
                root.icon = Qt.resolvedUrl("svg/" + getIcon("integrated")) 
                root.dicon = Qt.resolvedUrl("svg/" + getIcon("integrated", true)) 
                root.gpumode = 2
            } else if (formattedText.search("hybrid") > -1){
                root.icon = Qt.resolvedUrl("svg/" + getIcon("main")) 
                root.dicon = Qt.resolvedUrl("svg/" + getIcon("main", true)) 
                root.gpumode = 3
            } else {
                root.icon = Qt.resolvedUrl("svg/" + getIcon("integrated")) 
                root.dicon = Qt.resolvedUrl("svg/" + getIcon("integrated", true)) 
                root.gpumode = 4
            }
        }
    }

    Connections {
        target: execcheckswitchable
        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            var formattedText = stdout.trim() 
            var errorText = stderr
            if (formattedText.search(/true/i) > -1) { 
                root.isswitchable = true;
            } else { 
                root.isswitchable = false;
            }
        }
    }

    Connections {
        target: execcheckprofile

        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            var formattedText = stdout.trim() 
            var errorText = stderr
            if (formattedText.search(/battery/i) > -1) { 
                root.profilemode = 1
            } else if (formattedText.search(/balanced/i) > -1){ 
                root.profilemode = 2
            } else { 
                root.profilemode = 3
            }
        }
    }
    
    Connections {
        target: checkversion

        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            var formattedText = stdout.trim()
            var first = formattedText.search(/version/i)
            var last = formattedText.search(/The/i)
            var version = formattedText.substring(first, last)
            var errorText = stderr
            root.version = version.trim()
        }
    }

    Connections {
        target: findgpu

        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            var formattedText = stdout.split(/[\r\n]+/) 

            for(let i = 0; i < formattedText.length; i++)
            {
                if((formattedText[i].search(/VGA compatible controller/i) != -1 ||
                    formattedText[i].search(/3D controller/i) != -1) || (formattedText[i].search(/XGA compatible controller/i) != -1 ||
                    formattedText[i].search(/Display controller/i) != -1))
                {
                    var first = formattedText[i].search(/controller: Intel/i) 
                    var last = formattedText[i].search(/\]/i)
                    var result = formattedText[i].substring(first, last)

                    if(first != -1)
                    {
                        plasmoid.configuration.useamd = false;
                    }
                    else
                    {
                        var amdap = formattedText[i].search(/controller: AMD/i)
                        first = amdap == -1 ? formattedText[i].search(/controller: Advanced Micro Devices/i) : amdap

                        var L= formattedText[i].length
                        var pos = 2
                        last = -1
                        while(pos-- && last++<L){
                            last = formattedText[i].indexOf("]", last);
                            if (last < 0) break;
                        }

                        result = formattedText[i].substring(first, last)
                        if(first != -1)
                        {
                            plasmoid.configuration.useamd  = true;
                        }                        
                    }
                }
            }
            
            plasmoid.configuration.firstopen = false
        }
    }

    Connections {
        target: signalhotplug

        function onExited (cmd, exitCode, exitStatus, stdout, stderr) {
            var sc = i18n("Hotplug Detected")
            var sx = i18n("Switch to Hybrid or NVIDIA mode to use external displays,") 

            function notifyText(mode){ return i18n("External displays are connected to the NVIDIA card. Switch to %1 mode to use them.", mode) }
            function messageText(mode) { return notifyText(mode) + " " + i18n("Do you want to switch to %1 graphics mode now?", mode) }
    
            switch(exitCode)
            { 
            //  case 248: // PowerProfileSwitch
                case 250: // HotPlugDetect

                    if(root.gpumode == 4 /*compute*/ || root.gpumode == 2 /*integrated*/)
                    {
                        sendNotify(getIcon('integrated', true), sc, notifyText(i18n("Hybrid")))
                        sendMessageBox('warningyesno', sc, messageText(i18n("Hybrid")), "switchmode")
                    }

                    if(root.gpumode == 3)
                        executable.exec("xrandr -q") 
                    break;
                default:
                    break;

            } 
            
            root.hpAlreadyRan = false;
        }
    }
    
	
	Item {
        id: tool

        property int preferredTextWidth: PlasmaCore.Units.gridUnit * 20
        Layout.minimumWidth: childrenRect.width + PlasmaCore.Units.gridUnit
        Layout.minimumHeight: childrenRect.height + PlasmaCore.Units.gridUnit
        Layout.maximumWidth: childrenRect.width + PlasmaCore.Units.gridUnit
        Layout.maximumHeight: childrenRect.height + PlasmaCore.Units.gridUnit

        ColumnLayout{
    
            anchors {
                left: parent.left 
                margins: PlasmaCore.Units.gridUnit / 2
            } 

            ColumnLayout{
                Row{
                    Image {
                        source: Qt.resolvedUrl(getIconByName("svg/pop.svg"))
                        width: 32
                        height: 32
                    }
                    Rectangle{
                        width:5
                        height:1
                        opacity:0
                    }
                    PlasmaExtras.Heading {
                        id: tooltipHeading
                        level: 1
                        Layout.fillWidth: true 
                        elide: Text.ElideRight
                        wrapMode: Text.Wrap
                        text: "KSys76 Power"
                        visible: text != ""
                    } 
                }
                Rectangle{
                    Layout.fillWidth: true
                    height: 1
                }
            }

            Rectangle{
                height:10
                opacity:0
            }

            ColumnLayout{
                id: setGraphicsCol
                visible: root.isswitchable

                Item{
                    Layout.fillWidth: true
                    height: 30

                    PlasmaExtras.Heading {
                        id: tooltipMaintext
                        level: 3
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                        anchors.left: parent.left
                        wrapMode: Text.Wrap
                        text: i18n("Graphics Mode")
                        visible: text != ""
                    }  

                    Image {
                        id: tooltipImage
                        source: Qt.resolvedUrl("svg/" + getIconByMode(root.gpumode))
                        anchors.right: parent.right
                        width: 32
                        height: 32
                    }
                }

                Row{
                    Image {
                        id: loading
                        source: Qt.resolvedUrl("svg/loading.svg") 
                        width: 24
                        height: 24
                        visible: running
                        NumberAnimation on rotation {
                            from: 0
                            to: 360
                            running: loading.visible == true
                            loops: Animation.Infinite
                            duration: 900
                        }
                    }
                    Rectangle
                    {
                        width: 5
                        height:1
                        opacity:0
                        visible: running
                    }
                    PlasmaComponents.Label {
                        id: tooltipSubtext
                        Layout.fillWidth: true
                        height: undefined
                        wrapMode: Text.WordWrap
                        text: running ? i18n("Executing system76-power...") : getModeStr(false)
                        opacity: running ? 1 : 0.8
                        visible: text != ""
                        maximumLineCount: 8
                    } 
                }

                PlasmaComponents.Label {
                    id: tooltipSubtext2
                    Layout.fillWidth: true
                    height: undefined
                    wrapMode: Text.WordWrap
                    text: i18n("A reboot is pending.")
                    color: 'red'
                    visible: text != "" && rpending
                    maximumLineCount: 8
                }
                PlasmaComponents.Label {
                    id: version
                    Layout.fillWidth: true
                    height: undefined
                    wrapMode: Text.WordWrap
                    text: "Nvidia Driver " + root.version
                    opacity: .5
                    visible: root.gpumode != 2
                    maximumLineCount: 8
                }                
                PlasmaComponents.ToolButton {
                    iconSource: root.pressedbtn == 0 ? (root.gpumode == 1 ? "preview-render-on" : "preview-render-off") : (root.pressedbtn == 1 ? "preview-render-on" : "preview-render-off")
                    text: i18n("NVIDIA Mode")
                    enabled: running ? false : (root.pressedbtn == 0 ? root.gpumode != 1 : root.pressedbtn != 1)
                    onClicked: switchCard(1)
                }
                PlasmaComponents.ToolButton {
                    iconSource: root.pressedbtn == 0 ? (root.gpumode == 2 ? "preview-render-on" : "preview-render-off") : (root.pressedbtn == 2 ? "preview-render-on" : "preview-render-off")
                    text: i18n("Integrated Mode")
                    enabled: running ? false : (root.pressedbtn == 0 ? root.gpumode != 2 : root.pressedbtn != 2)
                    onClicked: switchCard(2)
                }
                PlasmaComponents.ToolButton {
                    iconSource: root.pressedbtn == 0 ? (root.gpumode == 3 ? "preview-render-on" : "preview-render-off") : (root.pressedbtn == 3 ? "preview-render-on" : "preview-render-off")
                    text: i18n("Hybrid Mode")
                    enabled: running ? false : (root.pressedbtn == 0 ? root.gpumode != 3 : root.pressedbtn != 3)
                    onClicked: switchCard(3)
                }
                PlasmaComponents.ToolButton {
                    iconSource: root.pressedbtn == 0 ? (root.gpumode == 4 ? "preview-render-on" : "preview-render-off") : (root.pressedbtn == 4 ? "preview-render-on" : "preview-render-off")
                    text: i18n("Compute Mode")
                    enabled: running ? false : (root.pressedbtn == 0 ? root.gpumode != 4 : root.pressedbtn != 4)
                    onClicked: switchCard(4)
                } 
                PlasmaComponents.ToolButton {
                    iconSource: Qt.resolvedUrl("svg/nvdock.png")
                    text: i18n("NVIDIA Settings")
                    onClicked: nvidiaSettings()
                    visible: root.gpumode != 2
                }
                
            }

            MenuSeparator
            {
                    topPadding: 0
                    bottomPadding: 0
            } 

            ColumnLayout
            {
                id: batteryModeCol
                
                PlasmaExtras.Heading {
                    id: tooltipMaintext2
                    level: 3
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    wrapMode: Text.Wrap
                    text: i18n("Power Profile")
                    visible: text != ""
                }

                PlasmaComponents.Label {
                    id: btooltipSubtext2
                    Layout.fillWidth: true
                    height: undefined
                    wrapMode: Text.WordWrap
                    text: getModeStr(true)
                    opacity: 0.8
                    visible: text != ""
                    maximumLineCount: 8
                }

                PlasmaComponents.ToolButton {
                    iconSource: "battery-charged"
                    text: i18n("Economy")
                    onClicked: switchProfile(1)
                    enabled: running ? false : root.profilemode != 1
                } 
                PlasmaComponents.ToolButton {
                    iconSource: "battery-040-charging"
                    text: i18n("Balanced")
                    onClicked: switchProfile(2)
                    enabled: running ? false : root.profilemode != 2
                } 
                PlasmaComponents.ToolButton {
                    iconSource: "battery-100-charging"
                    text: i18n("Performance")
                    onClicked: switchProfile(3)
                    enabled: running ? false : root.profilemode != 3
                } 
            }
        }
    }
    
    Plasmoid.compactRepresentation: Item {
        PlasmaCore.IconItem {
            id: ima
            width: plasmoid.configuration.size
            height: plasmoid.configuration.size
            anchors.centerIn: parent 
            source: root.icon 
        }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
        PlasmaCore.ToolTipArea {
            id: toolTip
            width: parent.width
            height: parent.height
            anchors.fill: parent
            mainItem: tool
            interactive: true
        }

    }
    
    Plasmoid.fullRepresentation: Item {}
    
    Timer {
        id: checkTimer
        interval: plasmoid.configuration.delay * 1000
        running: false
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            check()
            checkVersion()
            checkFirstOpen()
        }
    }
    
}
