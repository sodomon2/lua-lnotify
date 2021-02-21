## MoonNotify: Lua bindings for Libnotify

MoonNotify is a Lua binding library for [LibNotify](https://gitlab.gnome.org/GNOME/libnotify).

To build MoonNotify you need to have Lua (>=5.1), Gtk (>=3.0), and LibNotify.

#### Getting and installing


```sh
$ git clone https://github.com/sodomon2/moonnotify.git
$ cd moonnotify
$ make
$ make install # or 'sudo make install'
```

#### Example

```lua
-- Script: example.lua
notify = require("moonnotify")

n1 = notify.new("Hello!", "This is a test :D")
notify.set_urgency(n1, 1)
notify.set_appname(n1, "My Lua App")
notify.show(n1);
```

The script can be executed at the shell prompt with the standard Lua interpreter:

```shell
$ lua example.lua
```

Other examples can be found in the **examples/** directory contained in the release package.

#### Documentation
-------------
Documentation can be generated automatically by passing moonnotify.luadoc (in doc/) to [LuaDoc](https://github.com/lunarmodules/LDoc), or can be viewed [online.](https://sodomon.gitlab.io/doc/moonnotify)
    
> NOTE: this project is based the [lnotify](https://github.com/gabrield/lnotify)
