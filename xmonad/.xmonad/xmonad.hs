import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Named (named)
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO

modKey = mod4Mask  -- win key

xK_XF86MonBrightnessUp   = 0x1008FF02
xK_XF86MonBrightnessDown = 0x1008FF03

customKeys =
  [ ((modKey, xK_x),                spawn "dm-tool lock")
  , ((modKey, xK_Escape),           spawn "sudo pm-suspend")
  , ((controlMask, xK_Print),       spawn "sleep 0.2; scrot -s")
  , ((0, xK_Print),                 spawn "scrot")
  , ((modKey, xK_b),                sendMessage ToggleStruts)
  , ((0, xK_XF86MonBrightnessUp),   spawn "xbacklight -inc 10 -time 100")
  , ((0, xK_XF86MonBrightnessDown), spawn "xbacklight -dec 10 -time 100")
  ]

windowActions = composeOne
  [ transience
  , isFullscreen -?> doFullFloat
  , isDialog     -?> doCenterFloat
  ]

layouts = avoidStruts $ smartBorders $
  (tall ||| wide ||| full)
  where
    base = Tall 1 (3/100) (1/2)
    --
    tall = named "tall" $ base
    wide = named "wide" $ Mirror base
    full = named "full" $ noBorders Full

main = do
  xmproc <- spawnPipe "xmobar"

  xmonad $ docks def
    { manageHook = windowActions <+> manageHook def
    , layoutHook = layouts
    , logHook    = dynamicLogWithPP xmobarPP
                     { ppOutput = hPutStrLn xmproc
                     , ppTitle  = xmobarColor "white" "" . shorten 100
                     }
                    >> updatePointer (0.5, 0.5) (0, 0)
    , modMask    = modKey
    , terminal   = "alacritty"
    }
    `additionalKeys` customKeys
