# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/usuario/IR2134/rmf_ws/src/project/project_maps

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/usuario/IR2134/rmf_ws/src/project/build/project_maps

# Utility rule file for generate_roscon_nav_graphs.

# Include any custom commands dependencies for this target.
include CMakeFiles/generate_roscon_nav_graphs.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/generate_roscon_nav_graphs.dir/progress.make

CMakeFiles/generate_roscon_nav_graphs: maps/roscon/nav_graphs/phony

maps/roscon/nav_graphs/phony: /home/usuario/IR2134/rmf_ws/src/project/project_maps/maps/roscon/roscon.building.yaml
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/usuario/IR2134/rmf_ws/src/project/build/project_maps/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating maps/roscon/nav_graphs/phony"
	ros2 run rmf_building_map_tools building_map_generator nav /home/usuario/IR2134/rmf_ws/src/project/project_maps/maps/roscon/roscon.building.yaml /home/usuario/IR2134/rmf_ws/src/project/build/project_maps/maps/roscon/nav_graphs/

generate_roscon_nav_graphs: CMakeFiles/generate_roscon_nav_graphs
generate_roscon_nav_graphs: maps/roscon/nav_graphs/phony
generate_roscon_nav_graphs: CMakeFiles/generate_roscon_nav_graphs.dir/build.make
.PHONY : generate_roscon_nav_graphs

# Rule to build all files generated by this target.
CMakeFiles/generate_roscon_nav_graphs.dir/build: generate_roscon_nav_graphs
.PHONY : CMakeFiles/generate_roscon_nav_graphs.dir/build

CMakeFiles/generate_roscon_nav_graphs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/generate_roscon_nav_graphs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/generate_roscon_nav_graphs.dir/clean

CMakeFiles/generate_roscon_nav_graphs.dir/depend:
	cd /home/usuario/IR2134/rmf_ws/src/project/build/project_maps && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/usuario/IR2134/rmf_ws/src/project/project_maps /home/usuario/IR2134/rmf_ws/src/project/project_maps /home/usuario/IR2134/rmf_ws/src/project/build/project_maps /home/usuario/IR2134/rmf_ws/src/project/build/project_maps /home/usuario/IR2134/rmf_ws/src/project/build/project_maps/CMakeFiles/generate_roscon_nav_graphs.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/generate_roscon_nav_graphs.dir/depend

