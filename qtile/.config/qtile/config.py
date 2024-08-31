# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import re
import socket
import subprocess
from libqtile import qtile
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras.resources import wallpapers
from libqtile import hook
import colors

mod = "mod4"
terminal = "kitty"
myBrowser = "firefox" # My default brower
#myEmacs = "emacsclient -c -a 'emacs' " # The space at the end is IMPORTANT!
myEmacs = "emacs"
myFileManager = "nautilus"
keys = [
    # General key bindings
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "b", lazy.spawn(myBrowser), desc="Web browser"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "e", lazy.spawn(myEmacs), desc='Emacsclient Dashboard'),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Lounch Rofi
    Key([mod], "space", lazy.spawn("rofi -show drun"), desc="Launch Rofi"),

    # Reload the config file
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),

    # Launch file manager
    Key([mod, "control"], "f", lazy.spawn(myFileManager), desc="Launch File Manager"),

    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "m", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), lazy.layout.grow(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), lazy.layout.grow(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), lazy.layout.grow(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), lazy.layout.grow(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Grow/shrink windows left/right. 
    # This is mainly for the 'monadtall' and 'monadwide' layouts
    # although it does also work in the 'bsp' and 'columns' layouts.
    Key([mod], "equal",
        lazy.layout.grow_left().when(layout=["bsp", "columns"]),
        lazy.layout.grow().when(layout=["monadtall", "monadwide"]),
        desc="Grow window to the left"
    ),
    Key([mod], "minus",
        lazy.layout.grow_right().when(layout=["bsp", "columns"]),
        lazy.layout.shrink().when(layout=["monadtall", "monadwide"]),
        desc="Grow window to the left--"
    ),
    
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return", 
        lazy.layout.toggle_split(), 
        desc="Toggle between split and unsplit sides of stack",
    ),
    
    # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 5- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 5+ unmute")),
    
]

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

group_labels = ["1", "2", "3", "4", "5", "6", "7", "󰌢 ", "󰉍 ",]
#group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
#group_labels = ["", "", "", "", "", "", "", "", "",]
group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

### COLORSCHEME ###
# Colors are defined in a separate 'colors.py' file.
# There 10 colorschemes available to choose from:
#
# colors = colors.DoomOne
colors = colors.Dracula
# colors = colors.GruvboxDark
# colors = colors.MonokaiPro
# colors = colors.Nord
# colors = colors.OceanicNext
# colors = colors.Palenight
# colors = colors.SolarizedDark
# colors = colors.SolarizedLight
# colors = colors.TomorrowNight


### LAYOUTS ###
# Some settings that I use on almost every layout, which saves us
# from having to type these out for each individual layout.
layout_theme = {"border_width": 2,
                "margin": 0,
                "border_focus": colors[6],
                "border_normal": colors[0]
                }
                
layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(**layout_theme),
    # layout.Matrix(),
      layout.MonadTall(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font="JetBrains Mono",
    fontsize=17,
    padding=3,
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
    	widget.Spacer(length = 15),
    	
        widget.Image(
                filename = "~/.config/qtile/icons/org.png",
                scale = "False",
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm)},
            ),
        
        widget.Spacer(length = 15),

        widget.GroupBox(
                fontsize = 18,
                margin_y = 3,
                margin_x = 4,
                padding_y = 2,
                padding_x = 3,
                borderwidth = 3,
                active = colors[1],
                #inactive = colors[1],
                rounded = False,
                highlight_color = colors[2],
                highlight_method = "line",
                this_current_screen_border = colors[7],
                this_screen_border = colors [4],
                other_current_screen_border = colors[7],
                other_screen_border = colors[4],
            ),
        widget.TextBox(
                text = '|',
                font = "JetBrains Mono",
                foreground = colors[1],
                padding = 2,
                #fontsize = 14
            ),
        widget.Spacer(length = 5),
        
        widget.CurrentLayoutIcon(
                # custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                foreground = colors[1],
                padding = 0,
                scale = 0.7
            ),
        widget.Spacer(length = 5),
        
        #widget.CurrentLayout(
        #       foreground = colors[1],
        #       padding = 5
        #       ),
        # widget.TextBox(
        #         text = '|',
        #         font = "JetBrains Mono",
        #         foreground = colors[1],
        #         padding = 2,
        #         fontsize = 14
        #     ),
        widget.Prompt(
                font = "JetBrains Mono",
                fontsize=15,
                foreground = colors[1]
        	),  
        widget.TextBox(
                text = '|',
                font = "JetBrains Mono",
                foreground = colors[1],
                padding = 2,
               #fontsize = 14
            ),  
        widget.WindowName(
                foreground = colors[7],
                max_chars = 200
            ),
        widget.Spacer(length = 15),
        


        widget.Wttr(
                location={'Grand Rapids, MI':''},
                format='%c%t  %C  %p  %m',
                center_aligned = True,
            ),
        widget.Spacer(length = 15),
       
        #widget.CPU(
        #        format = ' Cpu:{freq_current}GHz',
        #   ),
        #widget.Spacer(length = 15),
        #widget.Memory(
        #        #foreground = colors[8],
        #        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
        #        format = '{MemUsed: .0f}{mm}',
        #        fmt = '🖥 RAM:{} used',
        #    ),
        #widget.Spacer(length = 15),
        #widget.DF(
        #	    update_interval = 60,
        #        #foreground = colors[5],
        #        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e df')},
        #        partition = '/',
        #        #format = '[{p}] {uf}{m} ({r:.0f}%)',
        #        format = '{uf}{m} free',
        #        fmt = '🖴 Disk: {}',
        #        visible_on_warn = False,
        #	),
        #widget.Spacer(length = 15),
        
        widget.Volume(
                #foreground = colors[7],
                fmt = '󰓃 {}',
            ),
        widget.Spacer(length = 15),
        widget.Clock(format = "⏱ %a, %b %d - %H:%M"),
        
        widget.Spacer(length = 10),
        ]
    return widgets_list



# Monitor 1 will display ALL widgets in widgets_list. It is important that this
# is the only monitor that displays all widgets because the systray widget will
# crash if you try to run multiple instances of it.
def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1 

# All other monitors' bars will display everything but widgets 22 (systray) and 23 (spacer).
def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    del widgets_screen2[22:24]
    return widgets_screen2

# For adding transparency to your bar, add (background="#00000000") to the "Screen" line(s)
# For ex: Screen(top=bar.Bar(widgets=init_widgets_screen2(), background="#00000000", size=24)),

# Enable Qtile Bar by uncommenting these lines
def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), background="#00000000", size=32, opacity=0.9)), # margin=[5,10,0,10] 
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), background="#00000000", size=32, opacity=0.9)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), background="#00000000", size=32, opacity=0.9))]

#def init_screens():
#     return [Screen()]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
