include "msdfgen"

project "msdf-atlas-gen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"resource.h",
		"msdf-atlas-gen/*.h",
		"msdf-atlas-gen/*.hpp",
		"msdf-atlas-gen/*.cpp",
	}

	includedirs
	{
		"msdfgen"
	}

	links
	{
		"msdfgen"
	}

	defines
	{
		"MSDFGEN_PUBLIC=",
		"MSDF_ATLAS_PUBLIC=", -- static link
		"MSDF_ATLAS_NO_ARTERY_FONT",
		"_CRT_SECURE_NO_WARNINGS"
	}

	flags
	{
		"FatalCompileWarnings",
		"ShadowedVariables"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
		}

		libdirs
		{
		}

	filter "system:macosx"
		files
		{
		}

		includedirs
		{
		}

	filter "system:linux"
		files
		{
		}

		links
		{
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

		links
		{
		}

		libdirs
		{
		}

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols	"On"

		links
		{
		}

		libdirs
		{
		}

	filter "configurations:Dist"
		runtime "Release"
		optimize "Full"
		symbols "Off"

		links
		{
		}

		libdirs
		{
		}

	filter { "configurations:Release", "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}

	filter { "configurations:Dist", "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}
