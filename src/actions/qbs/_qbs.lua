--
-- GENie - Project generator tool
-- https://github.com/bkaradzic/GENie#license
--

premake.qbs = { }

local qbs = premake.qbs

newaction
{
	-- Metadata for the command line and help system
	trigger     = "qbs",
	shortname   = "qbs",
	description = "Generate QBS build files",
	module      = "qbs",

	-- The capabilities of this action
	valid_kinds     = {"ConsoleApp", "WindowedApp", "SharedLib", "StaticLib"},
	valid_languages = {"C", "C++"},
	valid_tools     = {
		cc = { "gcc" },
	},

	-- Solution and project generation logic
	onsolution = function(sln)
		io.eol    = "\n"
		io.indent = "\t"
		io.escaper(qbs.esc)
		premake.generate(sln, sln.name .. ".solution.qbs", qbs.generate_solution)
	end,

	onproject = function(prj)
		io.eol    = "\n"
		io.indent = "\t"
		io.escaper(qbs.esc)
		premake.generate(prj, prj.name .. ".qbs", qbs.generate_project)
	end,
}
