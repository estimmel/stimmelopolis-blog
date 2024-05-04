---
layout: post
author: Eric Stimmel
title: still struggling
tags: technology
date: 2006-01-12 03:59:08
--- 


so, it's late... quarter til 3am and i have some updates on the gps project i've been working on, but now blogger is down... ugh. so just a couple notes here... nothing interesting, but i need to write things down to remember what i did. got gpslogger.pl to work on my laptop... writing to a .txt file from the command line and then later to a .xml file by adding in some of the script from the GPStoXML.pl script. that made me feel good, however i don't seem to be having luck running gpslogger.pl on my domain. i think it's because it calls a function called Term::ReadKey that i had to load separately on my system... it's a perl module. i'll have to email my hosting service to see if they can add it. speaking of my hosting service [ fatcow.com ] i emailed them earlier in the evening about activating PHP socket support and i just got an email saying that they did it. that's awesome! my code still doesn't work, but i'm too tired to try to figure out if it's something that i changed while i was waiting... also, i seem to have lost my access to the error logs... guess i should try that once more before i go to bed, but it's kind of hard to know what's wrong without them. a couple more things... i thought i might be able to run gpslogger.pl on the stompbox and have it write to a .xml file on my server, but again the Term::ReadKey module isn't installed on the stompbox... no problem, i'll just install it... well it requires MakeMaker to install and i can't get to that because the Debian Package server is down.... [ sigh ] what else... i thought there were some other things, but i guess i forgot them already... need to write more, faster, with more detail.

