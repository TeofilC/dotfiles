import XMonad
import XMonad.Config.Xfce
import XMonad.Util.EZConfig
import XMonad.Layout.Circle
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks

baseConfig = xfceConfig

myLayout = avoidStruts . smartBorders $ tiled ||| Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 3/4
    delta   = 3/100

neonblue = "#2578fc"

myModMask = mod4Mask

myFileManager = "thunar"

main = xmonad $ baseConfig
	{ terminal = "xfce4-terminal"
        , modMask  = myModMask
        , borderWidth = 2
        , focusedBorderColor = neonblue
        , workspaces = ["web"] ++ map show [2..9]
        , layoutHook = myLayout
        } `additionalKeys`
        [ ((myModMask, xK_f), spawn "firefox")
        , ((myModMask, xK_g), spawn "google-chrome")
        , ((myModMask, xK_e), spawn "emacs")
        , ((myModMask, xK_j), spawn myFileManager)
        ]
