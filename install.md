Bind CapsLock to Ctrl. Run in _admin powershell_ and reboot
```powershell
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
```

[WACUP](https://getwacup.com/preview/)
[ShareX](https://getsharex.com/)
[Listary](https://www.listary.com)
[MEGA Sync](https://mega.nz/sync)

[Steam](https://store.steampowered.com/about/Steam?l=russian)

[PDF Reader](https://www.tracker-software.com/product/pdf-xchange-editor/download?fileid=733)
[WinDJVU](https://sourceforge.net/projects/windjview/files/latest/download)

[OBS](https://obsproject.com/ru)
- [Chatterino](https://chatterino.com/)
- [Twitch Soundtrack](https://www.twitch.tv/broadcast/soundtrack)

[git](https://git-scm.com/download/win)
```bash
git config --global core.autocrlf false
```

[Cmder](https://cmder.net)
[MobaXTerm](https://mobaxterm.mobatek.net/)

[ngrok](https://ngrok.com/download)

[Notepad++](https://notepad-plus-plus.org/downloads/)

[Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?preview.text_type=custom)

[emacs](https://www.gnu.org/software/emacs/)
- [spacemacs](https://www.spacemacs.org/)
- add to `init.el`
```elisp
(setq shell-file-name "C:/Program Files/Git/bin/bash.exe")
```

```bash
git config --global core.autocrlf input

ssh-keygen -t ed25519
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519
clip < ~/.ssh/id_ed25519.pub
# add key to github ssh keys
```

[Opera GX](https://www.opera.com/gx)
- [VkOpt](https://vkopt.net/download/)
- [FrankerFaceZ](https://chrome.google.com/webstore/detail/frankerfacez/fadndhdgpmmaapbmfcknlfgcflmmmieb)
- [BTTV](https://chrome.google.com/webstore/detail/betterttv/ajopnjidmegmdimjlfnijceegpefgped)
- [Hover Zoom+](https://chrome.google.com/webstore/detail/hover-zoom%20/pccckmaobkjjboncdfnnofkonhgpceea?hl=ru)
- [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=ru)
- [Tab Session Manager](https://chrome.google.com/webstore/detail/tab-session-manager/iaiomicjabeggjcfkbimgmglanimpnae)(pin)
- [Video Speed Controller](https://chrome.google.com/webstore/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk)
- [Web Go Board](https://chrome.google.com/webstore/detail/web-go-board/cdmhoehokaoghadonjfdbhieajggfbmd/related)(pin)
- [YouTube NonStop](https://chrome.google.com/webstore/detail/youtube-nonstop/nlkaejimjacpillmajjnopmpbkbnocid)
- [Numbered Tabs](https://chrome.google.com/webstore/detail/numbered-tabs/iocebdgkllilbhbekghlbpmhfeejgcgi)
- [Ears: Bass Boost, EQ Any Audio!](https://chrome.google.com/webstore/detail/ears-bass-boost-eq-any-au/nfdfiepdkbnoanddpianalelglmfooik?hl=ru)(pin)
- [YouTube To Mp3 Converter](https://addoncrop.com/youtube-mp3-converter/)
- [bypass paywalls](https://github.com/iamadamdev/bypass-paywalls-chrome)
- SkyLoad
- [uMatrix](https://chrome.google.com/webstore/detail/umatrix/ogfcmafjalglgifnmanfmnieipoejdcf?hl=ru)

[Insomnia](https://insomnia.rest/download/)

[Deluge](https://deluge-torrent.org/)

[chocolatey](https://chocolatey.org/install)
- [qutebrowser](https://qutebrowser.org/doc/install.html#_on_windows)
- [neovim](https://neovim.io/)
```bash
choco install -y qutebrowser neovim cmder
```
install vim-plug
```powershell
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)
```
Open nvim and run `:PlugInstall`

[cmder](https://cmder.net/)

[Python 3](https://www.python.org/downloads/release/python-392/)

## Search engines

KeePassXC
sqlite3
task
clip,multi clipboard
opera gx/pale moon/firefox
spotify
winamp
discord
telegram
recursed,vangers
termux
vscode
