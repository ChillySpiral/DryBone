#include <DryBone.h>

class Sandbox : public DryBone::Application
{
public:
	Sandbox()
	{
		
	}

	~Sandbox()
	{
		
	}
};

DryBone::Application* DryBone::CreateApplication()
{
	return new Sandbox();
}