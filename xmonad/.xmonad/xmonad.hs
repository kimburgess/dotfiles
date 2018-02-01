import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

modKey = mod4Mask  -- win key

customKeys =
  [ ((modKey, xK_x),           spawn "dm-tool lock")
  , ((modKey, xK_Escape),      spawn "sudo pm-suspend")
  , ((controlMask, xK_Print),  spawn "sleep 0.2; scrot -s")
  , ((0, xK_Print),            spawn "scrot")
  , ((modKey, xK_b),           sendMessage ToggleStruts)
  ]

main = do
  xmproc <- spawnPipe "xmobar"

  xmonad $ docks defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , logHook = dynamicLogWithPP xmobarPP
                  { ppOutput = hPutStrLn xmproc
                  , ppTitle = xmobarColor "green" "" . shorten 50
                  }
    , modMask = modKey
    , terminal = "alacritty"
    }
    `additionalKeys` customKeys
