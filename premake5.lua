workspace "DryBone"
	architecture 'x64'

	configurations {
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "DryBone/vendor/GLFW/include"

include "DryBone/vendor/GLFW"

project "DryBone"
	location "DryBone"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "dbpch.h"
	pchsource "DryBone/src/dbpch.cpp"

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs {
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links {
		"GLFW",
		"opengl32.lib",
		"dwmapi.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "Off"
		systemversion "latest"

		defines {
			"DRY_BONE_PLATFORM_WINDOWS",
			"DRY_BONE_BUILD_DLL"
		}

		postbuildcommands {
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "DRY_BONE_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "DRY_BONE_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "DRY_BONE_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs {
		"DryBone/vendor/spdlog/include",
		"DryBone/src"
	}

	links {
		"DryBone"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"DRY_BONE_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "DRY_BONE_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "DRY_BONE_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "DRY_BONE_DIST"
		optimize "On"