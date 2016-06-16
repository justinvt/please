require 'screencap'

f = Screencap::Fetcher.new('http://google.com')
s = f.fetch(:output => '/home/stridor/Code/tree/public/sc.png')
s.close
f.close
exit
