#### kali instance setup

Spinning up new instances of Kali, a simple, rough and ready script and config files to help spin up new set up reasonably quickly

I made this for myself, if you find some use here, than thats cool too...

Much bastardisation and ideas taken from https://github.com/g0tmi1k/os-scripts and https://github.com/blacklanternsecurity

There are some manual interventions required, not yet worked out how to shove those in.... but hey, its a time saver nontheless!



##### Manual Steps

- Change password
```
passwd kali
```

- sudo visudo
```
sudo visudo / theUSER ALL=(ALL) NOPASSWD:ALL
```
- password less privesc
```
sudo apt-get install -y -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root
```

- Settings Manager
    - Power Manager
        - Display All Power Management = Never
    - Keyboard
        - Layout = English UK

- Screenshot
    - add to panel

- Chromium
    - add to panel

- Text Editor
    - remove from panel

- Wallpaper
    - Kali-neon

- Firefox add-ons
    - FoxyProxy Standard
    - Wappalyzer
    - Burp Proxy Toggler by ZishanAdThandar

#### Optional

- Load and run Pimpmykali
    - https://github.com/Dewalt-arch/pimpmykali.git
    - Option N
