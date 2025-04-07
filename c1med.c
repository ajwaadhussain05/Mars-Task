//Built a system for the rover Brick to detect a red marker using a front-mounted camera and navigate to it.
#include <stdio.h> 
#include <math.h>  

//fxn to calculate the dist between two points in 3D space
double distance(double x, double y, double z, double x1, double y1, double z1) {
    // calculate the dist using the Euclidean distance formula
    return sqrt(pow(x1 - x, 2) + pow(y1 - y, 2) + pow(z1 - z, 2));
}

int main() {
    //coordinates of the marker
    double x_marker = 0;   // X-coordinate of the marker
    double y_marker = 0;   // Y-coordinate of the marker
    double z_marker = -60;  // Z-coordinate of the marker (depth)

    //assign the marker coordinates to variables for distance cal
    double x = x_marker, y = y_marker, z = z_marker;

    //calculate the distance from the camera to the marker before changing the navigation reference
    int dist_before = distance(x, y, z, x_marker, y_marker, z_marker);
    printf("The distance between the marker and camera before changing the navigation reference: %lf\n", dist_before);

    //adjust the Z-coordinate to correct the navigation reference
    double z_final = z_marker + 55;  // New Z-coordinate after correction

    printf("The corrected coordinates are:(%.3lfcm, %.3lfcm, %.3lfcm)\n", x, y, z_final);

    //cal the distance from the camera to the marker after changing the navigation reference
    double dist_after = distance(x, y, z, x_marker, y_marker, z_final);
    printf("The distance between the marker and camera after changing the navigation reference: %lf\n", dist_after);

    return 0;
}
