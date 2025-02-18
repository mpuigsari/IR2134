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

# Clone only the project folder from the repository
git clone --depth 1 --filter=blob:none --sparse <your_project_repo_link>
cd project

# Build the project
cd ~/rmf_ws
colcon build --symlink-install

# Source the workspace again to include the project
source ~/rmf_ws/install/setup.bash
```

### 2. **Using the RMF Docker Image**

Instead of a native installation, you can **install and build this project inside the RMF Docker environment**.

```bash
# Run the RMF Docker container
cd ~/rmf_ws

docker run -it --rm \
  --network host \
  --volume ~/rmf_ws:/root/rmf_ws \
  osrf/rmf:latest /bin/bash

# Inside the container, clone and build the project
cd ~/rmf_ws/src

git clone <your_project_repo_link>
cd ~/rmf_ws
colcon build --symlink-install

# Source the workspace
source ~/rmf_ws/install/setup.bash
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

### **Launching the Simulation**

To launch the simulation in Gazebo and RViz, use:

```bash
# Launch test1 map
ros2 launch project_simulation test1.launch.xml

# Launch roscon map
ros2 launch project_simulation roscon.launch.xml
```

**Note:** In order to ensure a smooth workflow, after launching the world, wait until the Gazebo world is fully loaded before proceeding with further steps.

## Task Execution

This project currently supports **Loop** tasks.

### **Example Task Execution**

By sourcing `rmf_demos` natively or using the **Docker environment provided by rmf_demos**, you can dispatch tasks:

```bash
ros2 run rmf_demos_tasks dispatch_patrol -p left_corridor_1 right_corridor_1 -n 2 --use_sim_time
```

### **Screenshots of Tasks in Execution**

_Screenshots of the **roscon** map executing tasks will be displayed here._

_(Note: The **test1** map does not support task execution due to the limited space between the door and lift.)_

## Web Dashboard Integration

By using the **Docker images from rmf_demos**, you can integrate the **RMF Web Dashboard**.

### **Starting the RMF Web Dashboard**

_Open 3 terminals in the following order to ensure a smooth workflow:_

**Terminal 1:** _(Launch the simulation with Web Dashboard integration)_
```bash
ros2 launch project_simulation roscon.launch.xml server_uri:="ws://localhost:8000/_internal"
```

**Terminal 2:** _(Start the API Server)_
```bash
docker run \
  --network host \
  -it \
  -e ROS_DOMAIN_ID=<ROS_DOMAIN_ID> \
  -e RMW_IMPLEMENTATION=<RMW_IMPLEMENTATION> \
  ghcr.io/open-rmf/rmf-web/api-server:latest
```

**Terminal 3:** _(Start the Frontend Dashboard)_
```bash
docker run \
  --network host \
  -it \
  ghcr.io/open-rmf/rmf-web/dashboard:latest
```

Now, you can monitor ongoing tasks and interact with the robots via the web interface!
