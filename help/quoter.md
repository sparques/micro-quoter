# Quoter Plugin

## Enable Plugin

Once installed, enable the plugin by setting `quoter.enable` to on:
`set quoter.enable on`

## Use

Select some text and press a quote or bracket button to surround the 
selected text with quotes or matching brackets.

## Quoting modes

Depending on the type of the current file, Quoter can apply different quote and
grouping symbols. For example, while in most languages backticks are usually
used in pairs, as in `` `backticked` ``, to represent strings, infix operators,
etc., in latex, to quote text, one would quote it with a backtick and an
apostrophe, as ` ``quote'' `. Quoting modes allow to resolve these conflicting
cases. 

However, these modes are not applied automatically but can be set by the user
in the `settings.json` file, in a per filetype basis, like other user settings,
through the `quoter.mode` setting. For example, setting the mode to tex for tex
files:

```json
{
    "ft:tex": {
        "quoter.mode": "tex"
    }
}
```

The available modes are: `default`, `c_style` and `tex`. The mode of the
current file can also be changed in the command-bar with:
`setlocal quoter.mode 'mode'`

Check the file `micro-quoter/modes.lua` in the plugin folder to see the
differences between the different modes. 

### Extending Quoting Modes

New modes can be added by extending the `modes` table. If you have sophisticated
quoting requisites that fall outside the implemented modes, feel free to extend
the `modes` table and do a pull request [here](https://github.com/sparques/micro-quoter).
