###########################
# Favoriate applications
###########################

# ShadowsocksR.exe
komorebic.exe float-rule exe "ShadowsocksR.exe"

# Telegram
komorebic.exe identify-border-overflow-application exe "Telegram.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Telegram.exe"

# Flow Launcher
komorebic.exe identify-border-overflow-application exe "Flow.Launcher.exe"

# WindowsTerminal
komorebic.exe float-rule exe "WindowsTerminal.exe"

# Google Chrome
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "chrome.exe"

# Mozilla Firefox
komorebic.exe identify-object-name-change-application exe "firefox.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "firefox.exe"
# Targets invisible windows spawned by Firefox to show tab previews in the taskbar
komorebic.exe float-rule class "MozillaTaskbarPreviewClass"

# AutoHotkey
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "AutoHotkeyU64.exe"
komorebic.exe float-rule title "Window Spy"

# OBS Studio (32-bit)
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "obs32.exe"

# OBS Studio (64-bit)
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "obs64.exe"

# PowerToys
# Target color picker dialog
komorebic.exe float-rule exe "PowerToys.ColorPickerUI.exe"
# Target image resizer dialog
komorebic.exe float-rule exe "PowerToys.ImageResizer.exe"
komorebic.exe float-rule exe "PowerToys.Settings.exe"

# Slack
komorebic.exe identify-border-overflow-application exe "Slack.exe"
komorebic.exe manage-rule exe "Slack.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Slack.exe"

# Slack
komorebic.exe identify-border-overflow-application exe "slack.exe"
komorebic.exe manage-rule exe "slack.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "slack.exe"

# Spotify
komorebic.exe identify-border-overflow-application exe "Spotify.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Spotify.exe"

##########################################################
# JetBranins
#########################################################

# IntelliJ IDEA
# komorebic.exe identify-object-name-change-application exe "idea64.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
# komorebic.exe identify-tray-application exe "idea64.exe"
komorebic.exe float-rule exe "idea64.exe"

# PyCharm
komorebic.exe identify-object-name-change-application exe "pycharm64.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "pycharm64.exe"

##########################################################
# Microsoft
#########################################################

# Microsoft Excel
komorebic.exe identify-border-overflow-application exe "EXCEL.EXE"
komorebic.exe identify-layered-application exe "EXCEL.EXE"
# Targets a hidden window spawned by Microsoft Office applications
komorebic.exe float-rule class "_WwB"

# Microsoft Outlook
komorebic.exe identify-border-overflow-application exe "OUTLOOK.EXE"
komorebic.exe identify-layered-application exe "OUTLOOK.EXE"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "OUTLOOK.EXE"

# Microsoft PC Manager
komorebic.exe float-rule exe "MSPCManager.exe"

# Microsoft PowerPoint
komorebic.exe identify-border-overflow-application exe "POWERPNT.EXE"
komorebic.exe identify-layered-application exe "POWERPNT.EXE"

# Microsoft Teams
komorebic.exe identify-border-overflow-application exe "Teams.exe"
# Target Teams pop-up notification windows
komorebic.exe float-rule title "Microsoft Teams Notification"
# Target Teams call in progress windows
komorebic.exe float-rule title "Microsoft Teams Call"

# Microsoft Word
komorebic.exe identify-border-overflow-application exe "WINWORD.EXE"
komorebic.exe identify-layered-application exe "WINWORD.EXE"

# Visual Studio
komorebic.exe identify-object-name-change-application exe "devenv.exe"

# Visual Studio Code
komorebic.exe identify-border-overflow-application exe "Code.exe"

# Generated by komorebic.exe

# 1Password
komorebic.exe float-rule exe "1Password.exe"

# Ableton Live
# Targets VST2 windows
komorebic.exe float-rule class "AbletonVstPlugClass"
# Targets VST3 windows
komorebic.exe float-rule class "Vst3PlugWindow"

# Adobe Creative Cloud
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application class "CreativeCloudDesktopWindowClass"

# Adobe Photoshop
komorebic.exe identify-border-overflow-application class "Photoshop"

# ArmCord komorebic.exe identify-border-overflow-application exe "ArmCord.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ArmCord.exe"

