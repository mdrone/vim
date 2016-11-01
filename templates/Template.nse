:insert
description = [[
This script 

]]

---
-- @usage nmap -pPORT --script TEMPLATE.nse [--script-args ]<target>
--
-- @args 
--
-- @output
-- PORT   STATE SERVICE REASON
-- PORT/tcp open  http    syn-ack
--
---

author = "NAME <email>"
license = "Same as Nmap--See http://nmap.org/book/man-legal.html"
categories = {"default", "external", "auth", "safe", "version", "malware""discovery", "intrusive", "exploit", "vuln"}

require "shortport"

portrule = shortport.port_or_service( {80, 443}, {"http", "https"}, "tcp", "open")

  return 0

end

action = function(host, port)

end
