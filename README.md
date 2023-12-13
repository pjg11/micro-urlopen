# micro-urlopen
A plugin for the [micro](https://github.com/zyedidia/micro) text editor to add support for opening URLs in text files.

## Usage
Place the cursor over a URL in your file and press <kbd>Alt + o</kbd> to open it in your default browser.

## Installation

### Settings

Add this repo as a **pluginrepos** option in the **~/.config/micro/settings.json** file (it is necessary to restart the micro after this change):

```json
{
  "pluginrepos": [
      "https://raw.githubusercontent.com/pjg11/micro-urlopen/main/repo.json"
  ]
}
```

### Install

In your micro editor press **Ctrl-e** and run command:

```
> plugin install urlopen
```

or run in your shell

```sh
micro -plugin install urlopen
```
