local _files =
{
	"imconfig.h",
	"imgui.h",
	"imgui.cpp",
	"imgui_draw.cpp",
	"imgui_internal.h",
	"imgui_tables.cpp",
	"imgui_widgets.cpp",
	"imstb_rectpack.h",
	"imstb_textedit.h",
	"imstb_truetype.h",
	"imgui_demo.cpp",
	"backends/imgui_impl_glfw.cpp",
	"backends/imgui_impl_glfw.cpp",
	"backends/imgui_impl_opengl3.h",
	"backends/imgui_impl_opengl3.cpp",
    "backends/imgui_impl_vulkan.h",
	"backends/imgui_impl_vulkan.cpp",
    "backends/imgui_impl_dx12.h",
    "backends/imgui_impl_dx12.cpp"
}

local _includedirs =
{
	".",
	"./backends",
	"../GLFW/include",
	"%{includeDir.VulkanSDK}",
}

group "Dependencies"
	project "ImGui"
		kind "StaticLib"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"
		architecture "x64"
        disablewarnings { "4996", "4005" }
		targetdir ("%{wks.location}/bin/" .. outputdir)
		objdir ("%{wks.location}/obj/" .. tmpdir)

		files(_files)
		includedirs(_includedirs)

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"
			optimize "Off"

		filter "configurations:Release"
			runtime "Release"
			optimize "full"

group ""
