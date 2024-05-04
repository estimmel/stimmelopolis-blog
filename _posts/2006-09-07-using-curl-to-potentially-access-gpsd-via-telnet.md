---
layout: post
author: Eric Stimmel
title: using curl to potentially access gpsd via telnet...
tags: technology
date: 2006-09-07 00:11:15
--- 


[ this is more of a reminder to myself to check this out... ] so i saw something in this article called [Speaking UNIX, Part 3: Do everything right from the command line][] and it struck me that i might have been going about the whole stompbox project the wrong way... maybe curl is the right tool for probing the telnet port the gps receiver is on and logging the location... this note in the curl manual makes me think it is possible...

> [TELNET The curl telnet support is basic and very easy to use. Curl passes all data passed to it on stdin to the remote server. Connect to a remote telnet server using a command line similar to: curl telnet://remote.server.com And enter the data to pass to the server on stdin. The result will be sent to stdout or to the file you specify with -o.][]

i will have to try it out...

  [Speaking UNIX, Part 3: Do everything right from the command line]: http://www-128.ibm.com/developerworks/aix/library/au-speakingunix3.html?ca=dgr-lnxw07UnixUtilities4Net#list1
  [TELNET The curl telnet support is basic and very easy to use. Curl passes all data passed to it on stdin to the remote server. Connect to a remote telnet server using a command line similar to: curl telnet://remote.server.com And enter the data to pass to the server on stdin. The result will be sent to stdout or to the file you specify with -o.]: http://www.cs.stonybrook.edu/documentation/curl/index.html

