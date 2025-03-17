# RMF Library Model

## Overview

This repository contains an **Open-RMF** simulation model of the **UJI Library**, featuring:

- Contains **two fleets**: 
  - **TinyRobot** fleet with **four robots** (`tinyRobot1`, `tinyRobot2`, `tinyRobot3`, `tinyRobot4`)
  - **CleanerRobotA** fleet with **three robots** (`cleanerBotA_0`, `cleanerBotA_1`, `cleanerBotA_2`)
- **5 floors**:
  - **4 complete floors** and **1 partial floor** of the **Library building** from **University Jaume I**
- Features:
  - **4 lifts**
  - **Multiple doors** and **lanes** for complex navigation
  - Dedicated **cleaning zones**

The robots navigate through the library to execute various tasks, including **patrols across multiple floors** and **cleaning operations**. The project includes **example task executions** demonstrated with **GIFs**.

## System Requirements

- **Ubuntu 24.04 LTS**
- **ROS 2 Jazzy**
- **Gazebo Harmonic**
- **Open-RMF Demos**

## Installation

This project requires a **sourced RMF workspace** to function correctly. You can achieve this in two ways:

### 1. **Native RMF Installation**

Follow the **[installation instructions](https://github.com/open-rmf/rmf?tab=readme-ov-file#installation-instructions)** to install RMF natively. After installation, your workspace (`exam_ws`) will contain `rmf` and `rmf_demos`.

After sourcing the RMF workspace, you need to **clone and build this project** inside the RMF workspace:

```bash
# Source the RMF workspace
source ~/exam_ws/install/setup.bash

# Navigate to the RMF workspace
cd ~/exam_ws/src

# Clone the project folder from the repository
git clone --depth 1 --filter=blob:none --sparse --no-checkout https://github.com/mpuigsari/IR2134.git .
git sparse-checkout set exam_ws/src/rmf_library
git checkout



# Build the project
cd ~/exam_ws
colcon build --symlink-install

# Source the workspace again to include the project
source ~/exam_ws/install/setup.bash
```

### 2. **Using the RMF Docker Image**

Instead of a native installation, you can **install and build this project inside the RMF Docker environment**.

```bash
# Clone the full repository
cd ~
git clone https://github.com/mpuigsari/IR2134.git

# Run the RMF Docker container with shared workspace
cd IR2134

rocker --nvidia --x11 --name rmf_demos \
  -e ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST \
  --network host --user \
  --volume $(pwd)/exam_ws:/home/usuario/exam_ws --\
  ghcr.io/open-rmf/rmf/rmf_demos:latest \
    bash

# Inside the container, navigate to project source
cd /home/usuario/exam_ws/src/rmf_library

# Build the project
colcon build --symlink-install

# Source the workspace
source /home/usuario/exam_ws/install/setup.bash
```
## Launching the Simulation

Launch the **library model** in Gazebo and RViz:

```bash
ros2 launch rmf_library library.launch.xml
```

![Library Floor Plan](/media/library.png)

## Task Execution

The project provides **5 example task executions**. Each task is executed using **ROS 2 commands**, with GIFs below to illustrate the results.

### **Task 1: Patrol Between Two Points**
```bash
ros2 run rmf_demos_tasks dispatch_patrol -p CD1101CP CD1001CP -n 3 --use_sim_time
```
![Task 1 Execution](/media/task1.gif)

### **Task 2: Cleaning Task**
```bash
ros2 run rmf_demos_tasks dispatch_clean -cs CD1216CW --use_sim_time
```
![Task 2 Execution](/media/task2.gif)

### **Task 3: Multi-Floor Patrol**
```bash
ros2 run rmf_demos_tasks dispatch_patrol -p CD1401BL CD1307BL CD1103BG -n 1 --use_sim_time
```
![Task 3 Execution](/media/task3.gif)

### **Task 4: Cleaning Task on Upper Floors**
```bash
ros2 run rmf_demos_tasks dispatch_clean -cs CD2303CW --use_sim_time
```
![Task 4 Execution](/media/task4.gif)

### **Task 5: Multi-Floor Patrol with Multiple Stops**
```bash
ros2 run rmf_demos_tasks dispatch_patrol -p CD2301BL CD1302BL CD1104BL CD1003BX -n 2 --use_sim_time
```
![Task 5 Execution](/media/task5.gif)