# Beeper
komorebic.exe identify-border-overflow-application exe "Beeper.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Beeper.exe"

# Bitwarden
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Bitwarden.exe"

# Bloxstrap komorebic.exe float-rule exe "Bloxstrap.exe" # Calculator
komorebic.exe float-rule title "Calculator"

# Credential Manager UI Host
# Targets the Windows popup prompting you for a PIN instead of a password on 1Password etc.
komorebic.exe float-rule exe "CredentialUIBroker.exe"

# Cron
komorebic.exe identify-border-overflow-application exe "Cron.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Cron.exe"

# Delphi applications
# Target hidden window spawned by Delphi applications
komorebic.exe float-rule class "TApplication"
# Target Inno Setup installers
komorebic.exe float-rule class "TWizardForm"

# Discord
komorebic.exe identify-border-overflow-application exe "Discord.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Discord.exe"

# DiscordCanary
komorebic.exe identify-border-overflow-application exe "DiscordCanary.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "DiscordCanary.exe"

# DiscordDevelopment
komorebic.exe identify-border-overflow-application exe "DiscordDevelopment.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "DiscordDevelopment.exe"

# DiscordPTB
komorebic.exe identify-border-overflow-application exe "DiscordPTB.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "DiscordPTB.exe"

# ElectronMail
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ElectronMail.exe"

# Element
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Element.exe"

# ElevenClock
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ElevenClock.exe"

# Elgato Camera Hub
komorebic.exe float-rule exe "Camera Hub.exe"

# Elgato Control Center
komorebic.exe float-rule exe "ControlCenter.exe"

# Elgato Wave Link
komorebic.exe float-rule exe "WaveLink.exe"

# Epic Games Launcher
komorebic.exe identify-border-overflow-application exe "EpicGamesLauncher.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "EpicGamesLauncher.exe"

# GOG Galaxy
komorebic.exe identify-border-overflow-application exe "GalaxyClient.exe"
komorebic.exe manage-rule exe "GalaxyClient.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "GalaxyClient.exe"
# Targets a hidden window spawned by GOG Galaxy
komorebic.exe float-rule class "Chrome_RenderWidgetHostHWND"

# GoPro Webcam
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application class "GoPro Webcam"

# Godot Manager
komorebic.exe identify-border-overflow-application exe "GodotManager.exe"
komorebic.exe manage-rule exe "GodotManager.exe"
komorebic.exe identify-object-name-change-application exe "GodotManager.exe"

# Google Drive
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "GoogleDriveFS.exe"

# Houdoku
komorebic.exe identify-border-overflow-application exe "Houdoku.exe"

# Targets JetBrains IDE popups and floating windows
komorebic.exe float-rule class "SunAwtDialog"

# Itch.io
komorebic.exe identify-border-overflow-application exe "itch.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "itch.exe"

# Keyviz
komorebic.exe float-rule exe "keyviz.exe"

# Kleopatra
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "kleopatra.exe"

# Kotatogram
komorebic.exe identify-border-overflow-application exe "Kotatogram.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Kotatogram.exe"

# LocalSend
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "localsend_app.exe"

# Logi Bolt
komorebic.exe float-rule exe "LogiBolt.exe"

# LogiTune
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "LogiTune.exe"
komorebic.exe float-rule exe "LogiTune.exe"

# Logitech G HUB
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "lghub.exe"
komorebic.exe identify-border-overflow-application exe "lghub.exe"

# Logitech Options
komorebic.exe float-rule exe "LogiOptionsUI.exe"

# Mailspring
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "mailspring.exe"

# ManyCam
komorebic.exe identify-border-overflow-application exe "ManyCam.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ManyCam.exe"

# Modern Flyouts
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ModernFlyoutsHost.exe"

# NVIDIA GeForce Experience
komorebic.exe identify-border-overflow-application exe "NVIDIA GeForce Experience.exe"

# NiceHash Miner
komorebic.exe identify-border-overflow-application exe "nhm_app.exe"
komorebic.exe manage-rule exe "nhm_app.exe"

# NohBoard
komorebic.exe float-rule exe "NohBoard.exe"

