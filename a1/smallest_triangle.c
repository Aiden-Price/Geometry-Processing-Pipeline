// Searcher Program

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define
# define BUFFER_SIZE 1024

typedef struct {
    float x;
    float y;
} Point;

// Euclidean Distance Formula
float euclidean_distance(Point p1, Point p2) {
    return sqrtf(powf(p1.x - p2.x, 2) + powf(p1.y - p2.y, 2));
}

// Area of a triangle (calculated with 3 points)
float area_of_triangle(Point p1, Point p2, Point p3) {
    return fabs((p1.x*(p2.y-p3.y) + p2.x*(p3.y-p1.y) + p3.x*(p1.y-p2.y)) / 2.0);
}

int main(){
    char buffer[BUFFER_SIZE];
    float x, y;
    int number_points = 0;
    Point points[1000];

    // Reading stdin input
    while (fgets(buffer, BUFFER_SIZE, stdin) != NULL && number_points < 1000) {
        if (sscanf(buffer, "%f, %f", &x, &y) == 2) {

            //Storing the point value
            points[number_points].x = x;
            points[number_points].y = y;
            number_points++;

        } else {
            printf("Invalid input format\n");
        }
    }

    // Printing the amount of points read
    printf("read %d points\n", number_points);

    float minimum_sum = INFINITY;
    Point closest_points[3];

    // Searching for 3 Closest Points 
    for (int i = 0; i < number_points - 2; i++) {
        for (int j = i + 1; j < number_points - 1; j++) {
            for (int k = j + 1; k < number_points; k ++) {
                float distance = euclidean_distance(points[i], points[j]) + euclidean_distance(points[j], points[k]) + euclidean_distance(points[k], points[i]);
                if (distance < minimum_sum) {
                    minimum_sum = distance;
                    closest_points[0] = points[i];
                    closest_points[1] = points[j];
                    closest_points[2] = points[k];
                }
            }
        }
    }

    // Error Handling for not enough points
    if (number_points < 3) {
        for (int i = 0; i < number_points; i++) {
            printf("%.2f, %.2f\n", points[i].x, points[i].y);
        }
        printf("This is not a triangle\n");
        exit(1);
    }

    // Printing the points
    for (int i = 0; i < 3; i++) {
        printf("%.2f, %.2f\n", closest_points[i].x, closest_points[i].y);
    }


    // Calculating if a Triangle is Formed
    float area_of_points = area_of_triangle(closest_points[0], closest_points[1], closest_points[2]);

    // Checking if area is greater 0.001 to form a valid triangle
    if (area_of_points > 0.001) {
        printf("This is a triangle\n");
    } else {
        printf("This is not a triangle\n");
    }

    return 0;
}

