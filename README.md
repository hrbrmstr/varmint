
# varmint

Retrieve Content from and Interact with ‘Gopher’ Servers

## Description

The ‘Gopher’ protocol is a ‘TCP/IP’ application layer protocol designed
for distributing, searching, and retrieving documents over the Internet.
The ‘Gopher’ protocol was strongly oriented towards a menu-document
design and presented an alternative to the World Wide Web in its early
stages, but ultimately ‘Hypertext Transfer Protocol’ (‘HTTP’) became the
dominant protocol. The ‘Gopher’ ecosystem is often regarded as the
effective predecessor of the ‘World Wide Web’. Tools are provided to
interact with and retrieve content from ‘Gopher’ servers.

## What’s Inside The Tin

The following functions are implemented:

  - `gopher`: Fetch a resource using the gopher protocol
  - `g_content`: Retrieve the content portion of a gopher response

## TODO

  - handle `URL` selectors
  - handle content types
  - console gopher client
  - Shiny gopher client

## Installation

``` r
devtools::install_github("hrbrmstr/varmint")
```

## Usage

``` r
library(varmint)
library(tidyverse)

# current verison
packageVersion("varmint")
```

    ## [1] '0.1.0'

### Take a peek at one of the only remaining Gopher servers in existence:

``` r
x <- gopher("gopher.floodgap.com") 
```

``` r
str(x)
```

    ## List of 7
    ##  $ url        : chr "gopher://gopher.floodgap.com/"
    ##  $ status_code: int 0
    ##  $ headers    : raw [1:2] 0d 0a
    ##  $ modified   : POSIXct[1:1], format: NA
    ##  $ times      : Named num [1:6] 0 0.000705 0.103423 0.103511 0.220162 ...
    ##   ..- attr(*, "names")= chr [1:6] "redirect" "namelookup" "connect" "pretransfer" ...
    ##  $ content    : raw [1:5588] 69 57 65 6c ...
    ##  $ ip         : chr "66.166.122.165"
    ##  - attr(*, "class")= chr "gopher_response"

