#include "App.h"

#include <glfw/glfw3.h>

namespace gameplay
{

App::App(int argc, char** argv) 
	: _argc(argc), _argv(argv)
{
}

App::~App()
{
}

int App::exec()
{
	return 0;
}

void App::exit(int code)
{
}

uint64_t App::get_app_pid()
{
	return 0;
}

const char* App::get_app_dir_path()
{
	return nullptr;
}

const char* App::get_app_file_path()
{
	return nullptr;
}

int App::get_app_argc()
{
	return _argc;
}

char** App::get_app_argv()
{
	return _argv;
}



}