# Notion Enhanced
komorebic.exe identify-border-overflow-application exe "Notion Enhanced.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Notion Enhanced.exe"

# ONLYOFFICE Editors
komorebic.exe identify-border-overflow-application class "DocEditorsWindowClass"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application class "DocEditorsWindowClass"

# Obsidian
komorebic.exe identify-border-overflow-application exe "Obsidian.exe"
komorebic.exe manage-rule exe "Obsidian.exe"

# OpenRGB
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "OpenRGB.exe"

# Paradox Launcher
komorebic.exe float-rule exe "Paradox Launcher.exe"

# Plexamp
komorebic.exe identify-border-overflow-application exe "Plexamp.exe"

# Process Hacker
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ProcessHacker.exe"
komorebic.exe float-rule exe "ProcessHacker.exe"

# ProtonVPN
komorebic.exe identify-border-overflow-application exe "ProtonVPN.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ProtonVPN.exe"

# QtScrcpy
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "QtScrcpy.exe"

# QuickLook
komorebic.exe float-rule exe "QuickLook.exe"

# RepoZ
komorebic.exe float-rule exe "RepoZ.exe"

# Rider
komorebic.exe identify-object-name-change-application exe "rider64.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "rider64.exe"

# Roblox FPS Unlocker
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "rbxfpsunlocker.exe"

# RoundedTB
komorebic.exe float-rule exe "RoundedTB.exe"

# RoundedTB
komorebic.exe identify-border-overflow-application exe "RoundedTB.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "RoundedTB.exe"

# ShareX
komorebic.exe identify-border-overflow-application exe "ShareX.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ShareX.exe"

# Sideloadly
komorebic.exe float-rule exe "sideloadly.exe"

# Signal
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "signal.exe"

# SiriKali
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "sirikali.exe"

# Smart Install Maker
# Target hidden window spawned by installer
komorebic.exe float-rule class "obj_App"
# Target installer
komorebic.exe float-rule class "obj_Form"

# SoulseekQt
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "SoulseekQt.exe"

# Steam
komorebic.exe identify-border-overflow-application class "vguiPopupWindow"

# Stremio
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "stremio.exe"

# System Informer
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "SystemInformer.exe"
komorebic.exe float-rule exe "SystemInformer.exe"

# SystemSettings
komorebic.exe float-rule class "Shell_Dialog"

# Task Manager
komorebic.exe float-rule class "TaskManagerWindow"

# TouchCursor
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "tcconfig.exe"
komorebic.exe float-rule exe "tcconfig.exe"

# TranslucentTB
komorebic.exe float-rule exe "TranslucentTB.exe"

# TranslucentTB
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "TranslucentTB.exe"

# Unreal Editor
komorebic.exe identify-border-overflow-application exe "UnrealEditor.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "UnrealEditor.exe"

# VRCX
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "VRCX.exe"

# Voice.ai
komorebic.exe identify-border-overflow-application exe "VoiceAI.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "VoiceAI.exe"

# WebTorrent Desktop
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "WebTorrent.exe"

# Windows Console (conhost.exe)
komorebic.exe manage-rule class "ConsoleWindowClass"

# Windows Explorer
# Targets copy/move operation windows
komorebic.exe float-rule class "OperationStatusWindow"
komorebic.exe float-rule title "Control Panel"

# Windows Installer
komorebic.exe float-rule exe "msiexec.exe"

# WingetUI
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "WingetUI.exe"

# WingetUI
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "wingetui.exe"

# Wox
# Targets a hidden window spawned by Wox
komorebic.exe float-rule title "Hotkey sink"

# XAMPP Control Panel
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "xampp-control.exe"

# Zoom
komorebic.exe float-rule exe "Zoom.exe"

# mpv.net
komorebic.exe identify-object-name-change-application exe "mpvnet.exe"

# paint.net
komorebic.exe float-rule exe "paintdotnet.exe"

# pinentry
komorebic.exe float-rule exe "pinentry.exe"

# qBittorrent
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "qbittorrent.exe"

# ueli
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "ueli.exe"
komorebic.exe float-rule exe "ueli.exe"
omorebic.exe float-rule exe "ueli.exe"
