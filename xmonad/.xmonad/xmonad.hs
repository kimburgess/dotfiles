import XMonad
import XMonad.Util.EZConfig(additionalKeys)

modKey = mod4Mask  -- win key

customKeys =
  [ ((modKey, xK_x), spawn "dm-tool lock")
  ]

main = xmonad $ def
  { modMask = modKey
  , terminal = "alacritty"
  }
  `additionalKeys` customKeys

