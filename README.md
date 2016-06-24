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

![Texpander - text snippets for Ubuntu](http://leehblue.com/show/texpander-screenshot.png)

To use Texpander:

- Start writing an email to somebody (or start editing any document)
- Put your cursor where you want your email signature to be pasted
- Type `ctrl+space` (or whatever keyboard shortcut you set up)
- A zenity window will appear asking for your abbreviation
- Type in `sig66` and hit Enter (or click "OK")
- The contents of `~/.texpander/sig66.txt` is pasted into your document

If I'm not in a web browser I'm in the terminal working in Vim. I've got some texpander files that I use in Vim. The terminal works a little differently from other GUI apps in that you have to type `ctrl+space+v` to paste stuff. In texpander.sh there is a check to see if the active window is a terminal. If so, it will paste using `ctrl+space+v` if not then it will paste normally as `ctrl+v`

## Contributing

1. Fork Texpander
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

**June 23, 2016**

- New: If the active window is a terminal paste with `ctrl+shift+v`

**May 17, 2016**

- Initial release

## Credits

Written by Lee Blue

## License

General Public License v3.0

