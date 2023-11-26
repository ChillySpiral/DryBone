#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace DryBone
{
	Application::Application()
	{
		
	}

	Application::~Application()
	{
		
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			DB_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			DB_TRACE(e);
		}

		while (true);
	}

}