``` r
x
```

    ##              Welcome to Floodgap Systems' official gopher server.
    ##              Floodgap has served the gopher community since 1999
    ##              (formerly gopher.ptloma.edu). ** OVER 15 YEARS SERVING YOU! **
    ##               
    ##              We run Bucktooth 0.2.9 on xinetd as our server system.
    ##              gopher.floodgap.com is an IBM Power 520 Express with a 2-way
    ##              4.2GHz POWER6 CPU and 8GB of RAM, running AIX 6.1 +patches.
    ##              Send gopher@floodgap.com your questions and suggestions.
    ##               
    ##              ***********************************************************
    ##              **       CELEBRATING GOPHER'S 25 YEAR ANNIVERSARY!       **
    ##              **               Plain text is beautiful!                **
    ##              ***********************************************************
    ##               
    ##       (text) Does this gopher menu look correct?
    ##              (plus using the Floodgap Public Gopher Proxy)
    ##       (menu) Super-Dimensional Fortress: SDF Gopherspace
    ##              Get your own Gopherspace and shell account!
    ##               
    ##              --- Getting started with Gopher -----------------------------------
    ##       (menu) Getting started with gopher, software, more
    ##              (what is Gopherspace? We tell you! And find out how
    ##              to create your own Gopher world!)
    ##               
    ##       (text) Using your web browser to explore Gopherspace
    ##              (READ IT! LEARN IT! LOVE IT!)
    ##              (useful tips for gopher newbies, updated 14 April 2015)
    ##               
    ##       (menu) The Overbite Project: Gopher clients for mobile and desktop (OverbiteFF, Overbite Android)
    ##              (download gopher add-ons for Mozilla Firefox/SeaMonkey,
    ##              mobile clients for Android and more! Put Gopherspace on
    ##              your mobile phone or desktop computer!)
    ##       (menu) Other Gopher clients for various platforms
    ##               
    ##              --- Find and search for other Gopher sites on the Internet --------
    ##       (menu) Search Gopherspace with Veronica-2
    ##              or search all known titles in Gopherspace with V-2 from here:
    ##      (index) Search Veronica-2
    ##               
    ##       (menu) All the gopher servers in the world (that we know of)
    ##              (updated with robot updates)
    ##       (menu) New Gopher servers since 1999
    ##              (updated 1 April 2018: no fooling)
    ##               
    ##              --- Get news, weather and more through Gopherspace ----------------
    ##       (menu) Weather maps and forecasts via Floodgap Groundhog
    ##              (USA and Australia; updates occur throughout the day)
    ##       (menu) News and headline feeds via Flood Feeds
    ##              (updates occur daily/regularly)
    ##       (menu) Most current Floodgap news feeds
    ##              (today's most updated news and headlines)
    ##       (text) Caltrans California highway conditions
    ##              (hourly updates on California highway conditions)
    ##              (updated on access)
    ##               
    ##              --- File archives and downloads -----------------------------------
    ##       (menu) Floodgap File Archives and Mirrors
    ##              (includes external archives and historical files,
    ##              Walnut Creek CP/M-Osborne-Commodore-Beehive archives,
    ##              Info-Mac, classic Mac software and more)
    ##               
    ##              --- Fun, games, and other neat things -----------------------------
    ##       (menu) Floodgap Gopher Fun and Games
    ##              (with xkcd, the Gopher Figlet gateway and the fld.gp Gopher
    ##               Shortener Service)
    ##       (menu) Floodgap users and staff gopher pages
    ##              (the usual gang of idiots)
    ##       (menu) The New GopherVR: A Virtual Reality View of Gopherspace
    ##              (version 0.5.1 released 24 October 2015)
    ##               
    ##              --- Server software behind the scenes -----------------------------
    ##       (menu) The Bucktooth gopher server
    ##              (version 0.2.9 released 1 May 2011)
    ##               
    ##              --- Gopherspace advocacy and activism -----------------------------
    ##       (menu) Floodgap Gopher Statistics Project
    ##              (monthly traffic analysis of the Floodgap Public Gopher Proxy
    ##              for community advocacy purposes; updates monthly)
    ##               
    ##              --- Floodgap specific ---------------------------------------------
    ##       (text) Yes, gopher.floodgap.com is the same as gopher.ptloma.edu
    ##       (menu) The Floodgap Free Software License
    ##       (text) Where's Floodgap? (not for hatemail ;-)
    ##       (text) What's the temperature in the Floodgap server room?
    ##       (text) "/usr/bin/tail" our gopher server log
    ##       (text) RIP, Master gopher at University of Minnesota
    ##       (html) Floodgap.com (Web pages)
    ##               
    ##              Please note that this gopher is now an independent
    ##              entity and is no longer affiliated with Point Loma
    ##              Nazarene University.

``` r
g_content(x, TRUE) %>% 
  print(n = 20)
```

    ## # A tibble: 26 x 6
    ##    item_type item_type_descr display_string                                           selector     hostname       port 
    ##    <chr>     <chr>           <chr>                                                    <chr>        <chr>          <chr>
    ##  1 0         text            Does this gopher menu look correct?                      /gopher/pro… gopher.floodg… 70   
    ##  2 1         menu            Getting started with gopher, software, more              /gopher      gopher.floodg… 70   
    ##  3 0         text            Using your web browser to explore Gopherspace            /gopher/wbg… gopher.floodg… 70   
    ##  4 1         menu            The Overbite Project: Gopher clients for mobile and des… /overbite    gopher.floodg… 70   
    ##  5 1         menu            Other Gopher clients for various platforms               /gopher/cli… gopher.floodg… 70   
    ##  6 1         menu            Search Gopherspace with Veronica-2                       /v2          gopher.floodg… 70   
    ##  7 7         index           Search Veronica-2                                        /v2/vs       gopher.floodg… 70   
    ##  8 1         menu            All the gopher servers in the world (that we know of)    /world       gopher.floodg… 70   
    ##  9 1         menu            New Gopher servers since 1999                            /new         gopher.floodg… 70   
    ## 10 1         menu            Weather maps and forecasts via Floodgap Groundhog        /groundhog   gopher.floodg… 70   
    ## 11 1         menu            News and headline feeds via Flood Feeds                  /feeds       gopher.floodg… 70   
    ## 12 1         menu            Most current Floodgap news feeds                         /feeds/late… gopher.floodg… 70   
    ## 13 0         text            Caltrans California highway conditions                   /calroads    gopher.floodg… 70   
    ## 14 1         menu            Floodgap File Archives and Mirrors                       /archive     gopher.floodg… 70   
    ## 15 1         menu            Floodgap Gopher Fun and Games                            /fun         gopher.floodg… 70   
    ## 16 1         menu            Floodgap users and staff gopher pages                    /users       gopher.floodg… 70   
    ## 17 1         menu            The New GopherVR: A Virtual Reality View of Gopherspace  /gophervr    gopher.floodg… 70   
    ## 18 1         menu            The Bucktooth gopher server                              /buck        gopher.floodg… 70   
    ## 19 1         menu            Floodgap Gopher Statistics Project                       /gstats      gopher.floodg… 70   
    ## 20 0         text            Yes, gopher.floodgap.com is the same as gopher.ptloma.e… /ptloma      gopher.floodg… 70   
    ## # ... with 6 more rows

