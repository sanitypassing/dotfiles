import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Prompt
import XMonad.Prompt.Ssh
import XMonad.Layout.NoBorders

import System.IO

_terminal       = "urxvt"
_borderWidth    = 1
_normalBorder   = "#000000"
_focusedBorder  = "#000000"
_modmask        = mod4Mask

_xpConfig       = defaultXPConfig

_config         = defaultConfig {
    modMask             = _modmask, 
    terminal            = _terminal, 
    borderWidth         = _borderWidth,
    normalBorderColor   = _normalBorder,
    focusedBorderColor  = _focusedBorder,
    layoutHook          = smartBorders ( avoidStruts $ layoutHook defaultConfig)
} `additionalKeys` 
    [
        ((mod4Mask, xK_s), sshPrompt _xpConfig),
        ((mod4Mask, xK_b), sendMessage $ ToggleStruts),
        ((mod4Mask, xK_p), spawn "dmenu_run -fn 'DejaVu Sans Mono-10'"),
        ((0, 0x1008ff13), spawn "amixer set Master 1+"),
        ((0, 0x1008ff11), spawn "amixer set Master 1-"),
        ((0, xK_Print), spawn "scrot '%Y-%m-%d_$wx$h.png' -q 100 -m -e 'mv $f ~/media/screenshots'")
    ]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/sanitypassing/.xmobarrc"
    xmonad $ _config  {
        logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput    = hPutStrLn xmproc,
            ppCurrent   = xmobarColor "#429942" "" . wrap "<"  ">"
        },
        manageHook      = manageDocks,
        handleEventHook = docksEventHook 
    }

