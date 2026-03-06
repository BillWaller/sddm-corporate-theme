# SDDM-CORPORATE-THEME

<!-- mtoc-start -->

* [History of this Theme](#history-of-this-theme)
  * [Marian Arlt's SDDM-SUGAR-DARK-THEME](#marian-arlts-sddm-sugar-dark-theme)
    * [Essential Features Provided by SUGAR-DARK](#essential-features-provided-by-sugar-dark)
    * [Synopsis](#synopsis)
* [Objective](#objective)
  * [Keyitdev's SDDM-ASTRONAUT-THEME](#keyitdevs-sddm-astronaut-theme)
    * [Essential Features Provided by ASTRONAUT](#essential-features-provided-by-astronaut)
* [Bill Waller's SDDM-CORPORATE-THEME](#bill-wallers-sddm-corporate-theme)
  * [Files Modified Include](#files-modified-include)
  * [Installation](#installation)
  * [Testing](#testing)
  * [Changing the Background](#changing-the-background)

<!-- mtoc-end -->

## History of this Theme

### Marian Arlt's SDDM-SUGAR-DARK-THEME

[by Marian Arlt at https://github.com/MarianArlt/sddm-sugar-dark](https://github.com/MarianArlt/sddm-sugar-dark)

[Distributed under: GPLv3+ License https://www.gnu.org/licenses/gpl-3.0.html](https://www.gnu.org/licenses/gpl-3.0.html)

#### Essential Features Provided by SUGAR-DARK

- Space for a Corporate Logo
- Time and Date
- Drop Down User Selection Menu
- Drop Down Session Selection Menu
- Show/Hide Password
- System Functions Including Restart and Shutdown

#### Synopsis

Of all the SDDM Greeter Themes, SDDM-SUGAR-DARK by Marian Arlt upgraded as SDDM-ASTRONAUT by Keyitdev is, by a wide margin, the most capable and versatile I have seen. SDDM-CORPORATE is essentially SDDM-ASTRONAUT with some minor configuration changes.

## Objective

### Keyitdev's SDDM-ASTRONAUT-THEME

[by Keyitdev at https://github.com/Keyitdev/sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme)

Copyright (C) 2022-2025 Keyitdev

#### Essential Features Provided by ASTRONAUT

- Compatibility with QT6
- User Friendly Setup

## Bill Waller's SDDM-CORPORATE-THEME

[https://github.com/BillWaller/sddm-corporate-theme](https://github.com/BillWaller/sddm-corporate-theme)
![SPACE FORCE](Previews/space_force.png)

![IBM Logo](Previews/ibm.png)

![SuSE Tumbleweed](Previews/tumbleweed.png)

![NORAD](Previews/norad.png)

![CIA](Previews/cia.png)

![Linux](Previews/linux.png)

What's so special about SDDM-CORPORATE? Nothing. It doesn't even have its own pretty scenery, but preserves the functionality SDDM-ASTRONAUT, while adding minor cosmetic improvements. It's a stripped down, plain vanilla, configuration.

Just provide a background image matching your display's resolution and place it in the Backgrounds directory, or select one of the background images provided with SDDM-ASTRONAUT. If you elect to create your own background, the top fourth and lateral two-thirds of the screen are available and unobstructed.

The changes are cosmetic, and include:


More colorful System Icons
Larger and more colorful user name and password field icons
Additional date format: "dddd MMMM d" -> "Thursday September 11th 2025"

### Files Modified Include

Themes/corporate.conf
Components/Input.qml
Components/Clock.qml
Assets-Original (Copy of Original Icons)
Assets-Corporate (New Icons)
Assets (Copy of New Icons)
sddm-corporate.patch

### Installation

[Clone sddm-corporate-theme](https://github.com/BillWaller/sddm-corporate-theme.git)

Copy the sddm-corporate-theme directory structure to
/usr/share/sddm/themes/breeze/

```bash
sudo cp -Rpdu sddm-corporate-theme /usr/share/sddm/themes
```

Edit /etc/sddm.conf.d/sddm.conf or /etc/sddm.conf depending on your system.

Under \[Theme\], set
Current=sddm-corporate-theme

```bash
sudo vi /etc/sddm.conf.d/sddm.conf
or
sudo vi /etc/sddm.conf
```

### Testing

Edit the bash script, /usr/share/sddm/themes/sddm-corporate-theme/sddm.sh

Verify that QML_IMPORT_PATH is set properly according to the topography of
your system.

```bash
#!/bin/bash
export QML_IMPORT_PATH=/usr/lib64/qt6/qml:/usr/lib64/qt5/qml
export LC_ALL="en_US.UTF-8"
theme=sddm-corporate-theme
sddm env -i HOME="$HOME" DISPLAY="$DISPLAY" XAUTHORITY="$XAUTHORITY" \
    sddm-greeter-qt6 \
    --test-mode \
    --qwindowgeometry 3840x2160+0+0 \
    --theme /usr/share/sddm/themes/$theme
```

To my knowledge, the sddm-greeter manual page does not include instructions
on how to exit the greeter. In some discussion groups, the popular advice was
to switch to a different TTY and kill the process. That works fine unless
you are designing a login screen, and you need to test it repeatedly.
The SDDM designers provided a better way.

*****Press Alt-Tab to exit*****

Run the script, /usr/share/sddm/themes/sddm-corporate-theme/sddm.sh

*****Press Alt-Tab to exit*****

### Changing the Background

Currently, the following backgrounds are included in the distribution:

```bash
cia.png
ibm.png
linux.png
norad.png
tumbleweed.png
```

To change the background, navigate to the Backgrounds directory.

```bash
cd /usr/share/sddm/themes/sddm-corporate-theme/Backgrounds
```

```
Create a new link from the background you want to use to default.png.

```bash
sudo ln -s ibm.png default.png
```


---
Enjoy 🐸
---

## LICENSE

The sddm-corporate-theme is a configuration of SDDM-SUGAR-DARK by MarianAlt with
additional work by Keyitdev in SDDM-ASTRONAUT, and minor configuration changes
by Bill Waller

Essential features were provided by the sugar-dark-theme, and the astronaut-theme, and the corporate-theme is essentially a configuration of the astronaut-theme.

Repo: https://github.com/BillWaller/sddm-corporate-theme
Copyright (C) 2025-2025 BillWaller.

Originally distributed under the GPLv3+ License by Marian Arlt, and Keyitd3ev,
and now distributed under the same license by Bill Waller.

## Modifications

[Themes/corporate.conf](Themes/corporate.conf)

Includes most of the changes. In particular, the DateFormat variable
in the configuration file can be set to "dddd MMMM d", which produces
"Weekday Day_of_Month Year". Clock.qml was modified to detect this format
and add a two-letter suffix to the day of the month, so that 2025-09-11
would be displayed as "Thursday September 11th 2025".

[Components/Clock.qml](Components/Clock.qml)

Modified to accept the DateFormat mentioned above.

[Alternative Icons](Assets)

More colorful icons were added.

[Components/Input.qml](Components/Input.qml)

The size of icons in the username and password fields were increased.

Background scenery was removed to make room for a corporate logo, product
advertising, or shameless self-promotion. You can add your own background
image, or select one of the backgrounds provided with SDDM-ASTRONAUT, which
are great. I removed the scripted installation because it involves installing
additional software and the configuration file is easy to use and
self-explanitory.

[sddm-corporate.patch](sddm-corporate.patch)

Documents specific changes. Please excuse some extraneous text due to
automatic editing by my qml formatter.

With much thanks to the original authors of SDDM-ASTRONAUT and SDDM-SUGAR-DARK,
who provided, not only the code base, but the inspiration for this small project.
Certainly, it would not have been possible without their contribution. You can
find them at the links below.

Someone please take a 4K photo of the Space Force Headquarters in Colorado
Springs, Colorado, and send it to me so I can add it to the distribution.

[Sugar Dark by MarianArlt](https://github.com/MarianArlt/sddm-sugar-dark)
Copyright (C) 2020-2022 Marian Arlt

[Astronaut by Keyitdev](https://github.com/Keyitdev/sddm-astronaut-theme)
Copyright (C) 2022-2025 Keyitdev

[LICENSE GPLv3+](https://www.gnu.org/licenses/gpl-3.0.html)
