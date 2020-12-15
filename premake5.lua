workspace "gameplay"

    local platform = "%{cfg.system}-%{cfg.platform}"
    local target_dir = "_build/"..platform.."/%{cfg.buildcfg}"
    local workspace_dir = "_compiler/".._ACTION
    local deps_dir = "_deps"

    configurations { "debug", "release" }
    startproject "gameplay.editor"
    location (workspace_dir)
    targetdir (target_dir)
    objdir("_build/tmp/%{cfg.system}/%{prj.name}")
    symbols "On"
    exceptionhandling "Off"
    rtti "On"
    staticruntime "On"
    flags { "FatalCompileWarnings", "MultiProcessorCompile", "NoPCH", "UndefinedIdentifiers", "NoIncrementalLink" }
    cppdialect "C++14"
    includedirs { deps_dir, "include" }
    filter { "system:windows" }
        platforms { "x86_64" }
        files { ".editorconfig" }
        editandcontinue "Off"
        symbols "Full"
        buildoptions { "/utf-8", "/bigobj" }
        buildoptions { "/permissive-" }
        buildoptions { "/WX" }
        warnings "Extra"
        disablewarnings { "4100", "4127", "4201" }
    filter { "system:linux" }
        platforms { "x86_64" }
        defaultplatform "x86_64"
        buildoptions { "-fvisibility=hidden -D_FILE_OFFSET_BITS=64" }
        linkoptions { "-Wl,-rpath, '$$ORIGIN' -Wl, --export-dynamic" }
        enablewarnings { "all", "vla" }
        disablewarnings { "error=unused-variable" }
    filter { "system:linux", "configurations:debug" }
        buildoptions { "-fstack-protector-strong" }
    filter { "platforms:x86_64" }
        architecture "x86_64"
    filter { "configurations:debug", "system:windows" }
        optimize "Off"
    filter { "configurations:debug", "system:linux" }
        optimize "Off"
    filter  { "configurations:release" }
        defines { "NDEBUG" }
    filter  { "configurations:release", "system:windows" }
        optimize "Speed"
    filter { "configurations:release", "system:linux" }
        optimize "On"
    filter {}

    project "gameplay.filesystem"
        kind "SharedLib"
        location (workspace_dir.."/%{prj.name}")

    project "gameplay.windowing"
        kind "SharedLib"
        location (workspace_dir.."/%{prj.name}")

    project "gameplay.editor"
        kind "ConsoleApp"
        location (workspace_dir.."/%{prj.name}")
        files { "source/gameplay.editor/main.cpp" }
        vpaths { [''] = "source/gameplay.editor/*.*" }
        filter { "system:linux" }
            buildoptions { "-pthread" }
            links { "dl", "pthread" }
            disablewarnings { "error=unused-function" }
        filter {}

