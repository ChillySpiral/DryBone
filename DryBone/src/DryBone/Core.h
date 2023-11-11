#pragma once

#ifdef DRY_BONE_PLATFORM_WINDOWS
	#ifdef DRY_BONE_BUILD_DLL
		#define DRY_BONE_API __declspec(dllexport)
	#else
		#define DRY_BONE_API __declspec(dllimport)
	#endif
#else
	#error Dry Bone only supports Windows
#endif
