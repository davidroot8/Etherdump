#  Etherdump and Etherdump Lite Help

## Etherdump Lite versus Etherdump

"Etherdump Lite" is a <em>sandboxed</em> version of Etherdump designed for the MacOS App Store. It is not capable of making packet captures directly, but can import packet captures made using other tools (such as tcpdump).

"Etherdump" is a "full" version of Etherdump available at https://networkmom.net/etherdump   It is not <em>sandboxed</em> but is **notarized** by Apple.

Both versions are **free**.  Open source code for both versions is available at https://github.com/darrellroot/Etherdump under the lenient MIT license.  Etherdump is implemented in Swift and SwiftUI.

## Getting packet captures for Etherdump Lite

You can capture 100 ethernet frames from interface en0 by executing the following command in a **Terminal** window:<p>

`sudo tcpdump -i en0 -c 100 -s 65000 -w capture.pcapng`

(then generate enough network traffic so 100 frames are captured and the command completes)

You can use the **File -> Import PCAP or PCAPNG File** menu item to import the capture.pcapng file into Etherdump Lite.

## Getting packet captures with Etherdump (full version)

**In order to capture ethernet frames directly with Etherdump, your username needs read-access to all /dev/bpf* files.** Assuming your account is allowed to administer your Macintosh, you can gain access by executing the following command in a Terminal window:

`sudo chmod g+r /dev/bpf*`

The Mac dynamically creates /dev/bpf devices, so you may need to repeat this procedure after attempting a frame capture.
Once you have read group permission to /dev/bpf*, you can use the **File -> New Capture Window** menu command to open a capture window.  Then select your interface and click **Start**.
If you previously installed **Wireshark** your read permissions to /dev/bpf* may already be fixed.

## Etherdump welcomes feedback at feedback@networkmom.net

+ Please email feedback or suggestions to feedback@networkmom.net
+ We welcome pull requests at github, particularly for additional protocol decodes.  Writing a protocol decode is an excellent Computer Science student project and looks great on your resume!  All submissions require a test case and will be carefully reviewed.

## Etherdump Open Source Repositories

+ Etherdump and Etherdump Lite [https://github.com/darrellroot/Etherdump](https://github.com/darrellroot/Etherdump)
+ etherdump command-line version [https://github.com/darrellroot/etherdump-CLI](https://github.com/darrellroot/etherdump-CLI)
+ PackageEtherCapture (frame/packet decode logic) [https://github.com/darrellroot/PackageEtherCapture](https://github.com/darrellroot/PackageEtherCapture)
+ PackageSwiftPcapng (file import logic) [https://github.com/darrellroot/PackageSwiftPcapng](https://github.com/darrellroot/PackageSwiftPcapng)
+ [https://github.com/apple/swift-log](https://github.com/apple/swift-log)

## Frame Decodes supported in version 1.0 March 2020

+ Ethernet-II Frame
+ 802.2 Frame
+ 802.3 SNAP Header
+ Cisco Discovery Protocol (CDP)
+ Link Layer Discovery Protocol (LLDP)
+ Bridge Protocol Data Unit (STP BPDU)
+ IPv4
+ IPv6
+ TCP
+ UDP
+ ICMPv4
+ ICMPv6

## About Wireshark

Wireshark, available from https://wireshark.org, is the worlds best packet capture and analysis tool (originally implemented by Gerald Combs).  It is open source, implemented in C, and supports many platforms.  It has (many) more packet decodes and expert troubleshooting tools than Etherdump.  We thank the Wireshark team for their excellent tool and hope that one day Etherdump will be a Swift alternative with competitive functionality.

## About Network Mom LLC

Network Mom LLC is a one-person LLC operated by Darrell Root.  In addition to our open source projects Etherdump, PackageEtherCapture, and PackageSwiftPcapng, we also sell apps to help with network management in the MacOS App Store:

<dl>
    <dt>Network Mom ACL Analyzer</dt>
    <dd>Tool to analyze Cisco Access-lists to see which lines match a socket and find duplicate/superset lines</dd>
    <dt>Network Mom Availability</dt>
    <dd>Tool to ping devices via ICMPv4 and ICMPv6, monitor what is up and what is down, and generate periodic reports of availability percentages.</dd>
</dl>

## Disclaimer and license

Etherdump, PackageEtherCapture, and PackageSwiftPcapng source code are available with the MIT license:

<pre>
The MIT License

Copyright (c) 2020 Network Mom LLC, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
</pre>

In addition, Etherdump Lite is covered by Apple's standard EULA for the MacOS App Store: [https://www.apple.com/legal/internet-services/itunes/dev/stdeula/](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/)

