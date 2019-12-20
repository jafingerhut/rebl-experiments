# Introduction

This repository contains the results of experiments trying to start a
Clojure REPL that includes [Cognitect's
REBL](https://github.com/cognitect-labs/REBL-distro) software.
Because REBL uses the JavaFX library, you will experience errors
attempting to run it unless either:

+ You run with a JDK (Java Development Kit) that includes Java FX
  support.
+ You install the Java FX libraries separately.

TBD: Someone who knows Java FX better than I do should double check
the above for correctness.  I do know you can make REBL work by
following the first approach, and believe it is possible using the
second approach.  This repository currently focuses on the first.

The version combinations in the first table below worked, meaning that
at least there were no errors before the REBL browser window appeared.

| OS   | JDK      | deps.edn | Result |
| ---- | -------- | -------- | ------ |
| macOS 10.14, Ubuntu 18.04 | Zulu OpenJDK FX 8 | jdk8-01 | works |
| macOS 10.14 | Oracle JDK 8 | jdk8-01 | works |
| macOS 10.14, Ubuntu 18.04 | Zulu OpenJDK FX 11 | jdk11-02 or jdk11-01 | works |
| Ubuntu 18.04 | AdoptOpenJDK 11 | jdk11-01 | works |
| Ubuntu 18.04 | Zulu OpenJDK 11 | jdk11-01 | works |
| Ubuntu 18.04 | Ubuntu OpenJDK 11 | jdk11-01 | works |

The version combinations below failed with various kinds of errors.

| OS   | JDK      | deps.edn | Result |
| ---- | -------- | -------- | ------ |
| macOS 10.14, Ubuntu 18.04 | AdoptOpenJDK 8 | jdk8-01 | CNFE netscape... [Note 1] |
| macOS 10.14, Ubuntu 18.04 | Zulu OpenJDK 8 | jdk8-01 | CNFE netscape... [Note 1] |
| Ubuntu 18.04 | Oracle JDK 8 | jdk8-01 | tbd |
| macOS 10.14 | AdoptOpenJDK 11 | jdk11-01 | ULE [Note 3] |
| macOS 10.14, Ubuntu 18.04 | AdoptOpenJDK 11 | jdk11-02 | CNFE javafx... [Note 2] |
| macOS 10.14 | Zulu OpenJDK 11 | jdk11-02 | tbd |
| Ubuntu 18.04 | Zulu OpenJDK 11 | jdk11-02 | CNFE javafx... [Note 2] |
| Ubuntu 18.04 | Ubuntu OpenJDK 11 | jdk11-02 | CNFE javafx... [Note 2] |


[1] A stack trace shortly after starting, where near the end is this line:

```
Caused by: java.lang.ClassNotFoundException: netscape.javascript.JSObject
```

[2] A stack trace shortly after starting, where near the end is this line:

```
Caused by: java.lang.ClassNotFoundException: javafx.scene.web.WebEngine
```

[3] An UnsatisfiedLinkError message that begins with lines like these:

```
Loading library prism_es2 from resource failed: java.lang.UnsatisfiedLinkError: /Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib: dlopen(/Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib, 1): no suitable image found.  Did find:
	/Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib: code signature in (/Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib) not valid for use in process using Library Validation: mapped file has no cdhash, completely unsigned? Code has to be at least ad-hoc signed.
java.lang.UnsatisfiedLinkError: /Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib: dlopen(/Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib, 1): no suitable image found.  Did find:
	/Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib: code signature in (/Users/andy/.openjfx/cache/11.0.1/libprism_es2.dylib) not valid for use in process using Library Validation: mapped file has no cdhash, completely unsigned? Code has to be at least ad-hoc signed.
	at java.base/java.lang.ClassLoader$NativeLibrary.load0(Native Method)
```


# macOS OpenJDK with Java FX included

Instructions to download a macOS version of Zulu Community edition of
OpenJDK with Java FX included, which makes it more straightforward to
run Cognitect REBL:

Go to the [Download Zulu
Community](https://www.azul.com/downloads/zulu-community) web page.

Scroll down about a page full until you see a heading "Zulu Community
(TM) Download", and immediately below that a row of popup menus
labeled "Java Version", "Operating System", etc.

+ In the "Operating System" popup menu, select "macOS"
+ In the "Java Package" popup menu, select "JDK FX".  If you select
  "JDK" instead, it will _not_ include Java FX.

As of 2019-Dec, after making those two menu selections, the list of
versions with download links below that row of popup menus included
one version of Java 11 (LTS), and one version of Java 8 (LTS).
Download and install the one you wish.  You can see some older
versions by clicking on the slider labeled "Older Zulu versions" to
the right of the row of popup menus.
