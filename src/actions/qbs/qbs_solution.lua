--
-- GENie - Project generator tool
-- https://github.com/bkaradzic/GENie#license
--

local qbs = premake.qbs

function qbs.generate_solution(sln)

	_p('/*')
	_p(' * QBS project makefile autogenerated by GENie')
	_p(' * https://github.com/bkaradzic/GENie')
	_p(' */')
	_p('')
	_p('import qbs')
	_p('')

	_p(0, 'Project {')

	_p(1, 'references: [')
	for prj in premake.solution.eachproject(sln) do
		_p(2, '"' .. prj.name .. '.qbs",')
	end
	_p(1, ']')

	_p(0, '}')
end
