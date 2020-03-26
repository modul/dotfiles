{-# LANGUAGE RecordWildCards #-}

import XMonad
import XMonad.Config.Kde
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import Graphics.X11.Xlib
import qualified XMonad.StackSet as W

kde5Config = kde4Config

dimFocusedColor = "#00557f"
litFocusedColor = "#3daee9"

main = xmonad myConfig

myConfig = kde5Config {
           modMask = myModMask
         , terminal = myTerminal
         , manageHook = myManageHook <+> manageHook kde5Config
         , layoutHook = myLayouts
         , focusedBorderColor = litFocusedColor
         , normalBorderColor = "#31363b"
         } 
        `additionalKeys` myAdddedKeys myConfig
        `removeKeys` myRemovedKeys

myTerminal = "kitty"

myModMask = mod4Mask

myLayouts = smartBorders $ avoidStruts $ tall ||| wide ||| Full ||| Grid
    where tall = Tall 1 (2/100) (1/2)
          wide = Mirror tall

myManageHook = composeAll
    [ className =? "plasmashell" --> doFloat
    , className =? "krunner" --> doFloat
    , className =? "qjackctl" --> doFloat
    , isFullscreen --> doFullFloat
    , isDialog --> doCenterFloat
    ]

myAdddedKeys conf@XConfig{..} = [ 
                -- run terminal
                      ((modMask, xK_c),               spawn terminal)
                -- switching between windows
                    , ((modMask, xK_n),               windows W.focusDown)
                    , ((modMask, xK_r),               windows W.focusUp)
                    , ((modMask .|. shiftMask, xK_n), windows W.swapDown)
                    , ((modMask .|. shiftMask, xK_r), windows W.swapUp)
                -- resizing
                    , ((modMask, xK_s),               sendMessage Shrink)
                    , ((modMask, xK_t),               sendMessage Expand)
                    , ((modMask, xK_f),               withFocused $ windows . W.sink)
                -- refreshing windows
                    , ((modMask .|. shiftMask, xK_r), refresh)
                    ]
                -- switching between screens
                 ++ [ ((modMask .|. m, key), screenWorkspace sc >>= flip whenJust (windows . f))
                      | (key, sc) <- zip [xK_e, xK_a, xK_i] [0..]
                      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
                    ]

myRemovedKeys = []
