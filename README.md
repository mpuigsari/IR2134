# 🤖 IR2134 - Cooperative Robots · RMF Simulation Projects

This repository contains two simulation-based ROS 2 projects developed for the course **IR2134 - Cooperative Robots**, part of the **Bachelor’s Degree in Robotic Intelligence** at *Universitat Jaume I*. These projects showcase how to use **Open-RMF (Robot Middleware Framework)** to simulate and coordinate fleets of mobile robots in complex, multi-floor environments.

> The projects focus on real-world challenges in multi-robot cooperation, such as navigation, fleet coordination, task dispatching, and interaction with doors, lifts, and cleaning zones.

---

## 🧭 Project Highlights

### 🏛️ [RMF Library Project](./rmf_library) (UJI Library Simulation)
- Simulates the **Library building at UJI** across **five floors** (4 full + 1 partial)
- Features **two fleets**: `TinyRobot` and `CleanerRobotA`
- Includes lifts, doors, and zone-based task assignment
- Demonstrates multi-floor patrols and cleaning missions with animated task results (GIFs)

### 🏢 [RMF Custom Maps](./exam_ws/)
- Includes multiple simulated environments (`roscon`, `test1`, and `td`)
- Integrates Open-RMF with custom maps featuring lifts and doors
- Simulates robot fleets navigating and performing tasks in multi-floor layouts
- Supports **patrol and cleaning task execution**, as well as **RMF Web Dashboard integration**

---

## 🚀 Features Demonstrated

- Multi-fleet coordination and task assignment using Open-RMF
- Complex environment modeling with realistic navigation constraints
- Cleaning and patrol task dispatch via CLI or Web Dashboard
- Use of ROS 2 Jazzy, Gazebo Harmonic, and Dockerized RMF workflows

---

## ⚙️ System Requirements

- **Ubuntu 24.04 LTS**
- **ROS 2 Jazzy**
- **Gazebo Harmonic**
- **Open-RMF (Demos or Docker setup)**

---

## 🧪 Development Skills Applied

- ROS 2 launch file creation and simulation integration
- Map building with doors, lifts, zones, and multi-floor transitions
- Docker workflows with rocker and RMF demos images
- Use of RMF Web Dashboard and task API server
- Collaborative development using sparse checkout and isolated ROS 2 packages

---

## 📘 Course Context

**Course**: IR2134 - Cooperative Robots  
**Instructor**: Enric Cervera Mateu  
**Year**: 4th year (Semester 2)  
**Topics Covered**:
- Distributed multi-robot systems
- Cooperative navigation and task planning
- ROS 2 middleware and simulation tools
- Fleet coordination and real-time control systems

---

## 👨‍💻 Author

**[Max Puig Sariñena](https://github.com/mpuigsari)**  
Bachelor’s Degree in Robotic Intelligence  
Universitat Jaume I

---

> Feel free to explore each folder for more detailed usage instructions, launch examples, and demo media!