### See some other servers

``` r
x1 <- gopher("gopher://gopher.floodgap.com", "/new") 
```

``` r
x1
```

    ##       (menu) Floodgap Systems gopher root
    ##               
    ##              If you've installed a Gopher server after 1999, we'd love to list
    ##              new Gophers here. (This list is now resorted to put newest servers
    ##              on the top.)
    ##               
    ##              Please note that these links go to servers that are not maintained
    ##              by Floodgap and no opinion is expressed over the content therein.
    ##              Your use is at your own risk.
    ##               
    ##              List your gopher resource here by mailing gopher@floodgap.com.
    ##              Please also report any dead servers listed. Servers that do not
    ##              have DNS or reliable connections will be periodically purged.
    ##               
    ##              You can also see the most actively tested and verified servers as
    ##              Veronica-2 crawls them:
    ##       (menu) "Greatest hits": most recently verified gopher servers
    ##               
    ##              ** NOTE: new links listed here may not yet be available for search
    ##              in Veronica-2 or in the global database. **
    ##               
    ##       (menu) Jakob's Gopher Site
    ##       (menu) kichimi's hoard
    ##       (menu) Mare Tranquillitatis People's Circumlunar Zaibatsu
    ##       (menu) Umbrellix Gopher
    ##       (menu) gopher.zcrayfish.soy
    ##       (menu) PDP-11 Old Mainframe
    ##       (menu) Beastieboy.net - FreeBSD, Emacs, Lisp, PostgreSQL and programming in general
    ##       (menu) Tellus
    ##       (menu) Endangered Software Society
    ##       (menu) WSMF Old Time Radio Gopher
    ##       (menu) FIRST-Lab/ETHZ Gopher
    ##       (menu) Sandro's gopherspace
    ##       (menu) phlog @szabolcsszucs.com w/ arts&programming
    ##       (menu) Me0w network
    ##       (menu) Cyber Vanguard
    ##       (menu) HN Gopher - A Hacker News Mirror
    ##       (menu) Raspberry Pi of Death Gopherhole
    ##       (menu) FrillerWorks
    ##       (menu) Electric Transcendence
    ##       (menu) MtxDev gopher space, Music and Ideas of Steve
    ##       (menu) happymacs.ddns.net - Vintage Mac blog and MacOS software archive
    ##       (menu) Pollett Gopher
    ##       (menu) Ratthing.com, San Antonio, TX
    ##       (menu) Grex Public Access Unix
    ##       (menu) neozeed's gopher server
    ##       (menu) (blog) VirtuallyFun
    ##       (menu) gopher.blog.benjojo.co.uk
    ##       (menu) Jellybean Styling
    ##       (menu) tx' gopherhole
    ##       (menu) Computers and Aviation, UNIXWIRE
    ##       (menu) A BSD users group in colorful Colorado
    ##       (menu) cloudb
    ##       (menu) DusteDs Home in Cyberspace
    ##       (menu) FROG Tips
    ##       (menu) ZeLibertineGamer's gopher
    ##       (menu) umaxx.net
    ##       (menu) Plan 9 From Gopherspace
    ##       (menu) Ye olde friByte
    ##       (menu) Conman Laboratories
    ##       (menu) MetaFilter: sharing and discussing neat stuff
    ##       (menu) Loki's Gopherspace
    ##       (menu) gopher4all.com - Vincent's Gopherspace
    ##       (menu) Tomas' personal Gopherhole
    ##       (menu) LV-426 Information Center
    ##       (menu) ICM UW Public Archives
    ##       (menu) Seattle Tourism Bureau
    ##       (menu) Martin's Gopher Hole
    ##       (menu) BE9 - The Psychedelic side of gopherspace
    ##       (menu) Alon Bassok for Seattle City Council
    ##       (menu) therandymon.com - Into the Wild Spaces
    ##       (menu) Pogemon.pw - vaporhole aesthetics
    ##       (menu) gopherspace.de - German Gopher Service
    ##       (menu) DtZ 8 bit CPU projects: Z80, m68k, CP/M and others
    ##       (menu) tilde.land
    ##       (menu) Yin Feng's Chan Buddhist Gopherhole
    ##       (menu) Counterrevolution in Gopherspace
    ##       (menu) VSTa OS Home Page
    ##       (menu) smutek.pl: UNIXy things
    ##       (menu) Kevin Veroneau's Gopherspace
    ##       (menu) The RPi4 Gopher
    ##       (menu) John & Cloudia's Gopher hole
    ##       (menu) Tyrfingr Heavy Industries
    ##       (menu) SalsaNet - San Antonio Texas
    ##       (menu) devio.us: OpenBSD Shell Provider
    ##       (menu) John's Gopher Hole
    ##       (menu) xenotide
    ##       (menu) NW8L's Ham Radio and Retro Tech
    ##       (menu) Ygrex' Debian Gopherspace
    ##       (menu) TalkingCats Gopher Hole
    ##       (menu) Justin's Gopher Hole
    ##       (menu) David Griffith's 661.org
    ##       (menu) Interactive Fiction Archive
    ##       (menu) uninformativ.de
    ##       (menu) Logout's Gopherspace
    ##       (menu) Port 70 Gopher Outpost
    ##       (menu) PS3 Server
    ##       (menu) Ptah's Globus Compendius
    ##       (menu) Firien
    ##       (menu) Information Underground
    ##       (menu) Delaware Linux User Group - Free Software Mirror
    ##       (menu) simple machines
    ##       (menu) The Terminal Core
    ##       (menu) pongonova.org
    ##       (menu) The Gophernicus Project
    ##       (menu) holviala.com
    ##       (menu) Docfile.org
    ##       (menu) SDF Member PHLOGOSPHERE
    ##       (menu) gopher.idefix.net
    ##       (menu) Maz's Gopher Server
    ##       (menu) RetroNET Gopher Hole
    ##       (menu) Output of Wine compilation for PlayOnLinux (by MulX)
    ##       (menu) robsayers.com
    ##       (menu) fosco's glog
    ##       (menu) gopher.viste-family.net
    ##       (menu) Florian's gopher node
    ##       (menu) port70.net
    ##       (menu) gopher.rp.spb.su
    ##       (menu) Wensley Group
    ##       (menu) 4d2.org
    ##       (menu) iSiS UNVEiLED
    ##       (menu) bbsorillia.com
    ##       (menu) R-36
    ##       (menu) Lost Halls of Ladros
    ##       (menu) Meulie .net Gopher server
    ##       (menu) goffer.dyn-o-saur.com
    ##       (menu) The Frugal Web Server's Gopher Portal
    ##       (menu) Rachael/Amiga Gopherexx Telefisk
    ##       (menu) SDF Public Access UNIX
    ##       (menu) quux.org Gopher
    ##       (menu) Kostecke.net Gopher

