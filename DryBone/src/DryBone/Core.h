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

#ifdef DB_ENABLE_ASSERTS
	#define DB_ASSERT(x, ...) { if(!(x)) { HZ_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define DB_CORE_ASSERT(x, ...) { if(!(x)) { HZ_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define DB_ASSERT(x, ...)
	#define DB_CORE_ASSERT(x, ...)
#endif


#define BIT(x) (1 << x)