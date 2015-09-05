# Requirements

```bash
brew install speedtest_cli
```

# Usage

```bash
./main.rb
```

# Schedule (OS X)

Download [launchd.plist file](https://raw.githubusercontent.com/exalted/speedtest/master/org.pittle.speedtest.plist), tweak a little bit and...

```bash
mkdir -p ~/Library/LaunchAgents
ln -s <Download Path>/org.pittle.speedtest.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/org.pittle.speedtest.plist
```
