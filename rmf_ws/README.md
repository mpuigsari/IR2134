# RMF Custom Project

## Overview

This repository contains a simple **Open-RMF** project implementing two custom maps: **test1** and **roscon**, based on `rmf_demos`. The project integrates **RMF Dashboard tasks** and provides simulation environments where **TinyRobots** operate across multi-floor buildings with doors and lifts.

## System Requirements

This project was built and tested on:

- **Ubuntu 24.04 LTS**
- **ROS 2 Jazzy**
- **Gazebo Harmonic**

## Installation

This project requires a **sourced RMF workspace** to function correctly. You can achieve this in two ways:

### 1. **Native RMF Installation**

Follow the **[installation instructions](https://github.com/open-rmf/rmf?tab=readme-ov-file#installation-instructions)** to install RMF natively. After installation, your workspace (`rmf_ws`) will contain `rmf` and `rmf_demos`.

After sourcing the RMF workspace, you need to **clone and build this project** inside the RMF workspace:

```bash
# Source the RMF workspace
source ~/rmf_ws/install/setup.bash

# Navigate to the RMF workspace
cd ~/rmf_ws/src

# Clone the project folder from the repository
git clone --depth 1 --filter=blob:none --sparse --no-checkout https://github.com/mpuigsari/IR2134.git .
git sparse-checkout set rmf_ws/src/project
git checkout



# Build the project
cd ~/rmf_ws
colcon build --symlink-install

# Source the workspace again to include the project
source ~/rmf_ws/install/setup.bash
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
  --volume $(pwd)/rmf_ws:/home/usuario/rmf_ws --\
  ghcr.io/open-rmf/rmf/rmf_demos:latest \
    bash

# Inside the container, navigate to project source
cd /home/usuario/rmf_ws/src/project

# Build the project
colcon build --symlink-install

# Source the workspace
source /home/usuario/rmf_ws/install/setup.bash
```

## Simulation Environments

This project provides two simulated environments:

### **1. test1 Map**
- Contains **one fleet** with **one TinyRobot**
- **2 floors**, with **doors and lifts**
- **Limited space** between door and lift

### **2. roscon Map**
- Contains **one fleet** with **two TinyRobots**
- **2 floors**, with **doors and lifts**
- Allows **task execution using the RMF Dashboard**

### **3. td Map**
- Contains **two fleets**: 
  - **TinyRobot** fleet with **four robots** (`tinyRobot1`, `tinyRobot2`, `tinyRobot3`, `tinyRobot4`)
  - **CleanerRobotA** fleet with **three robots** (`cleanerBotA_0`, `cleanerBotA_1`, `cleanerBotA_2`)
- **3 floors**:
  - **2 complete floors** and **1 partial floor** of the **TD building** from **University Jaume I**
- Features:
  - **4 lifts**
  - **Multiple doors** and **lanes** for complex navigation
  - Dedicated **cleaning zones**
  - **Delivery dispensers** and **ingesters** (delivery currently non-functional)


### **Launching the Simulation**

To launch the simulation in Gazebo and RViz, use:

```bash
# Launch test1 map
ros2 launch project_simulation test1.launch.xml

# Launch roscon map
ros2 launch project_simulation roscon.launch.xml
```
```bash
# Launch td map
ros2 launch project_simulation td.launch.xml
```

![Snapshot of roscon map](/media/roscon_map.png)

**Note:** In order to ensure a smooth workflow, after launching the world, wait until the Gazebo world is fully loaded before proceeding with further steps.

## Task Execution

This project currently supports **Loop** tasks.

### **Example Task Execution**

By sourcing `rmf_demos` natively or using the **Docker environment provided by rmf_demos**, you can dispatch tasks:

```bash
# roscon map
ros2 run rmf_demos_tasks dispatch_patrol -p left_corridor_1 right_corridor_1 -n 2 --use_sim_time
```
```bash
# td map
ros2 run rmf_demos_tasks dispatch_patrol -p TD1107AL TD1016AA -n 2 --use_sim_time
```

_(Note: The **test1** map does not support task execution due to the limited space between the door and lift.)_

## Web Dashboard Integration

By using the **Docker images from rmf_demos**, you can integrate the **RMF Web Dashboard**.

### **Starting the RMF Web Dashboard**

_Open 3 terminals in the following order to ensure a smooth workflow:_

**Terminal 1:** _(Launch the simulation with Web Dashboard integration)_
```bash
#Only in Native
source /opt/ros/jazzy/setup.bash
source rmf_ws/install/setup.bash
source IR2134/rmf_ws/src/project/install/setup.bash
export ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST
```
```bash
ros2 launch project_simulation roscon.launch.xml server_uri:="ws://localhost:8000/_internal"
```
```bash
ros2 launch project_simulation td.launch.xml server_uri:="ws://localhost:8000/_internal"
```

**Terminal 2:** _(Start the API Server)_
```bash
docker run --network host -it \
  -e ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST \
  -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp \
  ghcr.io/open-rmf/rmf-web/api-server:latest
```

**Terminal 3:** _(Start the Frontend Dashboard)_
```bash
docker run --network host -it \
  -e RMF_SERVER_URL=http://localhost:8000 \
  -e TRAJECTORY_SERVER_URL=ws://localhost:8006 \
  ghcr.io/open-rmf/rmf-web/dashboard:latest
```

Now, you can monitor ongoing tasks and interact with the robots via the web interface!

![Example roscon map tasks](/media/example_tasks.gif)

![Example td map tasks](/media/td.gif)


