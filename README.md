# WhiteScreenMacOsApp
This macOS Swift app opens a customizable white window that can be resized and moved around. It sits on top of any other app or browser window, providing a distraction-free browsing experience.

## Features
- Customizable blank window
- Resizable with Hover effect
- Always stays on top of other apps and browsers
- Minimize option for easy access

## Installation
1. Install Swift and Homebrew:

   - **Swift:** Ensure you have Swift installed on your macOS. If not, you can install it using Homebrew:

     ```bash
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     brew install swift
     ```

   - **Homebrew:** If you don't have Homebrew installed, you can install it with the following command:

     ```bash
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     ```

2. Clone this repository and open the project:

   ```bash
   git clone https://github.com/your-username/WhiteScreenMacOsApp.git
   cd WhiteScreenMacOsApp
   open WhiteScreenMacOsApp.xcodeproj  # To open in Xcode
   # OR
   code .  # To open in Visual Studio Code
3. Build and run the app:

    Using Xcode: Press Cmd + R in Xcode to build and run the app.

    Using the command line: You can also build the app from the command line using Swift Compiler:
    swiftc -o WhiteScreenMacOsApp main.swift
   
    ./WhiteScreenMacOsApp
   
