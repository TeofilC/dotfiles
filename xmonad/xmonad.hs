import XMonad
import XMonad.Config.Xfce
import XMonad.Util.EZConfig
import XMonad.Layout.Circle
import XMonad.Hooks.ManageDocks

baseConfig = xfceConfig

myLayout = avoidStruts (tiled ||| Full ||| Circle )
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 3/4
    delta   = 3/100

main = xmonad $ baseConfig
	{ terminal = "xfce4-terminal"
        , modMask  = mod4Mask
        , borderWidth = 3
        , focusedBorderColor = "#2578fc"
        , workspaces = ["web", "dev"] ++ map show [3..9]
        , layoutHook = myLayout
        }
