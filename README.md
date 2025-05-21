# vim-config

This repository contains my personal Vim configuration, designed to enhance productivity and streamline development workflows.

## 🚀 Features

* **Syntax Highlighting**: Enhanced syntax highlighting for various programming languages.
* **Custom Keybindings**: Personalized shortcuts to speed up editing and navigation.
* **Plugin Integration**: Seamless integration with essential Vim plugins to extend functionality.
* **Optimized Settings**: Tweaked settings for improved performance and usability.

## 📦 Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/proc0x41/vim-config.git ~/.vim
   ```



2. **Create a Symbolic Link for `.vimrc`**:

   ```bash
   ln -s ~/.vim/.vimrc ~/.vimrc
   ```



3. **Install Plugins with vim-plug**:

   If you don't have [vim-plug](https://github.com/junegunn/vim-plug) installed, you can install it by running:

   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```



After installing vim-plug, open Vim and run the following command to install the plugins:

```vim
:PlugInstall
```



This will download and install all plugins specified in your `.vimrc`.

## 🛠️ Customization

Feel free to modify the `.vimrc` file located at `~/.vim/.vimrc` to suit your personal preferences and workflow.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/proc0x41/vim-config/blob/main/LICENSE) file for details.

