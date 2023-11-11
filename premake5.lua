workspace "DryBone"
	architecture "x64"
	
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
	
project "DryBone"
	location "DryBone"
	kind "SharedLib"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.22621.0"
		
		
		defines
		{
			"DRY_BONE_PLATFORM_WINDOWS",
			"DRY_BONE_BUILD_DLL"
		}
		
		postbuildcommands
		{
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
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"DryBone/vendor/spdlog/include",
		"DryBone/src"
	}
	
	links
	{
		"DryBone"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.22621.0"
		
		
		defines
		{
			"DRY_BONE_PLATFORM_WINDOWS",
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