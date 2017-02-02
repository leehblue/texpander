# Texpander

Texpander is a simple text expander for Linux. It is sort of like Autokey, except it works off of text files that you put in you `~/.texpander` directory. Texpander is a bash script that uses xclip, xdotool, and zenity to let you type an abbreviation for something and it expands to whatever you have in the matching text file.

## Installation

1. Put `texpander.sh` somewhere on your system, perhaps your `~/bin` directory.
1. Create a keyboard shortcut that calls `~/bin/texpander.sh`
1. Create a `~/.texpander` directory where you store text files for expanding abbreviations

Texpander relies on a couple command line tools:

- xdotool
- zenity
- xclip

If those aren't already installed on your system you can probably grab them from your distros package manager without any trouble. For example for Ubuntu you can get what you need with the following commands.

```
sudo apt install xclip 
sudo apt install xdotool 
sudo apt install zenity
```

## Usage

The text expansion files reside in your `~/.texpander` directory. Name the files in the format of `abbreviation.txt` where `abbreviation` is the thing you want to type and the content of the file is what you want to have pasted into your document.

I have `crtl+space` assigned to run `~/bin/texpander.sh`. So, if I'm typing an email, it doesn't matter if I'm in gmail (using Firefox, Chrome, Opera, or Vivaldi), Thunderbird, Vim, or Nylas, the workflow is the same. I have a couple different email signatures that I use. If I am writing to somebody about Cart66, the [WordPress Shopping Cart plugin](https://cart66.com), I'll use my Cart66 signature. I have a file `~/.texpander/sig66.txt` that has all my contact info and so forth for Cart66.  

![Texpander - text snippets for Ubuntu](https://lee.blue/share/texpander-demo.gif)

### Setting Up Custom Keyboard Shortcuts

This process may be slightly different for you depending on what desktop environment and Linux distribution you have. For Ubuntu running Unity, here is the process.

Open up the System Settings panel

![System Settings Panel](https://lee.blue/share/system-settings-keyboard.png)

Click the **Keyboard** icon to enter custom keyboard shortcuts

![Custom Keyboard Shortcuts](https://lee.blue/share/custom-keyboard-shortcuts.png)

Define a custom shortcut by clicking the **+** icon at the bottom of the Shortcuts panel

![Custom Shortcut](https://lee.blue/share/custom-shortcut.png)

Assign a keyboard shortcut to launch Texpander by clicking as shown here

![Set keyboard shortcut](https://lee.blue/share/set-keyboard-shortcut.png)

### How To Use Texpander

After setting up the keyboard shortcut to launch Texpander, to use Texpander:

- Start writing an email to somebody (or start editing any document)
- Put your cursor where you want your email signature to be pasted
- Type `ctrl+space` (or whatever keyboard shortcut you set up)
- A zenity window will appear asking for your abbreviation
- Type in `sig66` and hit Enter (or click "OK")
- The contents of `~/.texpander/sig66.txt` is pasted into your document

If I'm not in a web browser I'm in the terminal working in Vim. I've got some texpander files that I use in Vim. The terminal works a little differently from other GUI apps in that you have to type `ctrl+shift+v` to paste stuff. In texpander.sh there is a check to see if the active window is a terminal. If so, it will paste using `ctrl+shift+v` if not then it will paste normally as `ctrl+v`

## Contributing

1. Fork Texpander
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

**Version 1.1.1 - November 22, 2016**

- Update: Look for "terminal" pattern anywhere in proc name to match names like "gnome-terminal" for pasting text into terminals.
- Update: Update README with instructions for the new selection list functionality

**Version 1.1 - November 7, 2016**

- New: Using zenity list to show abbreviations. You can still just type the abbreviations and then hit Enter, or select your choice with the mouse and click OK.
- New: The value in the clipboard is preserved so it is not overwritten when expanding an abbreviation
- New: Add pasting support for the terminator terminal emulator pasting
- Update: Use the focus window rather than the active window as the target for pasting


**Version 1.0.1 - June 23, 2016**

- New: If the active window is a terminal paste with `ctrl+shift+v`

**Version 1.0 - May 17, 2016**

- Initial release

## Credits

Written by Lee Blue

## License

General Public License v3.0