``` r
g_content(x1, TRUE) %>% 
  print(n = 20)
```

    ## # A tibble: 2 x 6
    ##   item_type item_type_descr display_string                                             selector        hostname   port 
    ##   <chr>     <chr>           <chr>                                                      <chr>           <chr>      <chr>
    ## 1 1         menu            Floodgap Systems gopher root                               /               gopher.fl… 70   
    ## 2 1         menu            "\"Greatest hits\": most recently verified gopher servers" /world/last-hit gopher.fl… 70

### Check out the Veronica menu

``` r
x2 <- gopher("gopher://gopher.floodgap.com", "/v2") 
```

``` r
x2
```

    ##       (menu) Floodgap Systems gopher root
    ##               
    ##              Welcome to Veronica-2, the reincarnated Gopher
    ##              search engine!
    ##               
    ##              Veronica-2 covers 4.9 million selectors and growing
    ##              (approximately 91% of Gopherspace according to
    ##              our best estimates).
    ##               
    ##              We strongly recommend reading the help files
    ##              before you begin. Floodgap Systems takes no
    ##              responsibility for the quality or content of
    ##              matches found using V-2.
    ##               
    ##      (index) Search Veronica-2
    ##       (menu) Help files and how to search with Veronica-2
    ##       (text) About the indexer
    ##               
    ##       (text) V-2 statistics
    ##              (Last time of update and server status)
    ##               
    ##       (menu) All the gopher servers in the world (that we know of)
    ##               
    ##       (html) FLASH: Archie marries Veronica (WWW)
    ## 

