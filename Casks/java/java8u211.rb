cask 'java8u211' do
  version '8u211,b10:59066701cf1a433da9770636fbc4c9aa'
  sha256 '5f43e49b9cc4444852a5c62a7d0981407a836df4684c8be8b97e7c972376c914'

  url "file:///Users/dunso/software/jdk-#{version.before_comma}-macosx-x64.dmg",
	cookies: {
                 'oraclelicense' => 'accept-securebackup-cookie',
               }
  name 'Oracle Java 8 Standard Edition Development Kit'
  homepage 'https://www.oracle.com/technetwork/java/javase/overview/index.html'
  
  depends_on macos: '>= :yosemite'

  pkg 'JDK 8 Update 211.pkg'

  uninstall pkgutil: "com.oracle.jdk#{version.before_comma}",
            delete:  [
                       '/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin',
                       '/Library/PreferencePanes/JavaControlPanel.prefPane',
                     ]

  zap trash: [
               '~/Library/Application Support/Oracle/Java',
               '~/Library/Application Support/com.oracle.java.JavaAppletPlugin.plist',
               '~/Library/Application Support/com.oracle.javadeployment.plist',
             ]

  caveats do
    license 'https://www.oracle.com/technetwork/java/javase/terms/license/javase-license.html'
  end
end
