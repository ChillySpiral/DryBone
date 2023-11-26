#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/fmt/ostr.h"

namespace DryBone
{
	class DRY_BONE_API Log
	{
	public:
		static void Init();
		inline  static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline  static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core log macros
#define DB_CORE_FATAL(...)::DryBone::Log::GetCoreLogger()->fatal(__VA_ARGS__)
#define DB_CORE_ERROR(...)::DryBone::Log::GetCoreLogger()->error(__VA_ARGS__)
#define DB_CORE_WARN(...)::DryBone::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define DB_CORE_INFO(...)::DryBone::Log::GetCoreLogger()->info(__VA_ARGS__)
#define DB_CORE_TRACE(...)::DryBone::Log::GetCoreLogger()->trace(__VA_ARGS__)

// Client log macros
#define DB_FATAL(...)::DryBone::Log::GetClientLogger()->fatal(__VA_ARGS__)
#define DB_ERROR(...)::DryBone::Log::GetClientLogger()->error(__VA_ARGS__)
#define DB_WARN(...)::DryBone::Log::GetClientLogger()->warn(__VA_ARGS__)
#define DB_INFO(...)::DryBone::Log::GetClientLogger()->info(__VA_ARGS__)
#define DB_TRACE(...)::DryBone::Log::GetClientLogger()->trace(__VA_ARGS__)