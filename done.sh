#!/system/bin/sh
logfilename="outputOptimizationDisable_"
timestamp="$(date +%s)"
logfilename="$logfilename$timestamp"
exec > /mnt/media_rw/udisk1/$logfilename.txt 2>&1
export PATH=/sbin:/system/sbin:/system/xbin:/system/bin

echo "Special thanks for enhancement and bugfixes by muncheno and original script by xeon1989"
echo "Script to disable Proton X50 GKUI 19 system apps"
echo "Original script: https://github.com/xeon1989/Proton-X50-APK-Installer-ATLAS/files/11863895/GKUIOptimizationScript.zip"

echo "====== show wireless charging to indicates script start ======="
am start -n com.ecarx.gkuiconfig/.setting.SettingActivity 2>/dev/null
sleep 0.5
input tap 700 200
am start -a android.settings.WPC_SETTINGS 2>/dev/null 
#This open wireless charging, indicates start of script


pm disable com.neusoft.ssp.ces.c4.car.assistant # QDLink

# pm disable com.neusoft.shockwave.tboxclient # TBoxClient (Disables 4G, only disable if 4G subscription expired.)

pm disable com.android.webview # Android System WebView (Outdated)
# Use Opera 66.6.3445.73002 (Disable 'Copy and search') or Kiwi 96.0.4664.46 or Edge 95.0.1020.55 for web browsing

pm disable ecarx.video # Video
pm disable ecarx.photo # Photo

pm disable com.neusoft.na.navigation # Navigation (Navigation app, cannot connect to server)
pm disable ecarx.naviservice # LBSNavi (Navigation Service)
pm disable com.ecarx.naviwidget # Navi (Navigation widget)

pm disable ecarx.weather # weather (Cannot connect to server)
pm disable ecarx.upgrade # XCUpgradeService (Cannot connect to server)
pm disable ecarx.membercenter # Member Centre (Cannot connect to server)
pm disable com.ecarx.thememanager # Themes (Cannot connect to server)
pm disable com.neusoft.dvrlogin # DVR (Geely Driving Video Recorder app)
pm disable com.neusoft.cardvr # Driving record (Geely Driving Video Recorder)
pm disable ecarx.autosecure # Clean Up (Memory Clean Up)
pm disable com.neusoft.onlinemusic # JOOX Music

pm disable com.qihoo360.vehiclesafe # 360 Car Defender Basic Service (Qihoo 360)
pm disable com.chima.vulcan # com.android.chimaster (Qihoo 360 backdoor)
pm disable com.android.onetimeinitializer # One Time Init
pm disable com.android.providers.applications # Search Applications Provider
pm disable com.mediatek.mtklogger # MTKLogger
pm disable com.mediatek.fwk.plugin # FwkPlugin (Mediatek Plugin System)
pm disable org.xwalk.core # XWalkCoreLibrary (Crosswalk Project Runtime)
pm disable com.gosuncn.toolsInstall # ToolsInstall
pm disable com.android.writeimei # writeIMEI


echo "====== renaming the script folder ========"
mv /mnt/media_rw/udisk1/b832bc61472727635baffcf25dd28e9f239273e2 /mnt/media_rw/udisk1/b832bc61472727635baffcf25dd28e9f239273e2_done

echo "=========== ending the script ============"
am start -a android.settings.SETTINGS 	#show settings app to indicates script completed
exec > /dev/null

/system/bin/sh /system/bin/update.sh &
sync
sleep 5
reboot
# Reboot, keep the car power on until IHU finishes starting.
