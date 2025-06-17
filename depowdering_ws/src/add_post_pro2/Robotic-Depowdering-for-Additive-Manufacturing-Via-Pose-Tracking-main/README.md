# Robotic-Depowdering-for-Additive-Manufacturing-Via-Pose-Tracking

## Installation
#### Download bag files
https://drive.google.com/file/d/1dc79u48Q7_P1xRy25ID9Uiu5ra2vjj2U/view?usp=sharing

#### Download project files
```
git clone git@github.com:zhenweil/Robotic-Depowdering-for-Additive-Manufacturing-Via-Pose-Tracking.git
```
#### Compile project
Navigate to the project root folder and run
```
catkin_make
source devel/setup.bash
```
## Run project
#### Start pose tracking
```
roslaunch robotic_depowdering pipe.launch
```
#### Start path planning
```
roslaunch robotic_depowdering path_planning.launch
```
#### Run bag file
```
rosbag play ${path-to-bag-file}
```
## Links
#### Links to paper
https://ieeexplore.ieee.org/document/9847016 <br />
or <br />
https://arxiv.org/abs/2207.04196

#### Link to demo:
https://www.youtube.com/watch?v=AUIkyULAhqM 
