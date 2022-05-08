If you want to contribute with translations, it is pretty straightforward.

1-  Create a copy of template.pot and rename to the desired locale to be translated with the extension .po (eg.: fr.po, en.po, en_US.po)
    Here is a complete list of locale codes: https://stackoverflow.com/questions/3191664/list-of-all-locales-and-their-short-codes#answer-28357857
    You must use underscores instead of dashes for languages that are not reusable for the generic language (eg. en_JM, en_US, fr_CA, fr_FR)

2-  Then open your recently created locale file and translate it, you will see a pattern like this:
        #: ../contents/config/config.qml
        msgid "General"
        msgstr "Geral"
    Where 'msgstr' is the translated text.

3-  after saving your changes, run build.sh, the generated locale file will be in DIR/../contents/locale/${catLocale}/LC_MESSAGES/${projectName}.mo
    where DIR is your current directory (please make sure you are in the correct directory which is WIDGET_FOLDER/translate), catLocale is the desired locale and projectName is the full name of this widget.
