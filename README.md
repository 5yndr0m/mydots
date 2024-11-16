# mydots
dotfile collection for later use

## Firefox chrome files

* !! Before placing the folder, change these things in firefox :
    change the toolbar layout(remove the spaces)
    hide the bookmarks bar
    
* place the folder inside the '.mozilla/firefox/xxxxxxxx.default-release' folder
* add the <a href="https://github.com/Trzynastek/PixelPage2.0">PixelPage</a> extention
* restart the firefox

* using <a href="https://github.com/stonecrusher/simpleMenuWizard">simpleMenuWizard</a> by <a href="https://github.com/stonecrusher">@stonecrusher</a>.

* console

    ```bash
        sudo pacman -S --needed base-devel git
    ```
    
    - clone yay repo
    ```bash
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        yay --version
    ```
    
    ```bash
      bash <(curl -s "https://end-4.github.io/dots-hyprland-wiki/setup.sh")
    ```

    ```bash
        sudo pacman -S bat fastfetch thefuck fzf lazygit
    ```
    
    - atuin
    ```bash
         curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    ```
    
    - tlrc
    ```bash
        yay -S tlrc-bin cava
    ```
    - zed
    ```bash
        curl -f https://zed.dev/install.sh | sh
    ```
    
    