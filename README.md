##ABOUT##

SOUP Kitchen is a simple web front-end to OS X Server's Software Update service which allows users to browse and download the available packages.


##USAGE##

> sudo gem install sinatra
> cd soup\_kitchen
> ruby -rubygems app.rb http://your.sus.server.com:8080/index.sucatalog

Browse to http://localhost:4567

The update catalog is loaded on startup. A reload can be forced by visiting /reload. Clicking the download link will download the *biggest package from that update* (see bugs below). The info button will take you to the metadata file for that update.


##BUGS##

- The download links are not entirely accurate. Most updates these days are complex distributions, consisting of several parts and dependencies which SOUP Kitchen cannot handle properly. The download link simply points to the largest package of a Software Update, which is typically what one wants, but not always.

- Only English packages can be downloaded

- It takes quite a while for the app to start up. This is because in order to get the proper title of an Update, the metadata file must be fetched from the server. For a server that mirrors all updates, this means about 400 requests to the server. This has been tested with the options "Copy all updates from Apple" and "Delete outdated software updates"

- The number of packages doesn't always seem to match the one in Server Admin


## CREDITS ##

- Icons from [Yusuke Kamiyamane](http://p.yusukekamiyamane.com/)
- PLIST parsing done using the excellent PLIST Ruby library [from these guys](http://plist.rubyforge.org/)


## LICENSE##

Copyright (c) 2012 Filipp Lepalaan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