``` r
g_content(x2, TRUE) %>% 
  print(n = 20)
```

    ## # A tibble: 7 x 6
    ##   item_type item_type_descr display_string                                        selector              hostname  port 
    ##   <chr>     <chr>           <chr>                                                 <chr>                 <chr>     <chr>
    ## 1 1         menu            Floodgap Systems gopher root                          /                     gopher.f… 70   
    ## 2 7         index           Search Veronica-2                                     /v2/vs                gopher.f… 70   
    ## 3 1         menu            Help files and how to search with Veronica-2          /v2/help              gopher.f… 70   
    ## 4 0         text            About the indexer                                     /v2/help/indexer      gopher.f… 70   
    ## 5 0         text            V-2 statistics                                        /v2/vstat             gopher.f… 70   
    ## 6 1         menu            All the gopher servers in the world (that we know of) /world                gopher.f… 70   
    ## 7 h         html            FLASH: Archie marries Veronica (WWW)                  URL:http://www.nydai… gopher.f… 70

### Search for some XKCD comics

``` r
x3 <- gopher("gopher://gopher.floodgap.com", "/v2/vs", "xkcd")
```

``` r
x3
```

    ##       (menu) Floodgap Systems gopher root
    ##              
    ##              Veronica-2 2.058.2 (C)2000-2016 Cameron Kaiser
    ##              Engine version 0.4.051
    ##              ** Search in progress, please wait **
    ##              
    ##              *** Search terms: xkcd ***
    ##              First 30 selectors displayed (page 1).
    ##              Results sorted by apparent relevance.
    ##              Approximately 300 total matches.
    ##              
    ##      (index) Enter new search keywords
    ##       (text) Folders/directories are least accurate! (and other notes)
    ##              
    ##       (text) Refining your query
    ##              
    ##              ------------------------------------------------------------
    ##              
    ##       (menu) xkcd - A Webcomic of Romance, Sarcasm, Math and Language.
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd
    ##       (menu) xkcd - A Webcomic - Girl sleeping (Sketch -- 11th grade Spanish class) (7)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/0/7
    ##       (menu) xkcd - A Webcomic - Guest Week: Jeph Jacques (Questionable Content) (822)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/820/822
    ##       (menu) xkcd - A Webcomic - Guest Week: David Troupes (Buttercup Festival) (823)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/820/823
    ##       (menu) xkcd - A Webcomic - Guest Week: Jeffrey Rowland (Overcompensating) (825)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/820/825
    ##       (menu) xkcd - A Webcomic - Firefox and Witchcraft - The Connection? (111)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/110/111
    ##       (menu) xkcd - A Webcomic - Serenity is coming out tomorrow (9)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/0/9
    ##       (menu) xkcd - A Webcomic - I Have Owned Two Electric Skateboards (139)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/130/139
    ##       (menu) xkcd - A Webcomic - Electric Skateboard (Double Comic) (409)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/400/409
    ##       (menu) xkcd - A Webcomic - Parody Week: TFD and Natalie Dee (143)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/140/143
    ##       (menu) xkcd - A Webcomic - xkcd Loves the Discovery Channel (442)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/440/442
    ##       (menu) xkcd - A Webcomic - Guest Week: Bill Amend (FoxTrot) (824)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/820/824
    ##       (menu) python-xkcd
    ##              gopher://ftp.icm.edu.pl:70/1/packages/linux-debian/pool/main/p/python-xkcd
    ##       (menu) xkcd - A Webcomic - Playing Devil's Advocate to Win (164)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/160/164
    ##       (menu) xkcd - A Webcomic - The Mother of All Suspicious Files (1247)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/1240/1247
    ##       (menu) xkcd - A Webcomic - Telescopes: Refractor vs Reflector (1791)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/1790/1791
    ##       (menu) xkcd - A Webcomic - With Apologies to Robert Frost (312)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/310/312
    ##       (menu) xkcd - A Webcomic - Further Boomerang Difficulties (475)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/470/475
    ##       (menu) xkcd - A Webcomic - Godel, Escher, Kurt Halsey (24)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/20/24
    ##       (menu) xkcd - A Webcomic - Profile Creation Flowchart (94)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/90/94
    ##       (menu) xkcd - A Webcomic - Fashion Police and Grammar Police (1735)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/1730/1735
    ##       (menu) xkcd - A Webcomic - Bad Map Projection: Liquid Resize (1784)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/1780/1784
    ##       (menu) xkcd - A Webcomic - I Am Not Good with Boomerangs (445)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/440/445
    ##       (menu) xkcd - A Webcomic - Alternative Energy Revolution (556)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/550/556
    ##       (menu) xkcd - A Webcomic - Digital Rights Management (86)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/80/86
    ##       (menu) xkcd - A Webcomic - The Sierpinski Penis Game (95)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/90/95
    ##       (menu) xkcd - A Webcomic - Parody Week: Dinosaur Comics (145)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/140/145
    ##       (menu) xkcd - A Webcomic - Skateboarding is Not a Crime (172)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/170/172
    ##       (menu) xkcd - A Webcomic - World According to Americans (850)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/850/850
    ##       (menu) xkcd - A Webcomic - Chicken Pox and Name Statistics (1950)
    ##              gopher://gopher.floodgap.com:70/1/fun/xkcd/comics/1950/1950
    ##              
    ##              ------------------------------------------------------------
    ##              
    ##      (index) Enter new search keywords
    ##       (menu) Back to the beginning
    ##       (menu) Next 30 matches

