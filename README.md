# lwa
lua-for-win-stable
LWA
LWA is a lightweight toolkit designed to simplify working with Lua environments on Windows while reducing the complexity of building native Lua libraries.

---

![LWA Icon](asset/icon.png)

About the Project

Hello, I’m DASKR, the developer of this project.

While working with Lua and Lua-based tools, I encountered a common problem that many developers face: building Lua modules on Windows is complicated. Many libraries require a proper C/C++ toolchain, and different compilers often introduce compatibility issues.

I attempted to move away from the traditional Visual Studio build environment and tried several alternatives, including:

- TCC (Tiny C Compiler)
- Clang
- MinGW

However, after spending a long time testing and troubleshooting, I discovered that these solutions introduced many problems, especially when compiling Lua libraries that depend on complex build processes.

Because I care about the end user experience, my goal was to make the process easier for normal users who just want to install and use Lua libraries without spending hours fixing compilation errors.

---

The Solution

After extensive experimentation, I managed to solve around 90% of the issues related to LuaRocks and building Lua modules.

The current approach focuses on stability and compatibility rather than replacing the entire toolchain.

At the moment, the project includes the essential libraries and tools needed to run Lua projects smoothly, while still allowing users to install most Lua libraries normally.

If a library requires compilation, the recommended solution is simple:

1. Install Visual Studio.
2. Install the C++ development tools.
3. Use the cl.exe compiler provided by Visual Studio.

The reason for this choice is simple:

"cl.exe" causes significantly fewer build problems compared to other compilers on Windows.

---

Project Goals

The main goal of LWA is to provide a simplified Lua development environment that:

- Reduces common build errors
- Makes LuaRocks easier to use
- Provides a cleaner development workflow
- Supports Windows users who struggle with compiling Lua libraries

This project is focused on practical usability, especially for developers who want to start working with Lua quickly.

---

Current Status

The project is currently functional and already solves most LuaRocks-related issues.

Features currently available include:

- Basic runtime setup
- Core Lua libraries
- LuaRocks compatibility improvements
- Simplified environment configuration

---

Future Plans

The project is still evolving, and many new features are planned.

Some upcoming ideas include:

- A plugin system for tools
- A Lua development toolkit
- Better dependency management
- Improved LuaRocks integration
- Additional developer utilities
- Performance improvements

The goal is to gradually transform LWA into a complete Lua development toolkit for Windows.

---

Installer

An installer (.exe) has been created for the project to make installation easier for users.

Instead of manually configuring the environment, users will be able to install everything through a simple installer.

This will allow:

- Quick setup
- Automatic configuration
- Easier onboarding for new users

---

Philosophy

This project follows a simple philosophy:

«Development tools should be simple, stable, and accessible to everyone.»

Many Lua developers on Windows struggle with configuration issues.
LWA aims to remove those barriers and provide a smoother experience.

---

Author

DASKR

Developer and creator of this project.

---

License

This project is released under the MIT License.
