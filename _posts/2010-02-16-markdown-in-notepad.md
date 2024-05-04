---
layout: post
author: Eric Stimmel
title: Markdown in Notepad++
date: 2010-02-16
--- 

I recently (recently as in about an hour ago) discovered a way to use [Notepad++][], my text editor of choice on Windows, to process [Markdown][] files into html without having to jump into DOS and run do it from the command line. I've been trying to keep my notes in Markdown for awhile now because I like that I can easily publish them to a blog or webpage without fighting with the markup. I also like the small bit of discipline it gives to my text files and the opportunity to tinker around with scripting in the process. Since I don't really blog that much or publish any html documents to speak of, it's more of an affectation than a truely useful exercise. That said, I still find myself writing in Markdown with a lingering feeling that the future is all in a browser.

I also enjoy Notepad++ and, like the web, it feels more powerful and full featured that I currently use. So it keeps my attention. I also like the tabs and persistant workspace it provides while the syntax highlighting and numbered lines make some of the things I do at work (writing AutoCAD, Autolisp and [AutoHotKey][] scripts specifically) much, much easier. I won't go into all the details, but if you do any scripting and you are doing it in plain Notepad you really need to take a long look at what you are missing.

So, to the point! What you need to do to get this to work on your Windows machine, and I'm going to gloss over a lot of the dirty work here, is the following:

1.  Install [Notepad++][]
2.  Install [Perl][] - I don't remember why, but I installed [Straberry Perl][] and it seems to work just great.
3.  You could install [thomsmits' Markdown syntax highlighting module for Notepad++][] if you want, but you don't have to. (I've only been using it for a few days and I'm not sure it's as solid as I would like, but it's something!)
4.  Make sure you have the NppExec plugin installed in Notepad++. I think it's a default, so not to worry.
5.  Go into Plugins \> NppExec \> Execute... or just hit F6 and type the following into the script box making sure to put the correct path to wherever your Markdown.pl script lives:

        perl "C:\Markdown_1.0.1\Markdown.pl" "$(FULL_CURRENT_PATH)"
        CON_SAVETO $(CURRENT_DIRECTORY)\$(NAME_PART).html

6.  Save and name the script in the NppExec dialog and you are good to go.
7.  To run your script, open a file using Markdown syntax and hit F6 and choose your script (if it doesn't come up by default) and select OK. Your new file will be saved in the same directory with the same name and the .html file extension.

I really like this and it seems to be working really well. You may have to toggle "No internal messages" in the NppExec menu if you are getting messages in your html file, but I have tested it and even wrote this blog post using this method!

*UPDATE 2010.02.19: Fixed the save to code.*

  [Notepad++]: http://notepad-plus.sourceforge.net/uk/site.htm
  [Markdown]: http://daringfireball.net/projects/markdown/
  [AutoHotKey]: http://www.autohotkey.com/
  [Perl]: http://www.perl.org/
  [Straberry Perl]: http://strawberryperl.com/
  [thomsmits' Markdown syntax highlighting module for Notepad++]: http://github.com/thomsmits/markdown_npp