``` r
g_content(x3, TRUE) %>% 
  filter(item_type_descr == "info")
```

    ## # A tibble: 47 x 6
    ##    item_type item_type_descr display_string                                 selector hostname   port 
    ##    <chr>     <chr>           <chr>                                          <chr>    <chr>      <chr>
    ##  1 i         info            ""                                             v2/      error.host 1    
    ##  2 i         info            Veronica-2 2.058.2 (C)2000-2016 Cameron Kaiser v2/      error.host 1    
    ##  3 i         info            Engine version 0.4.051                         v2/      error.host 1    
    ##  4 i         info            ** Search in progress, please wait **          v2/      error.host 1    
    ##  5 i         info            ""                                             v2/      error.host 1    
    ##  6 i         info            *** Search terms: xkcd ***                     v2/      error.host 1    
    ##  7 i         info            First 30 selectors displayed (page 1).         v2/      error.host 1    
    ##  8 i         info            Results sorted by apparent relevance.          v2/      error.host 1    
    ##  9 i         info            Approximately 300 total matches.               v2/      error.host 1    
    ## 10 i         info            ""                                             v2/      error.host 1    
    ## # ... with 37 more rows

``` r
g_content(x3, TRUE) %>% 
  filter(item_type_descr == "menu")
```

    ## # A tibble: 33 x 6
    ##    item_type item_type_descr display_string                                     selector           hostname       port 
    ##    <chr>     <chr>           <chr>                                              <chr>              <chr>          <chr>
    ##  1 1         menu            Floodgap Systems gopher root                       /                  gopher.floodg… 70   
    ##  2 1         menu            xkcd - A Webcomic of Romance, Sarcasm, Math and L… /fun/xkcd          gopher.floodg… 70   
    ##  3 1         menu            xkcd - A Webcomic - Girl sleeping (Sketch -- 11th… /fun/xkcd/comics/… gopher.floodg… 70   
    ##  4 1         menu            xkcd - A Webcomic - Guest Week: Jeph Jacques (Que… /fun/xkcd/comics/… gopher.floodg… 70   
    ##  5 1         menu            xkcd - A Webcomic - Guest Week: David Troupes (Bu… /fun/xkcd/comics/… gopher.floodg… 70   
    ##  6 1         menu            xkcd - A Webcomic - Guest Week: Jeffrey Rowland (… /fun/xkcd/comics/… gopher.floodg… 70   
    ##  7 1         menu            xkcd - A Webcomic - Firefox and Witchcraft - The … /fun/xkcd/comics/… gopher.floodg… 70   
    ##  8 1         menu            xkcd - A Webcomic - Serenity is coming out tomorr… /fun/xkcd/comics/… gopher.floodg… 70   
    ##  9 1         menu            xkcd - A Webcomic - I Have Owned Two Electric Ska… /fun/xkcd/comics/… gopher.floodg… 70   
    ## 10 1         menu            xkcd - A Webcomic - Electric Skateboard (Double C… /fun/xkcd/comics/… gopher.floodg… 70   
    ## # ... with 23 more rows
