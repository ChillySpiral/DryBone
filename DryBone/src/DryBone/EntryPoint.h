#pragma once

#include "../DryBone.h"

#ifdef DRY_BONE_PLATFORM_WINDOWS

extern DryBone::Application* DryBone::CreateApplication();

int main(int argc, char** argv)
{
	DryBone::Log::Init();
	DB_CORE_WARN("Initialized Log!");

	auto app = DryBone::CreateApplication();
	app->Run();
	delete app;
}
#endif
