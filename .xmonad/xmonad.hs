import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders

_statusbar      = "xmobar"
_terminal       = "urxvt"
_borderWidth    = 1
_normalBorder   = "#000000"
_focusedBorder  = "#000000"
_modmask        = mod4Mask

_pp             = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" } 

_layout         = noBorders $ Full

_config         = defaultConfig {
    modMask             = _modmask, 
    terminal            = _terminal, 
    borderWidth         = _borderWidth,
    normalBorderColor   = _normalBorder,
    focusedBorderColor  = _focusedBorder,
    layoutHook          = _layout
}

_toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)


main = xmonad =<< statusBar _statusbar _pp _toggleStrutsKey _config 
