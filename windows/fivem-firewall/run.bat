chcp 28591 > nul
:mode
	echo off
	title Paramètres des ports pour FiveM
	mode con cols=78 lines=32
	color 0
	cls
goto :permission
:permission
	openfiles>nul 2>&1
	if %errorlevel% EQU 0 goto :menu
	echo.
	echo. Veuillez lancer le script en mode Administrateur
	echo.
	echo. Appuyez sur n'importe quelle touche pour fermer . . .
	pause>nul
goto :close
:menu
	cls
	title Paramètres des ports pour FiveM
	echo.
	echo. Options:
	echo.
	echo.    1. Ajouter les règles pour ouvrir les ports
	echo.    2. Supprimer les règles pour fermer les ports
	echo.
	echo.                                                0. Fermer
	echo.
	set /p option=Choissisez une option:
	if %option% EQU 0 (
		goto close
	) else if %option% EQU 1 (
		call :add_rule
	) else if %option% EQU 2 (
		call :remove_rule
	) else (
		echo.
		echo.Option invalide.
		echo.
		echo.Appuyez sur n'importe quelle touche pour continuer . . .
		pause>nul
	)
	goto menu
:add_rule
cls
title Ajout des règles dans le pare-feu Windows ...
echo.
echo Ajout des règles dans le pare-feu Windows ...
echo.
netsh advfirewall firewall add rule name="FiveM port TCP 32120 IN" dir=in action=allow protocol=TCP localport=32120
netsh advfirewall firewall add rule name="FiveM port UDP 32120 IN" dir=in action=allow protocol=UDP localport=32120
netsh advfirewall firewall add rule name="FiveM port TCP 30110 IN" dir=in action=allow protocol=TCP localport=30110
netsh advfirewall firewall add rule name="FiveM port TCP 32120 OUT" dir=out action=allow protocol=TCP localport=32120
netsh advfirewall firewall add rule name="FiveM port UDP 32120 OUT" dir=out action=allow protocol=UDP localport=32120
netsh advfirewall firewall add rule name="FiveM port TCP 30110 OUT" dir=out action=allow protocol=TCP localport=30110
cls
title Règles ajoutées
echo.
echo. Les règles ont étés ajoutés dans le pare-feu Windows.
echo. Aucune autre configuration requise.
echo.
echo. Appuyez sur n'importe quelle touche pour fermer . . .
pause>nul
goto :close
:remove_rule
cls
title Suppression des règles dans le pare-feu Windows ...
echo.
echo. Suppression des règles dans le pare-feu Windows ...
netsh advfirewall firewall delete rule name="FiveM port TCP 32120 IN"
netsh advfirewall firewall delete rule name="FiveM port UDP 32120 IN"
netsh advfirewall firewall delete rule name="FiveM port TCP 30110 IN"
netsh advfirewall firewall delete rule name="FiveM port TCP 32120 OUT"
netsh advfirewall firewall delete rule name="FiveM port UDP 32120 OUT"
netsh advfirewall firewall delete rule name="FiveM port TCP 30110 OUT"
cls
title Règles supprimées
echo.
echo. Les règles ont étés supprimés depuis le pare-feu Windows.
echo. Aucune autre configuration requise.
echo.
echo. Appuyez sur n'importe quelle touche pour fermer . . .
pause>nul
goto :close
:close
	exit
