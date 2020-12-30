#pragma once

#include <cstdint>

namespace gameplay
{

/**
 * The main application.
 *
 * Controls the application runtime control flow and settings. 
 */
class App
{
public:
	/**
	 * Contructor.
	 *
	 * @param argc The number of arguments from main entry.
	 * @param arcv The array of string arguments from the main entry.
	 */
	App(int argc, char** argv);

	/**
	 * Destructor.
	 */
	virtual ~App();

	/**
	 * Runs the main event loop and waits until exit() is called.
	 */
	int exec();

	/**
	 * 
	 */
	void exit(int code = 0);

	/**
	 * 
	 */
	uint64_t get_app_pid();

	/**
	 * 
	 */
	const char* get_app_dir_path();

	/**
	 * 
	 */
	const char* get_app_file_path();

	/**
	 * 
	 */
	int get_app_argc();

	/**
	 * 
	 */
	char** get_app_argv();

private:
	App() = default;
	App(const App& app) = default;
	int _argc = 0;
	char** _argv = nullptr;
};
}