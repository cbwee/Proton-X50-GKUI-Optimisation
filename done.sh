#!/system/bin/sh
logfilename="outputOptimizationEnable_"
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

pm disable com.neusoft.na.navigation # Navigation app
pm disable ecarx.naviservice # Navigation Service
pm disable com.ecarx.naviwidget # Navigation widget

pm disable ecarx.weather # Weather app
pm disable ecarx.upgrade # Updater (Cannot connect to server)
pm disable ecarx.membercenter # Member Center (Cannot connect to server)
pm disable com.ecarx.thememanager # Theme app (Cannot connect to server)

pm disable com.qihoo360.vehiclesafe # Qihoo 360 Car Defender
pm disable com.chima.vulcan # ChiMaster (Qihoo 360 backdoor)

pm disable ecarx.autosecure # Memory Clean Up app
pm disable com.neusoft.onlinemusic # JOOX Music

pm disable com.android.onetimeinitializer # One Time Init
pm disable com.android.providers.applications # Search Applications Provider
pm disable com.android.webview # Android System WebView (Outdated, use Opera 66.6.3445.73002 or Kiwi 96.0.4664.46 or Edge 95.0.1020.55 for web browsing)
pm disable com.mediatek.mtklogger # MTK Logger
pm disable com.mediatek.fwk.plugin # Mediatek Plugin System

pm disable com.gosuncn.toolsInstall # ToolsInstall
pm disable org.xwalk.core # Crosswalk Project Runtime

pm disable com.neusoft.dvrlogin # Geely Driving Video Recorder app
pm disable com.neusoft.cardvr # Geely Driving Video Recorder

pm disable ecarx.video # Video app
pm disable ecarx.photo # Photo app


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